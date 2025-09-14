import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/models/swaggerApi.models.swagger.dart';
import 'package:flutter_echo/pages/app_router.dart';
import 'package:flutter_echo/services/api_service.dart';
import 'package:flutter_echo/services/storage_service.dart';
import 'package:go_router/go_router.dart';

class SubmitModel extends BaseProvider {
  static const dictBasic = [0, 6];
  static const dictWork = [3, 12, 5, 1, 4, 7, 2, 8];
  static const dictArea = 9;
  static const dictContact = 10;
  static const _dictTypes = [...dictBasic, ...dictWork, dictArea, dictContact];
  static Map<String, List<StepItem>?>? _stepItems;
  static SubmitDataReq _submitData = SubmitDataReq();

  SubmitDataReq? getCachedData() {
    final json = LocalStorage().getObject(AppConst.kycDataKey);
    if (json != null) return SubmitDataReq.fromJson(json);
    return null;
  }

  Future<Map<String, List<StepItem>?>?> getDictionary() async {
    if (_stepItems?.isNotEmpty == true) return _stepItems;
    return await launchRequest(() async {
      final apiResult = await Api.getDictionary(_dictTypes.join(','));
      _stepItems = apiResult;
      return apiResult;
    });
  }

  void submitBasicInfo({
    required List<String> inputs,
    required List<int?> items,
    required int? birthday,
  }) async {
    final checkResult = await launchRequest(
      () => Api.checkSubmitValid(email: inputs[4], id: inputs[2]),
    );
    if (checkResult != true) return;
    cacheBasicInfo(inputs: inputs, items: items, birthday: birthday);
    await LocalStorage().set(AppConst.kycStepKey, 1);
    navigate((context) => context.push(AppRouter.stepWork));
  }

  void cacheBasicInfo({
    required List<String> inputs,
    required List<int?> items,
    required int? birthday,
  }) {
    _submitData = _submitData.copyWith(
      gender: items[0],
      gargetOBirthday: birthday,
      lq1s05OFirstName: inputs[0],
      darktownOLastName: inputs[1],
      merdekaOIdCard: inputs[2],
      x1iu04OOtherMobile: inputs[3],
      f31u3kOEmail: inputs[4],
      himfjuOOtherLoans: items[1],
    );
  }

  void submitWorkInfo({
    required List<String?> areas,
    required List<int?> items,
    required List<int?> days,
  }) async {
    cacheWorkInfo(areas: areas, items: items, days: days);
    await LocalStorage().set(AppConst.kycStepKey, 2);
    navigate((context) => context.push(AppRouter.stepContact));
  }

  void cacheWorkInfo({
    required List<String?> areas,
    required List<int?> items,
    required List<int?> days,
  }) {
    _submitData = _submitData.copyWith(
      m2wx4tOMaritalStatus: items[0],
      z4s937OHouseholdMonthlyExpenses: items[1],
      chaffyOHouseStatus: items[2],
      spadicesOAddressState: areas[0],
      gasconyOAddressCity: areas[1],
      enfetterOAddressDistrict: areas[2],
      craalOAddressDetail: areas[3],
      coseOEducation: items[3],
      diopsideOOccupation: items[4],
      alloOWorkingYears: items[5],
      limpidlyOIncomeLevel: items[6],
      b1417wOPayPeriod: items[7],
      r67p23OPayday: days[0],
      plenishOSecondPayday: days[1],
    );
  }

  void submitContactInfo({
    required List<List<String>> inputs,
    required List<int?> items,
  }) async {
    cacheContactInfo(inputs: inputs, items: items);
    await LocalStorage().set(AppConst.kycStepKey, 3);
    _submitCreditData();
  }

  void cacheContactInfo({
    required List<List<String>> inputs,
    required List<int?> items,
  }) {
    _submitData = _submitData.copyWith(
      grippleOFirstContactName: inputs[0][0],
      rainOFirstContactMobile: inputs[0][1],
      baryeOFirstContactRelationship: items[0],
      aquarianOSecondContactName: inputs[1][0],
      h3d2wfOSecondContactMobile: inputs[1][1],
      kibeOSecondContactRelationship: items[1],
    );
  }

  void _submitCreditData() async {
    final apiResult = await launchRequest(
      () => Api.submitCreditData(_submitData),
    );
    final uriRoute = Uri(
      path: AppRouter.stepProcess,
      queryParameters: {NavKey.count: apiResult?.toString()},
    );
    navigate((context) => context.push(uriRoute.toString()));
  }

  @override
  void dispose() {
    LocalStorage().set(AppConst.kycDataKey, _submitData);
    super.dispose();
  }
}
