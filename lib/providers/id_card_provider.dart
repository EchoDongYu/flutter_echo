import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:go_router/go_router.dart';

enum PicType {
  front(1), // 正面
  back(2), // 反面
  album(1), // 相册
  camera(2); // 拍照

  final int value;

  // 构造函数
  const PicType(this.value);
}

enum UploadImageStatus {
  notStarted, // 未开始
  inProgress, // 上传中
  success, // 上传成功
  failed, // 上传失败
}

class IdCardModel extends BaseProvider {
  PicType mPicType = PicType.front;
  PicType mPicResource = PicType.camera;

  //正面图片url
  String? get mFontUrl => _mFontUrl;
  String? _mFontUrl;
  UploadImageStatus _mFontUploadStatus = UploadImageStatus.notStarted;
  UploadImageStatus get mFontUploadStatus => _mFontUploadStatus;

  //反面图片url
  String? get mBackUrl => _mBackUrl;
  String? _mBackUrl;
  UploadImageStatus get mBackUploadStatus => _mBackUploadStatus;
  UploadImageStatus _mBackUploadStatus = UploadImageStatus.notStarted;


  String? nameOcr;
  String? idNumOcr;
  int? birthdayOcr;
  int? genderOcr;

  /// applyid
  String? oj603uOApplyId;



  //提交授信影像的bean
  PhotoSubmitReq photoSubmitReq = PhotoSubmitReq();

  static Map<String, List<DictItem>?>? _stepItems;


  //设置缓存
  void cacheIdCardInfo({
    required String? name,
    required String? idNumber,
    required int? birthday,
    required int? gender,
  }) {
    photoSubmitReq = photoSubmitReq.copyWith(
      su31n2OIdFrontUrl: _mFontUrl,
      plutusOIdBackUrl: _mBackUrl,
      oj603uOApplyId: oj603uOApplyId,
      attributionSubOIdCardNum: idNumber,
      name: name,
      gargetOBirthday: birthday,
      loanParam001OGender: gender,
    );
  }

  //读取缓存
  PhotoSubmitReq? getCachedData() {
    final json = LocalStorage().getObject(AppConst.kycOcrDataKey);
    if (json != null) {
      photoSubmitReq = PhotoSubmitReq.fromJson(json);
      if (photoSubmitReq.plutusOIdBackUrl != null) {
        _mBackUrl = photoSubmitReq.plutusOIdBackUrl;
      }
      if (photoSubmitReq.su31n2OIdFrontUrl != null) {
        _mFontUrl = photoSubmitReq.su31n2OIdFrontUrl;
      }
      if (photoSubmitReq.oj603uOApplyId != null) {
        oj603uOApplyId = photoSubmitReq.oj603uOApplyId;
      }
    }
    return photoSubmitReq;
  }

  //缓存在本地
  @override
  void dispose() {
    LocalStorage().set(AppConst.kycOcrDataKey, photoSubmitReq);
    super.dispose();
  }

  //获取字典项
  Future<Map<String, List<DictItem>?>?> getDictionary() async {
    if (_stepItems?.isNotEmpty == true) return _stepItems;
    return await launchRequest(() async {
      final apiResult = await Api.getDictionary('0');
      _stepItems = apiResult;
      return apiResult;
    });
  }

  Future<String?> base64Str2(Uint8List? photo) async {
    final data = photo;
    if (data == null) return null;

    final compressData = await FlutterImageCompress.compressWithList(
      data,
      minHeight: 1920,
      minWidth: 1080,
      quality: 85,
    );
   // final compressData = await compressToTargetSize(data);
    return base64Encode(compressData);
  }


  //上传图片
  Future<void> uploadImage(
    Uint8List? photo,
    PicType picType,
    PicType picResource,
  ) async {
    mPicType = picType;
    mPicResource = picResource;

    final apiResult = await launchRequest(
      () async {
        final base64 = await base64Str2(photo);
        if (base64 == null) {
          return null;
        }
        List<String>? items = [];
        items.add(base64);
        final req = PicUploadReqReq(
          x01y7qOBase64String: items,
          ha3xp9OPicType: mPicType.value,
          provenanceOPicResource: mPicResource.value,
          waSmsOFaceCheck: 0,
          borrowFeeSumOWithoutCard: 0,
        );
        PicUploadReqResp$Data? resp=  await Api.imageUploads(req);
        return resp;
      },
      iWantHandler: true,
      onBlockError: (resp) {
        // debugPrint("erroorororror");
        // photoSubmitReq = photoSubmitReq.copyWith(
        //   attributionSubOIdCardNum: "erroorororror",
        // );

        updateUploadStatusAndUrl(
          picType: picType,
          status: UploadImageStatus.failed,
          url: null,
        );
      },
    );
    if (apiResult != null ) {
      List<String> urlList =
          apiResult.submissionTimeOPictureUrlList ?? [];
      if (urlList.isNotEmpty) {
        String? id = apiResult.oj603uOApplyId;
        if (id != null && id.isNotEmpty) {
          oj603uOApplyId = id;
        }
        updateUploadStatusAndUrl(
          picType: picType,
          status: UploadImageStatus.success,
          url: urlList[0],
        );
        //正反面照都成功
        if (isFontBackUploadSuccess()) {
          orcObergr(_mFontUrl ?? '', _mBackUrl ?? '');
        }
      }
    }
  }

