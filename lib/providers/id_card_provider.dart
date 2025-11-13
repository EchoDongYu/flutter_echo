import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/event/event_data.dart';
import 'package:flutter_echo/event/event_service.dart';
import 'package:flutter_echo/models/api_response.dart';
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
  face(3), // face
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

  bool? mFontBackUploadSuccess;

  UploadImageStatus _mFaceUploadStatus = UploadImageStatus.notStarted;

  UploadImageStatus get mFaceUploadStatus => _mFaceUploadStatus;

  //face url
  String? faceUrl1;
  String? faceUrl2;
  String? faceUrl3;

  //String? nameOcr;
  String? firstNameOcr;
  String? lastNameOcr;
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
    required String? f31u3kOEmail,
    required String? lastName,
    required String? firstName,
    required String? idNumber,
    required int? birthday,
    required int? gender,
  }) {
    photoSubmitReq = photoSubmitReq.copyWith(
      darktownOLastName: lastName,
      lq1s05OFirstName: firstName,
      su31n2OIdFrontUrl: _mFontUrl,
      plutusOIdBackUrl: _mBackUrl,
      oj603uOApplyId: oj603uOApplyId,
      attributionSubOIdCardNum: idNumber,
      gargetOBirthday: birthday,
      loanParam001OGender: gender,
      dripOSelfieUrl: faceUrl1,
      deviceImeiOSelfieUrl2: faceUrl2,
      partialCollectionOSelfieUrl3: faceUrl3,
      f31u3kOEmail: f31u3kOEmail,
    );
  }

  //读取缓存
  PhotoSubmitReq? getCachedData() {
    final json = LocalStorage().getObject(AppConst.kycOcrDataKey);
    if (json != null) {
      photoSubmitReq = PhotoSubmitReq.fromJson(json);
      if (photoSubmitReq.plutusOIdBackUrl != null) {
        //_mBackUrl = photoSubmitReq.plutusOIdBackUrl;
        updateUploadStatusAndUrl(
          picType: PicType.back,
          status: UploadImageStatus.success,
          url: photoSubmitReq.plutusOIdBackUrl,
        );
      }
      if (photoSubmitReq.su31n2OIdFrontUrl != null) {
        // _mFontUrl = photoSubmitReq.su31n2OIdFrontUrl;
        updateUploadStatusAndUrl(
          picType: PicType.front,
          status: UploadImageStatus.success,
          url: photoSubmitReq.su31n2OIdFrontUrl,
        );
      }
      if (photoSubmitReq.oj603uOApplyId != null) {
        oj603uOApplyId = photoSubmitReq.oj603uOApplyId;
      }
      faceUrl1 = photoSubmitReq.dripOSelfieUrl;
      faceUrl2 = photoSubmitReq.deviceImeiOSelfieUrl2;
      faceUrl3 = photoSubmitReq.partialCollectionOSelfieUrl3;
      if (isFaceUploadSuccess()) {
        updateUploadStatusAndUrl(
          picType: PicType.face,
          status: UploadImageStatus.success,
          url: photoSubmitReq.dripOSelfieUrl,
        );
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

  Future<String?> base64FaceStr(String? imagePath) async {
    if (imagePath == null) return null;

    // 直接压缩得到字节数组
    final List<int>? compressedBytes =
        await FlutterImageCompress.compressWithFile(
          imagePath,
          minHeight: 1920,
          minWidth: 1080,
          quality: 85,
        );

    if (compressedBytes == null || compressedBytes.isEmpty) {
      return null;
    }

    return base64Encode(compressedBytes);
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
        PicUploadReqResp$Data? resp = await Api.imageUploads(req);
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
    if (apiResult != null) {
      List<String> urlList = apiResult.submissionTimeOPictureUrlList ?? [];
      if (urlList.isNotEmpty) {
        String? id = apiResult.oj603uOApplyId;
        debugLog("id==$id");
        if (id != null && id.isNotEmpty) {
          oj603uOApplyId = id;
        }
        updateUploadStatusAndUrl(
          picType: picType,
          status: UploadImageStatus.success,
          url: urlList[0],
        );
        //正反面照都成功
        if (isFontBackUploadSuccess() && picType != PicType.face) {
          //    Future.delayed(const  Duration(seconds: 1), () {
          // final apiResult = await orcObergr(_mFontUrl ?? '', _mBackUrl ?? '');
          final apiResult = Future.delayed(
            const Duration(milliseconds: 200),
            () async {
              await orcObergr(_mFontUrl ?? '', _mBackUrl ?? '');
            },
          );
          // print("orcObergr apiResult");
          //  return apiResult;
          // });
        }
      }
    }
  }

  //上传orc图片
  Future<void> uploadFaceImage(List<String>? photo) async {
    mPicType = PicType.face;
    mPicResource = PicType.camera;

    return await launchRequest(
      () async {
        // 如果photo为null或空，则直接返回
        if (photo == null || photo.isEmpty) {
          // 可能需要根据业务逻辑处理错误，这里直接返回
          return;
        }

        // 创建一个列表，用于存储所有图片的Base64编码
        List<String> base64Images = [];

        // 遍历所有图片路径，对每张图片进行压缩和Base64编码
        for (String path in photo) {
          String? base64 = await base64FaceStr(path); // 对单个路径进行编码
          if (base64 != null) {
            base64Images.add(base64);
          }
        }

        // 检查是否有有效的图片
        if (base64Images.isEmpty) {
          // 没有有效的图片，可以选择返回或抛出异常，根据业务逻辑
          return;
        }
        final req = PicUploadReqReq(
          x01y7qOBase64String: base64Images,
          ha3xp9OPicType: mPicType.value,
          provenanceOPicResource: mPicResource.value,
          waSmsOFaceCheck: 0,
          borrowFeeSumOWithoutCard: 0,
        );
        PicUploadReqResp$Data? apiResult = await Api.imageUploads(req);

        if (apiResult != null) {
          List<String> urlList = apiResult.submissionTimeOPictureUrlList ?? [];
          if (urlList.isNotEmpty) {
            String? id = apiResult.oj603uOApplyId;
            debugLog("id==$id");
            if (id != null && id.isNotEmpty) {
              oj603uOApplyId = id;
            }
            EventService.queryAndUpdateFaceData(
              newStatus: FaceStatus.NotSubmitted.value,
              applyId: oj603uOApplyId,
            );
            faceUrl1 = urlList.getOrNull(0);
            faceUrl2 = urlList.getOrNull(1);
            faceUrl3 = urlList.getOrNull(2);
            updateUploadStatusAndUrl(
              picType: mPicType,
              status: UploadImageStatus.success,
              url: faceUrl1,
            );
          }
        }
      },
      iWantHandler: true,
      onBlockError: (resp) {
        // EventService.queryAndUpdateFaceData(
        //   newStatus: FaceStatus.NotSubmitted.value,
        // );
        // debugPrint("erroorororror");
        // photoSubmitReq = photoSubmitReq.copyWith(
        //   attributionSubOIdCardNum: "erroorororror",
        // );

        updateUploadStatusAndUrl(
          picType: mPicType,
          status: UploadImageStatus.failed,
          url: null,
        );
      },
    );
  }

  //证件orc
  Future<void> orcObergr(String fontUrl, String backUrl) async {
    final apiResult = await launchRequest(() async {
      final req = OcrReqReq(
        su31n2OIdFrontUrl: fontUrl,
        plutusOIdBackUrl: backUrl,
        is9e52OIdCardType: 2,
        oj603uOApplyId: oj603uOApplyId,
      );

      return await Api.orcObergr(req);
    });
    if (apiResult != null) {
      OcrReqResp$Data reqResp = apiResult;
      // nameOcr = reqResp.name;
      firstNameOcr = reqResp.lq1s05OFirstName;
      lastNameOcr = reqResp.darktownOLastName;
      idNumOcr = reqResp.attributionSubOIdCardNum?.replaceAll(" ", "");
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
    //print("orcObergr return");
    //return ;
  }

  Future<void> submitPhoto({
    required String f31u3kOEmail,
    required String lastName,
    required String firstName,
    required String idNumber,
    required int birthday,
    required int gender,
  }) async {
    final apiResult = await launchRequest(
      //    String? dripOSelfieUrl,
      //     String? deviceImeiOSelfieUrl2,
      //     String? partialCollectionOSelfieUrl3,
      () async {
        final req = photoSubmitReq.copyWith(
          su31n2OIdFrontUrl: _mFontUrl,
          plutusOIdBackUrl: _mBackUrl,
          oj603uOApplyId: oj603uOApplyId,
          attributionSubOIdCardNum: idNumber,
          darktownOLastName: lastName,
          lq1s05OFirstName: firstName,
          gargetOBirthday: birthday,
          loanParam001OGender: gender,
          borrowFeeSumOWithoutCard: 0,
          waSmsOFaceCheck: 0,
          is9e52OIdCardType: 2,
          dripOSelfieUrl: faceUrl1,
          deviceImeiOSelfieUrl2: faceUrl2,
          partialCollectionOSelfieUrl3: faceUrl3,
          f31u3kOEmail: f31u3kOEmail,
        );
        return await Api.photoSubmit(req);
      },
      iWantHandler: true,
      onBlockError: (resp) {
        EventService.queryAndUpdateFaceData(
          newStatus: FaceStatus.Failure.value,
        );
        //todo 暂时先toast
        toast(resp.toString());
        handlerErrorCode(resp);
      },
    );

    if (apiResult != null) {
      //todo 提交成功
      //todo NavKey.count  倒计时时间 ，，不知道 有没有返回 先写死 35
      final uriRoute = Uri(
        path: AppRouter.stepProcess,
        queryParameters: {NavKey.count: apiResult.toString()},
      );
      navigate((context) => context.pushReplacement(uriRoute.toString()));

      ///修改 最新一条face的提交状态
      EventService.queryAndUpdateFaceData(newStatus: FaceStatus.Success.value);
      //上传所有行为埋点数据
      EventService.batchUploadEvents(uploadMode: 2);
    }
  }

  //// 正面照不够清晰，请重新上传 - 清除证件照正面，并报错
  //     AWS_DETECT_FACES_FRONT(pre() + "1302", "aws.detect.faces.front" ),
  //     // 你的自拍照不够清晰，请重新上传 - 清除自拍照，并报错
  //     AWS_DETECT_FACES_SELFIE(pre() + "1310", "aws.detect.faces.selfie" ),
  //     // 您的证件照反面不清晰，请重新上传 - 清除证件照反面，并报错
  //     AWS_DETECT_FACES_BACK(pre() + "1313", "aws.detect.faces.back" ),
  //     // 您的证件照正反面都不清晰，请重新上传 - 前端清除证件照正面跟反面，并报错
  //     AWS_DETECT_FACES_FRONT_BACK(pre() + "1305", "aws.detect.faces.front.back" ),
  //     // 你的证件照正面跟自拍照不清晰，请重新上传 - 清除证件照正面与自拍照，并报错
  //     AWS_DETECT_FACES_FRONT_SELFIE(pre() + "1306", "aws.detect.faces.front.selfie" ),
  //     // 您的证件照反面跟自拍照不清晰，请重新上传 - 清除证件照反面与自拍照，并报错
  //     AWS_DETECT_FACES_BACK_SELFIE(pre() + "1307", "aws.detect.faces.back.selfie" ),
  //     // 您的证件照正反面跟自拍照不清晰，请重新上传 - 清除所有的照片，并报错
  //     AWS_DETECT_FACES_FRONT_BACK_SELFIE(pre() + "1308", "aws.detect.faces.front.back.selfie" ),
  //     // 识别到您的照片有多张人脸，请重新上传(Z1309)（证件照）- 清除证件照正面，并报错
  //     AWS_DETECT_FACES_FRONT_MULTIPLE(pre() + "1309", "aws.detect.faces.front.multiple"),
  //     // 识别到您的照片有多张人脸，请重新上传(Z1320) （自拍照） - 清除自拍照，并报错
  //     AWS_DETECT_FACES_SELFIE_MULTIPLE(pre() + "1320", "aws.detect.faces.selfie.multiple" ),
  //     // 人脸比对失败，请重新尝试(Z1311) - 清除所有的照片，并报错
  //     AWS_DETECT_FACES_COMPARE_FAIL(pre() + "1311", "aws.detect.faces.compare.fail" ),
  //     // 您的请求太频繁，请明日再来(Z1312 ) - 不清除照片，只报错
  //     AWS_DETECT_FACES_COUNT_LIMIT(pre() + "1312", "aws.detect.faces.count.limit" ),
  //     // 活体正视镜头 - 清除活体，并报错
  //     AWS_DETECT_FACES_TO_CAMERA(pre() + "1315", "aws.detect.faces.to.camera" ),
  //     // 授信身份证存在且已提交授信信息
  // //    ID_CARD_EXISTS_PENDING(pre() + "1313", "credit.bvn.exists",""),
  //     // 证件照人脸检测，未检测到人脸（Z1316） - 请重新上传，清除证件照正面，并报错
  //     AWS_DETECT_FACES_NO_FACE(pre() + "1316", "aws.detect.faces.no.face" ),
  void handlerErrorCode(ApiResponse resp) {
    String code = resp.code;
    if (code == "Z1311" || code == "Z1308") {
      //清除所有照片
      _mBackUrl = null;
      _mFontUrl = null;
      faceUrl1 = null;
      faceUrl2 = null;
      faceUrl3 = null;
    } else if (code == "Z1302" || code == "Z1309" || code == "Z1316") {
      //清除证件照正面
      _mFontUrl = null;
    } else if (code == "Z1305") {
      //前端清除证件照正面跟反面，并报错
      _mBackUrl = null;
      _mFontUrl = null;
    } else if (code == "Z1313") {
      //清除证件照反面，并报错
      _mBackUrl = null;
    } else if (code == "Z1306") {
      // 清除证件照正面与自拍照，并报错
      faceUrl1 = null;
      faceUrl2 = null;
      faceUrl3 = null;
      _mFontUrl = null;
    } else if (code == "Z1307") {
      //清除证件照反面与自拍照，并报错
      faceUrl1 = null;
      faceUrl2 = null;
      faceUrl3 = null;
      _mBackUrl = null;
    } else if (code == "Z1320") {
      //自拍照） - 清除自拍照，并报错
      faceUrl1 = null;
      faceUrl2 = null;
      faceUrl3 = null;
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
    } else if (picType == PicType.face) {
      _mFaceUploadStatus = status;
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

  String faceTitle() {
    if (_mFaceUploadStatus == UploadImageStatus.failed) {
      return "Haz clic para volver a subir";
    } else {
      return "Foto facial";
    }
  }

  // 正反面照是否都上传成功
  bool isFontBackUploadSuccess() {
    // print("isFontBackUploadSuccess:${ _mFontUrl != null && _mBackUrl != null}");
    return _mFontUrl != null && _mBackUrl != null;
    // return true;
  }

  //人脸是否上传成功
  bool isFaceUploadSuccess() {
    // print("isFontBackUploadSuccess:${ _mFontUrl != null && _mBackUrl != null}");
    return isValidUrl(faceUrl1) && isValidUrl(faceUrl2) && isValidUrl(faceUrl3);
    // return true;
  }

  // 可扩展的验证方法，支持自定义验证规则
  bool isValidUrl(String? url, {int minLength = 5}) {
    if (url == null || url.isEmpty) {
      return false;
    } else {
      return true;
    }
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