  //证件orc
  Future<void> orcObergr(String fontUrl, String backUrl) async {
    final apiResult = await launchRequest(() async {
      final req = OcrReqReq(
        su31n2OIdFrontUrl: fontUrl,
        plutusOIdBackUrl: backUrl,
        is9e52OIdCardType: 2,
      );

      return await Api.orcObergr(req);
    });
    if (apiResult != null ) {
      OcrReqResp$Data reqResp = apiResult;
      nameOcr = reqResp.name;
      idNumOcr = reqResp.attributionSubOIdCardNum;
      birthdayOcr = reqResp.gargetOBirthday;
      genderOcr = reqResp.loanParam001OGender;
      // photoSubmitReq = photoSubmitReq.copyWith(
      //   attributionSubOIdCardNum: reqResp.data?.attributionSubOIdCardNum,
      //   name: reqResp.data?.name,
      //   gargetOBirthday: reqResp.data?.gargetOBirthday,
      //   loanParam001OGender: reqResp.data?.loanParam001OGender,
      // );
      notifyListeners();
    }
  }

  Future<void> submitPhoto({
    required String name,
    required String idNumber,
    required int birthday,
    required int gender,
  }) async {
    final apiResult = await launchRequest(
      () async {
        final req = photoSubmitReq.copyWith(
          su31n2OIdFrontUrl: _mFontUrl,
          plutusOIdBackUrl: _mBackUrl,
          oj603uOApplyId: oj603uOApplyId,
          attributionSubOIdCardNum: idNumber,
          name: name,
          gargetOBirthday: birthday,
          loanParam001OGender: gender,
        );
        return await Api.photoSubmit(req);
      },
      iWantHandler: true,
      onBlockError: (resp) {
        //todo 暂时先toast
        toast(resp.toString());
      },
    );

    if (apiResult != null) {
      //todo 提交成功
      //todo NavKey.count  倒计时时间 ，，不知道 有没有返回 先写死 35
      final uriRoute = Uri(
        path: AppRouter.stepProcess,
        queryParameters: {NavKey.count: 35},
      );
      navigate((context) => context.pushReplacement(uriRoute.toString()));
    }
  }

  void updateUploadStatusAndUrl({
    PicType picType = PicType.front,
    UploadImageStatus status = UploadImageStatus.notStarted,
    String? url,
  }) {
    //    _mFontUrl =
    //     "https://test-obs-fin.obs.af-south-1.myhuaweicloud.com:443/pe1170359577869549568_1_1759217016.jpg";
    //     notifyListeners();
    if (picType == PicType.front) {
      _mFontUploadStatus = status;
      _mFontUrl = url;
      debugLog("_mFontUrl:${_mFontUrl}");
    } else if (picType == PicType.back) {
      _mBackUploadStatus = status;
      _mBackUrl = url;
    }
    notifyListeners();
  }

  String fontTitle() {
    if (_mFontUploadStatus == UploadImageStatus.failed) {
      return "Haz clic para volver a subir";
    } else {
      return "Foto del frente del DPI";
    }
  }

  String backTitle() {
    if (_mBackUploadStatus == UploadImageStatus.failed) {
      return "Haz clic para volver a subir";
    } else {
      return "Foto del reverso del DPI";
    }
  }

  // 正反面照是否都上传成功
  bool isFontBackUploadSuccess() {
   // return _mFontUrl != null && _mBackUrl != null;
    return true;
  }
}




// 后台执行的图像压缩函数
// static Future<Uint8List> compressImage(Uint8List data) async {
//   return await FlutterImageCompress.compressWithList(
//     data,
//     minHeight: 1920,
//     minWidth: 1080,
//     quality: 85,
//   );
// }

// Future<Uint8List> compressToTargetSize(
//   Uint8List imageData, {
//   int targetSizeKB = 2000,
// }) async {
//   int quality = 85; // 初始质量
//   Uint8List? compressedData;
//
//   do {
//     compressedData = await FlutterImageCompress.compressWithList(
//       imageData,
//       quality: quality,
//       minWidth: 1080, // 根据需求调整
//       minHeight: 1920,
//     );
//
//     // 检查文件大小（单位：字节 → KB）
//     final sizeInKB = compressedData.lengthInBytes / 1024;
//     if (sizeInKB <= targetSizeKB) break;
//
//     // 未达标则降低质量
//     quality -= 5;
//   } while (quality >= 50); // 设置质量下限
//
//   return compressedData;
// }

// 主函数：压缩图像并返回 Base64 编码字符串
// Future<String?> base64Str(Uint8List? photo) async {
//   if (photo == null) return null;
//   debugLog('photo type: ${photo.runtimeType}');
//   // 使用 compute 将压缩操作移到后台执行
//   final compressData = await compute(compressImage, photo);
//
//   // 将压缩后的字节数据转换为 base64 字符串
//   return base64Encode(compressData);
// }