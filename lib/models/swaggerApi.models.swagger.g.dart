// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swaggerApi.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankDeleteReq _$BankDeleteReqFromJson(Map<String, dynamic> json) =>
    BankDeleteReq(vnbh46OBankCardGid: (json['vnbh46'] as num?)?.toInt());

Map<String, dynamic> _$BankDeleteReqToJson(BankDeleteReq instance) =>
    <String, dynamic>{'vnbh46': instance.vnbh46OBankCardGid};

MyBankCardReq _$MyBankCardReqFromJson(Map<String, dynamic> json) =>
    MyBankCardReq(raiaOUserGid: json['raia'] as String?);

Map<String, dynamic> _$MyBankCardReqToJson(MyBankCardReq instance) =>
    <String, dynamic>{'raia': instance.raiaOUserGid};

BankVOReq _$BankVOReqFromJson(Map<String, dynamic> json) =>
    BankVOReq(t1h91pOBankName: json['t1h91p'] as String?);

Map<String, dynamic> _$BankVOReqToJson(BankVOReq instance) => <String, dynamic>{
  't1h91p': instance.t1h91pOBankName,
};

BankBinReq _$BankBinReqFromJson(Map<String, dynamic> json) => BankBinReq(
  raiaOUserGid: json['raia'] as String?,
  ojf007OBankAccount: json['ojf007'] as String?,
  exhedraOAccountType: (json['exhedra'] as num?)?.toInt(),
);

Map<String, dynamic> _$BankBinReqToJson(BankBinReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'ojf007': instance.ojf007OBankAccount,
      'exhedra': instance.exhedraOAccountType,
    };

BindResultReq _$BindResultReqFromJson(Map<String, dynamic> json) =>
    BindResultReq(
      raiaOUserGid: json['raia'] as String?,
      lynceanOBindcardGid: (json['lyncean'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BindResultReqToJson(BindResultReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'lyncean': instance.lynceanOBindcardGid,
    };

BindCardReq _$BindCardReqFromJson(Map<String, dynamic> json) => BindCardReq(
  raiaOUserGid: json['raia'] as String?,
  exonymOBankGid: json['exonym'] as String?,
  t1h91pOBankName: json['t1h91p'] as String?,
  insolentOBankCode: json['insolent'] as String?,
  zebrineOCardNo: json['zebrine'] as String?,
  s90dw0OCciNumber: json['s90dw0'] as String?,
  cvn: json['cvn'] as String?,
  stukaOExpiryDate: json['stuka'] as String?,
  f31u3kOEmail: json['f31u3k'] as String?,
  exhedraOAccountType: (json['exhedra'] as num?)?.toInt(),
);

Map<String, dynamic> _$BindCardReqToJson(BindCardReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'exonym': instance.exonymOBankGid,
      't1h91p': instance.t1h91pOBankName,
      'insolent': instance.insolentOBankCode,
      'zebrine': instance.zebrineOCardNo,
      's90dw0': instance.s90dw0OCciNumber,
      'cvn': instance.cvn,
      'stuka': instance.stukaOExpiryDate,
      'f31u3k': instance.f31u3kOEmail,
      'exhedra': instance.exhedraOAccountType,
    };

BankCardReq _$BankCardReqFromJson(Map<String, dynamic> json) =>
    BankCardReq(raiaOUserGid: json['raia'] as String?);

Map<String, dynamic> _$BankCardReqToJson(BankCardReq instance) =>
    <String, dynamic>{'raia': instance.raiaOUserGid};

TraderPwdCheckReq _$TraderPwdCheckReqFromJson(Map<String, dynamic> json) =>
    TraderPwdCheckReq(
      raiaOUserGid: json['raia'] as String?,
      z38e62OOrderGid: json['z38e62'] as String?,
      c4s47hOTransPassword: json['c4s47h'] as String?,
      s377v5OBizLine: json['s377v5'] as String?,
    );

Map<String, dynamic> _$TraderPwdCheckReqToJson(TraderPwdCheckReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'z38e62': instance.z38e62OOrderGid,
      'c4s47h': instance.c4s47hOTransPassword,
      's377v5': instance.s377v5OBizLine,
    };

AccountCancelJudgeReq _$AccountCancelJudgeReqFromJson(
  Map<String, dynamic> json,
) => AccountCancelJudgeReq(raiaOUserGid: json['raia'] as String?);

Map<String, dynamic> _$AccountCancelJudgeReqToJson(
  AccountCancelJudgeReq instance,
) => <String, dynamic>{'raia': instance.raiaOUserGid};

CheckRegisterReq _$CheckRegisterReqFromJson(Map<String, dynamic> json) =>
    CheckRegisterReq(
      sordidOMobile: json['sordid'] as String?,
      d7x52pOBizChannel: json['d7x52p'] as String?,
      s377v5OBizLine: json['s377v5'] as String?,
    );

Map<String, dynamic> _$CheckRegisterReqToJson(CheckRegisterReq instance) =>
    <String, dynamic>{
      'sordid': instance.sordidOMobile,
      'd7x52p': instance.d7x52pOBizChannel,
      's377v5': instance.s377v5OBizLine,
    };

WhiteListReq _$WhiteListReqFromJson(Map<String, dynamic> json) =>
    WhiteListReq(sordidOMobile: json['sordid'] as String?);

Map<String, dynamic> _$WhiteListReqToJson(WhiteListReq instance) =>
    <String, dynamic>{'sordid': instance.sordidOMobile};

NeedCaptchaReq _$NeedCaptchaReqFromJson(Map<String, dynamic> json) =>
    NeedCaptchaReq(
      sordidOMobile: json['sordid'] as String?,
      type: (json['type'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NeedCaptchaReqToJson(NeedCaptchaReq instance) =>
    <String, dynamic>{'sordid': instance.sordidOMobile, 'type': instance.type};

RegisterReq _$RegisterReqFromJson(Map<String, dynamic> json) => RegisterReq(
  sordidOMobile: json['sordid'] as String?,
  password: json['password'] as String?,
  presageOVerCode: json['presage'] as String?,
  vkql27OReqChannel: json['vkql27'] as String?,
  zebrassOReqSubChannel: json['zebrass'] as String?,
  s37m00OReqSubChannelAf: json['s37m00'] as String?,
  spankOAppsflyerId: json['spank'] as String?,
  ac0as4OMobileSn: json['ac0as4'] as String?,
  d7x52pOBizChannel: json['d7x52p'] as String?,
  s377v5OBizLine: json['s377v5'] as String?,
  snafuOVerImageCode: json['snafu'] as String?,
  monobuoyOLastAaid: json['monobuoy'] as String?,
  neckbandOFirebaseId: json['neckband'] as String?,
  n66w89ODtype: (json['n66w89'] as num?)?.toInt(),
);

Map<String, dynamic> _$RegisterReqToJson(RegisterReq instance) =>
    <String, dynamic>{
      'sordid': instance.sordidOMobile,
      'password': instance.password,
      'presage': instance.presageOVerCode,
      'vkql27': instance.vkql27OReqChannel,
      'zebrass': instance.zebrassOReqSubChannel,
      's37m00': instance.s37m00OReqSubChannelAf,
      'spank': instance.spankOAppsflyerId,
      'ac0as4': instance.ac0as4OMobileSn,
      'd7x52p': instance.d7x52pOBizChannel,
      's377v5': instance.s377v5OBizLine,
      'snafu': instance.snafuOVerImageCode,
      'monobuoy': instance.monobuoyOLastAaid,
      'neckband': instance.neckbandOFirebaseId,
      'n66w89': instance.n66w89ODtype,
    };

UserInfoReq _$UserInfoReqFromJson(Map<String, dynamic> json) =>
    UserInfoReq(raiaOUserGid: json['raia'] as String?);

Map<String, dynamic> _$UserInfoReqToJson(UserInfoReq instance) =>
    <String, dynamic>{'raia': instance.raiaOUserGid};

LoginReq _$LoginReqFromJson(Map<String, dynamic> json) => LoginReq(
  sordidOMobile: json['sordid'] as String?,
  password: json['password'] as String?,
  y260zpOToken: json['y260zp'] as String?,
  raiaOUserGid: json['raia'] as String?,
  ac0as4OMobileSn: json['ac0as4'] as String?,
  d7x52pOBizChannel: json['d7x52p'] as String?,
  s377v5OBizLine: json['s377v5'] as String?,
  oc: (json['oc'] as num?)?.toInt(),
  presageOVerCode: json['presage'] as String?,
  snafuOVerImageCode: json['snafu'] as String?,
  z775udOAppVersion: json['z775ud'] as String?,
);

Map<String, dynamic> _$LoginReqToJson(LoginReq instance) => <String, dynamic>{
  'sordid': instance.sordidOMobile,
  'password': instance.password,
  'y260zp': instance.y260zpOToken,
  'raia': instance.raiaOUserGid,
  'ac0as4': instance.ac0as4OMobileSn,
  'd7x52p': instance.d7x52pOBizChannel,
  's377v5': instance.s377v5OBizLine,
  'oc': instance.oc,
  'presage': instance.presageOVerCode,
  'snafu': instance.snafuOVerImageCode,
  'z775ud': instance.z775udOAppVersion,
};

AccountCancelAppReq _$AccountCancelAppReqFromJson(Map<String, dynamic> json) =>
    AccountCancelAppReq(
      raiaOUserGid: json['raia'] as String?,
      sordidOMobile: json['sordid'] as String?,
      d7x52pOBizChannel: json['d7x52p'] as String?,
      s377v5OBizLine: json['s377v5'] as String?,
      presageOVerCode: json['presage'] as String?,
      snafuOVerImageCode: json['snafu'] as String?,
      ac0as4OMobileSn: json['ac0as4'] as String?,
      source: (json['source'] as num?)?.toInt(),
      pageId: json['pageId'] as String?,
      vsu233OCancelCode: json['vsu233'] as String?,
      tgifOCancelReason: json['tgif'] as String?,
    );

Map<String, dynamic> _$AccountCancelAppReqToJson(
  AccountCancelAppReq instance,
) => <String, dynamic>{
  'raia': instance.raiaOUserGid,
  'sordid': instance.sordidOMobile,
  'd7x52p': instance.d7x52pOBizChannel,
  's377v5': instance.s377v5OBizLine,
  'presage': instance.presageOVerCode,
  'snafu': instance.snafuOVerImageCode,
  'ac0as4': instance.ac0as4OMobileSn,
  'source': instance.source,
  'pageId': instance.pageId,
  'vsu233': instance.vsu233OCancelCode,
  'tgif': instance.tgifOCancelReason,
};

AccountCancelLandReq _$AccountCancelLandReqFromJson(
  Map<String, dynamic> json,
) => AccountCancelLandReq(
  raiaOUserGid: json['raia'] as String?,
  sordidOMobile: json['sordid'] as String?,
  d7x52pOBizChannel: json['d7x52p'] as String?,
  s377v5OBizLine: json['s377v5'] as String?,
  presageOVerCode: json['presage'] as String?,
  snafuOVerImageCode: json['snafu'] as String?,
  ac0as4OMobileSn: json['ac0as4'] as String?,
  source: (json['source'] as num?)?.toInt(),
  pageId: json['pageId'] as String?,
  vsu233OCancelCode: json['vsu233'] as String?,
  tgifOCancelReason: json['tgif'] as String?,
);

Map<String, dynamic> _$AccountCancelLandReqToJson(
  AccountCancelLandReq instance,
) => <String, dynamic>{
  'raia': instance.raiaOUserGid,
  'sordid': instance.sordidOMobile,
  'd7x52p': instance.d7x52pOBizChannel,
  's377v5': instance.s377v5OBizLine,
  'presage': instance.presageOVerCode,
  'snafu': instance.snafuOVerImageCode,
  'ac0as4': instance.ac0as4OMobileSn,
  'source': instance.source,
  'pageId': instance.pageId,
  'vsu233': instance.vsu233OCancelCode,
  'tgif': instance.tgifOCancelReason,
};

TraderPwdResetReq _$TraderPwdResetReqFromJson(Map<String, dynamic> json) =>
    TraderPwdResetReq(
      raiaOUserGid: json['raia'] as String?,
      password: json['password'] as String?,
      sordidOMobile: json['sordid'] as String?,
      presageOVerCode: json['presage'] as String?,
      snafuOVerImageCode: json['snafu'] as String?,
      merdekaOIdCard: json['merdeka'] as String?,
      gargetOBirthday: (json['garget'] as num?)?.toInt(),
      type: json['type'] as String?,
      ac0as4OMobileSn: json['ac0as4'] as String?,
      bvn: json['bvn'] as String?,
      flag: json['flag'] as bool?,
      s377v5OBizLine: json['s377v5'] as String?,
    );

Map<String, dynamic> _$TraderPwdResetReqToJson(TraderPwdResetReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'password': instance.password,
      'sordid': instance.sordidOMobile,
      'presage': instance.presageOVerCode,
      'snafu': instance.snafuOVerImageCode,
      'merdeka': instance.merdekaOIdCard,
      'garget': instance.gargetOBirthday,
      'type': instance.type,
      'ac0as4': instance.ac0as4OMobileSn,
      'bvn': instance.bvn,
      'flag': instance.flag,
      's377v5': instance.s377v5OBizLine,
    };

LoginPwdResetReq _$LoginPwdResetReqFromJson(Map<String, dynamic> json) =>
    LoginPwdResetReq(
      sordidOMobile: json['sordid'] as String?,
      password: json['password'] as String?,
      ac0as4OMobileSn: json['ac0as4'] as String?,
      presageOVerCode: json['presage'] as String?,
      snafuOVerImageCode: json['snafu'] as String?,
      d7x52pOBizChannel: json['d7x52p'] as String?,
      s377v5OBizLine: json['s377v5'] as String?,
    );

Map<String, dynamic> _$LoginPwdResetReqToJson(LoginPwdResetReq instance) =>
    <String, dynamic>{
      'sordid': instance.sordidOMobile,
      'password': instance.password,
      'ac0as4': instance.ac0as4OMobileSn,
      'presage': instance.presageOVerCode,
      'snafu': instance.snafuOVerImageCode,
      'd7x52p': instance.d7x52pOBizChannel,
      's377v5': instance.s377v5OBizLine,
    };

CaptchaCheckReq _$CaptchaCheckReqFromJson(Map<String, dynamic> json) =>
    CaptchaCheckReq(
      sordidOMobile: json['sordid'] as String?,
      raiaOUserGid: json['raia'] as String?,
      type: (json['type'] as num?)?.toInt(),
      ac0as4OMobileSn: json['ac0as4'] as String?,
      xwkarvOImageCode: json['xwkarv'] as String?,
    );

Map<String, dynamic> _$CaptchaCheckReqToJson(CaptchaCheckReq instance) =>
    <String, dynamic>{
      'sordid': instance.sordidOMobile,
      'raia': instance.raiaOUserGid,
      'type': instance.type,
      'ac0as4': instance.ac0as4OMobileSn,
      'xwkarv': instance.xwkarvOImageCode,
    };

CodeVerifyReq _$CodeVerifyReqFromJson(Map<String, dynamic> json) =>
    CodeVerifyReq(
      sordidOMobile: json['sordid'] as String?,
      raiaOUserGid: json['raia'] as String?,
      o4r2h6OIsBvnMobile: json['o4r2h6'] as bool?,
      type: (json['type'] as num?)?.toInt(),
      presageOVerCode: json['presage'] as String?,
      z38e62OOrderGid: json['z38e62'] as String?,
      ac0as4OMobileSn: json['ac0as4'] as String?,
      snafuOVerImageCode: json['snafu'] as String?,
      s377v5OBizLine: json['s377v5'] as String?,
    );

Map<String, dynamic> _$CodeVerifyReqToJson(CodeVerifyReq instance) =>
    <String, dynamic>{
      'sordid': instance.sordidOMobile,
      'raia': instance.raiaOUserGid,
      'o4r2h6': instance.o4r2h6OIsBvnMobile,
      'type': instance.type,
      'presage': instance.presageOVerCode,
      'z38e62': instance.z38e62OOrderGid,
      'ac0as4': instance.ac0as4OMobileSn,
      'snafu': instance.snafuOVerImageCode,
      's377v5': instance.s377v5OBizLine,
    };

CodeSendReq _$CodeSendReqFromJson(Map<String, dynamic> json) => CodeSendReq(
  sordidOMobile: json['sordid'] as String?,
  type: json['type'] as String?,
  j62tn1OMsgType: json['j62tn1'] as String?,
  d7x52pOBizChannel: json['d7x52p'] as String?,
  s377v5OBizLine: json['s377v5'] as String?,
  raiaOUserGid: json['raia'] as String?,
  o4r2h6OIsBvnMobile: json['o4r2h6'] as bool?,
  z38e62OOrderGid: json['z38e62'] as String?,
  n66w89ODtype: (json['n66w89'] as num?)?.toInt(),
);

Map<String, dynamic> _$CodeSendReqToJson(CodeSendReq instance) =>
    <String, dynamic>{
      'sordid': instance.sordidOMobile,
      'type': instance.type,
      'j62tn1': instance.j62tn1OMsgType,
      'd7x52p': instance.d7x52pOBizChannel,
      's377v5': instance.s377v5OBizLine,
      'raia': instance.raiaOUserGid,
      'o4r2h6': instance.o4r2h6OIsBvnMobile,
      'z38e62': instance.z38e62OOrderGid,
      'n66w89': instance.n66w89ODtype,
    };

TrackReportReq _$TrackReportReqFromJson(
  Map<String, dynamic> json,
) => TrackReportReq(
  raiaOUserGid: json['raia'] as String?,
  z775udOAppVersion: json['z775ud'] as String?,
  hk4762OUploadTime: (json['hk4762'] as num?)?.toInt(),
  fibulaOReportBaseInfo: json['fibula'] == null
      ? null
      : TrackReportReq$FibulaOReportBaseInfo.fromJson(
          json['fibula'] as Map<String, dynamic>,
        ),
  adcraftOAddressBook: (json['adcraft'] as List<dynamic>?)
      ?.map(
        (e) => TrackReportReq$AdcraftOAddressBook$Item.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  jx3w61OAppList: (json['jx3w61'] as List<dynamic>?)
      ?.map(
        (e) => TrackReportReq$Jx3w61OAppList$Item.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  banallyOReportDevDTO: json['banally'] == null
      ? null
      : TrackReportReq$BanallyOReportDevDTO.fromJson(
          json['banally'] as Map<String, dynamic>,
        ),
  silaneOReportGyroDTO: (json['silane'] as List<dynamic>?)
      ?.map(
        (e) => TrackReportReq$SilaneOReportGyroDTO$Item.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  spankOAppsflyerId: json['spank'] as String?,
  frcoOSmsItems: (json['frco'] as List<dynamic>?)
      ?.map(
        (e) => TrackReportReq$FrcoOSmsItems$Item.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
);

Map<String, dynamic> _$TrackReportReqToJson(TrackReportReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'z775ud': instance.z775udOAppVersion,
      'hk4762': instance.hk4762OUploadTime,
      'fibula': instance.fibulaOReportBaseInfo?.toJson(),
      'adcraft': instance.adcraftOAddressBook?.map((e) => e.toJson()).toList(),
      'jx3w61': instance.jx3w61OAppList?.map((e) => e.toJson()).toList(),
      'banally': instance.banallyOReportDevDTO?.toJson(),
      'silane': instance.silaneOReportGyroDTO?.map((e) => e.toJson()).toList(),
      'spank': instance.spankOAppsflyerId,
      'frco': instance.frcoOSmsItems?.map((e) => e.toJson()).toList(),
    };

NeedReportReq _$NeedReportReqFromJson(Map<String, dynamic> json) =>
    NeedReportReq(
      manoOMapKey: json['mano'],
      reopposeOMapValue: json['reoppose'] == null
          ? null
          : NeedReportReq$ReopposeOMapValue.fromJson(
              json['reoppose'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$NeedReportReqToJson(NeedReportReq instance) =>
    <String, dynamic>{
      'mano': instance.manoOMapKey,
      'reoppose': instance.reopposeOMapValue?.toJson(),
    };

RiskReportReq _$RiskReportReqFromJson(Map<String, dynamic> json) =>
    RiskReportReq(
      s377v5OBizLine: json['s377v5'] as String?,
      d7x52pOBizChannel: json['d7x52p'] as String?,
      type: (json['type'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RiskReportReqToJson(RiskReportReq instance) =>
    <String, dynamic>{
      's377v5': instance.s377v5OBizLine,
      'd7x52p': instance.d7x52pOBizChannel,
      'type': instance.type,
    };

VaCreateReq _$VaCreateReqFromJson(Map<String, dynamic> json) =>
    VaCreateReq(raiaOUserGid: json['raia'] as String?);

Map<String, dynamic> _$VaCreateReqToJson(VaCreateReq instance) =>
    <String, dynamic>{'raia': instance.raiaOUserGid};

VoSubmitReq _$VoSubmitReqFromJson(Map<String, dynamic> json) => VoSubmitReq(
  raiaOUserGid: json['raia'] as String?,
  r5a4x8OLoanGid: (json['r5a4x8'] as num?)?.toInt(),
  krddvvOReference: json['krddvv'] as String?,
  di6pi4OTransferTime: (json['di6pi4'] as num?)?.toInt(),
  o12sd0OAmount: (json['o12sd0'] as num?)?.toDouble(),
);

Map<String, dynamic> _$VoSubmitReqToJson(VoSubmitReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'r5a4x8': instance.r5a4x8OLoanGid,
      'krddvv': instance.krddvvOReference,
      'di6pi4': instance.di6pi4OTransferTime,
      'o12sd0': instance.o12sd0OAmount,
    };

VaGetReq _$VaGetReqFromJson(Map<String, dynamic> json) => VaGetReq(
  raiaOUserGid: json['raia'] as String?,
  r5a4x8OLoanGid: (json['r5a4x8'] as num?)?.toInt(),
);

Map<String, dynamic> _$VaGetReqToJson(VaGetReq instance) => <String, dynamic>{
  'raia': instance.raiaOUserGid,
  'r5a4x8': instance.r5a4x8OLoanGid,
};

RepayApplyReq _$RepayApplyReqFromJson(Map<String, dynamic> json) =>
    RepayApplyReq(
      r5a4x8OLoanGid: (json['r5a4x8'] as num?)?.toInt(),
      raiaOUserGid: json['raia'] as String?,
      o12sd0OAmount: (json['o12sd0'] as num?)?.toDouble(),
      vnbh46OBankCardGid: (json['vnbh46'] as num?)?.toInt(),
      bdvg46ORepaymentStage: (json['bdvg46'] as num?)?.toInt(),
      oe5u39OChannelName: json['oe5u39'] as String?,
      worstOChannelCode: json['worst'] as String?,
      y28nd4OChannelType: json['y28nd4'] as String?,
      jewellyOIsRenew: json['jewelly'] as bool?,
      mahoganyORepaymentType: (json['mahogany'] as num?)?.toInt(),
      percherOJumpSourceType: (json['percher'] as num?)?.toInt(),
      z1vi8nORenewRepaymentType: (json['z1vi8n'] as num?)?.toInt(),
      g3x614ORepaymentFee: (json['g3x614'] as num?)?.toDouble(),
      hm7756OCheckLoanLeftAmount: (json['hm7756'] as num?)?.toDouble(),
      fratOMark: json['frat'] as String?,
      t1h91pOBankName: json['t1h91p'] as String?,
      e77490ORequestId: json['e77490'] as String?,
      lz09kpOUserName: json['lz09kp'] as String?,
      k5j6q9OChannelAccount: json['k5j6q9'] as String?,
      x01y7qOBase64String: json['x01y7q'] as String?,
    );

Map<String, dynamic> _$RepayApplyReqToJson(RepayApplyReq instance) =>
    <String, dynamic>{
      'r5a4x8': instance.r5a4x8OLoanGid,
      'raia': instance.raiaOUserGid,
      'o12sd0': instance.o12sd0OAmount,
      'vnbh46': instance.vnbh46OBankCardGid,
      'bdvg46': instance.bdvg46ORepaymentStage,
      'oe5u39': instance.oe5u39OChannelName,
      'worst': instance.worstOChannelCode,
      'y28nd4': instance.y28nd4OChannelType,
      'jewelly': instance.jewellyOIsRenew,
      'mahogany': instance.mahoganyORepaymentType,
      'percher': instance.percherOJumpSourceType,
      'z1vi8n': instance.z1vi8nORenewRepaymentType,
      'g3x614': instance.g3x614ORepaymentFee,
      'hm7756': instance.hm7756OCheckLoanLeftAmount,
      'frat': instance.fratOMark,
      't1h91p': instance.t1h91pOBankName,
      'e77490': instance.e77490ORequestId,
      'lz09kp': instance.lz09kpOUserName,
      'k5j6q9': instance.k5j6q9OChannelAccount,
      'x01y7q': instance.x01y7qOBase64String,
    };

RepayRecordReq _$RepayRecordReqFromJson(Map<String, dynamic> json) =>
    RepayRecordReq(
      r5a4x8OLoanGid: (json['r5a4x8'] as num?)?.toInt(),
      raiaOUserGid: json['raia'] as String?,
      mahoganyORepaymentType: (json['mahogany'] as num?)?.toInt(),
      t1h91pOBankName: json['t1h91p'] as String?,
      e77490ORequestId: json['e77490'] as String?,
      o12sd0OAmount: (json['o12sd0'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RepayRecordReqToJson(RepayRecordReq instance) =>
    <String, dynamic>{
      'r5a4x8': instance.r5a4x8OLoanGid,
      'raia': instance.raiaOUserGid,
      'mahogany': instance.mahoganyORepaymentType,
      't1h91p': instance.t1h91pOBankName,
      'e77490': instance.e77490ORequestId,
      'o12sd0': instance.o12sd0OAmount,
    };

MainInfoReq _$MainInfoReqFromJson(Map<String, dynamic> json) => MainInfoReq(
  raiaOUserGid: json['raia'] as String?,
  zebrassOReqSubChannel: json['zebrass'] as String?,
  s37m00OReqSubChannelAf: json['s37m00'] as String?,
  spankOAppsflyerId: json['spank'] as String?,
  z775udOAppVersion: json['z775ud'] as String?,
  monobuoyOLastAaid: json['monobuoy'] as String?,
  neckbandOFirebaseId: json['neckband'] as String?,
);

Map<String, dynamic> _$MainInfoReqToJson(MainInfoReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'zebrass': instance.zebrassOReqSubChannel,
      's37m00': instance.s37m00OReqSubChannelAf,
      'spank': instance.spankOAppsflyerId,
      'z775ud': instance.z775udOAppVersion,
      'monobuoy': instance.monobuoyOLastAaid,
      'neckband': instance.neckbandOFirebaseId,
    };

NoticeMainReq _$NoticeMainReqFromJson(Map<String, dynamic> json) =>
    NoticeMainReq(m52v00OPlatform: json['m52v00'] as String?);

Map<String, dynamic> _$NoticeMainReqToJson(NoticeMainReq instance) =>
    <String, dynamic>{'m52v00': instance.m52v00OPlatform};

VersionCheckReq _$VersionCheckReqFromJson(Map<String, dynamic> json) =>
    VersionCheckReq(lutealOVersion: json['luteal'] as String?);

Map<String, dynamic> _$VersionCheckReqToJson(VersionCheckReq instance) =>
    <String, dynamic>{'luteal': instance.lutealOVersion};

ColoanGpReq _$ColoanGpReqFromJson(Map<String, dynamic> json) => ColoanGpReq(
  raiaOUserGid: json['raia'] as String?,
  d7x52pOBizChannel: json['d7x52p'] as String?,
  s377v5OBizLine: json['s377v5'] as String?,
);

Map<String, dynamic> _$ColoanGpReqToJson(ColoanGpReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'd7x52p': instance.d7x52pOBizChannel,
      's377v5': instance.s377v5OBizLine,
    };

HomeInfoReq _$HomeInfoReqFromJson(Map<String, dynamic> json) => HomeInfoReq(
  raiaOUserGid: json['raia'] as String?,
  zebrassOReqSubChannel: json['zebrass'] as String?,
  s37m00OReqSubChannelAf: json['s37m00'] as String?,
  spankOAppsflyerId: json['spank'] as String?,
  z775udOAppVersion: json['z775ud'] as String?,
  monobuoyOLastAaid: json['monobuoy'] as String?,
  neckbandOFirebaseId: json['neckband'] as String?,
);

Map<String, dynamic> _$HomeInfoReqToJson(HomeInfoReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'zebrass': instance.zebrassOReqSubChannel,
      's37m00': instance.s37m00OReqSubChannelAf,
      'spank': instance.spankOAppsflyerId,
      'z775ud': instance.z775udOAppVersion,
      'monobuoy': instance.monobuoyOLastAaid,
      'neckband': instance.neckbandOFirebaseId,
    };

LoanConfirmReq _$LoanConfirmReqFromJson(Map<String, dynamic> json) =>
    LoanConfirmReq(
      raiaOUserGid: json['raia'] as String?,
      z38e62OOrderGid: json['z38e62'] as String?,
      retiaryOLoanAmount: (json['retiary'] as num?)?.toDouble(),
      foreyardOProductId: (json['foreyard'] as num?)?.toInt(),
      c4s47hOTransPassword: json['c4s47h'] as String?,
      vnbh46OBankCardGid: (json['vnbh46'] as num?)?.toInt(),
      zebrineOCardNo: json['zebrine'] as String?,
      t1h91pOBankName: json['t1h91p'] as String?,
      insolentOBankCode: json['insolent'] as String?,
      flag: json['flag'] as bool?,
      pinionOUserCouponGid: json['pinion'] as String?,
      x2anh3OStageFlag: (json['x2anh3'] as num?)?.toInt(),
      brantOPurpose: (json['brant'] as num?)?.toInt(),
      rf6k6bOCheckType: (json['rf6k6b'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LoanConfirmReqToJson(LoanConfirmReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'z38e62': instance.z38e62OOrderGid,
      'retiary': instance.retiaryOLoanAmount,
      'foreyard': instance.foreyardOProductId,
      'c4s47h': instance.c4s47hOTransPassword,
      'vnbh46': instance.vnbh46OBankCardGid,
      'zebrine': instance.zebrineOCardNo,
      't1h91p': instance.t1h91pOBankName,
      'insolent': instance.insolentOBankCode,
      'flag': instance.flag,
      'pinion': instance.pinionOUserCouponGid,
      'x2anh3': instance.x2anh3OStageFlag,
      'brant': instance.brantOPurpose,
      'rf6k6b': instance.rf6k6bOCheckType,
    };

PicUploadReqReq _$PicUploadReqReqFromJson(Map<String, dynamic> json) =>
    PicUploadReqReq(
      raiaOUserGid: json['raia'] as String?,
      ha3xp9OPicType: (json['ha3xp9'] as num?)?.toInt(),
      x01y7qOBase64String:
          (json['x01y7q'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$PicUploadReqReqToJson(PicUploadReqReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'ha3xp9': instance.ha3xp9OPicType,
      'x01y7q': instance.x01y7qOBase64String,
    };

CollTimeReq _$CollTimeReqFromJson(Map<String, dynamic> json) => CollTimeReq(
  raiaOUserGid: json['raia'] as String?,
  e479lgOCollectTimeType: (json['e479lg'] as num?)?.toInt(),
);

Map<String, dynamic> _$CollTimeReqToJson(CollTimeReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'e479lg': instance.e479lgOCollectTimeType,
    };

CheckFirstLoanReq _$CheckFirstLoanReqFromJson(Map<String, dynamic> json) =>
    CheckFirstLoanReq(raiaOUserGid: json['raia'] as String?);

Map<String, dynamic> _$CheckFirstLoanReqToJson(CheckFirstLoanReq instance) =>
    <String, dynamic>{'raia': instance.raiaOUserGid};

LoanOrderReq _$LoanOrderReqFromJson(Map<String, dynamic> json) => LoanOrderReq(
  raiaOUserGid: json['raia'] as String?,
  z38e62OOrderGid: json['z38e62'] as String?,
);

Map<String, dynamic> _$LoanOrderReqToJson(LoanOrderReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'z38e62': instance.z38e62OOrderGid,
    };

LoanPreInfoReq _$LoanPreInfoReqFromJson(Map<String, dynamic> json) =>
    LoanPreInfoReq(
      raiaOUserGid: json['raia'] as String?,
      retiaryOLoanAmount: (json['retiary'] as num?)?.toDouble(),
      foreyardOProductId: (json['foreyard'] as num?)?.toInt(),
      pinionOUserCouponGid: json['pinion'] as String?,
      x2anh3OStageFlag: (json['x2anh3'] as num?)?.toInt(),
      z38e62OOrderGid: json['z38e62'] as String?,
      vnbh46OBankCardGid: (json['vnbh46'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LoanPreInfoReqToJson(LoanPreInfoReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'retiary': instance.retiaryOLoanAmount,
      'foreyard': instance.foreyardOProductId,
      'pinion': instance.pinionOUserCouponGid,
      'x2anh3': instance.x2anh3OStageFlag,
      'z38e62': instance.z38e62OOrderGid,
      'vnbh46': instance.vnbh46OBankCardGid,
    };

LoanFeeDetailReq _$LoanFeeDetailReqFromJson(Map<String, dynamic> json) =>
    LoanFeeDetailReq(
      raiaOUserGid: json['raia'] as String?,
      d7x52pOBizChannel: json['d7x52p'] as String?,
      s377v5OBizLine: json['s377v5'] as String?,
    );

Map<String, dynamic> _$LoanFeeDetailReqToJson(LoanFeeDetailReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'd7x52p': instance.d7x52pOBizChannel,
      's377v5': instance.s377v5OBizLine,
    };

BankValidInfoReq _$BankValidInfoReqFromJson(Map<String, dynamic> json) =>
    BankValidInfoReq(raiaOUserGid: json['raia'] as String?);

Map<String, dynamic> _$BankValidInfoReqToJson(BankValidInfoReq instance) =>
    <String, dynamic>{'raia': instance.raiaOUserGid};

AbandonReasonReq _$AbandonReasonReqFromJson(Map<String, dynamic> json) =>
    AbandonReasonReq(
      raiaOUserGid: json['raia'] as String?,
      pageId: json['pageId'] as String?,
      artificeOAbandonCode:
          (json['artifice'] as List<dynamic>?)
              ?.map((e) => e as Object)
              .toList() ??
          [],
      fl93q8OAbandonReason: json['fl93q8'] as String?,
      ej04h8OReasonVersion: json['ej04h8'] as String?,
    );

Map<String, dynamic> _$AbandonReasonReqToJson(AbandonReasonReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'pageId': instance.pageId,
      'artifice': instance.artificeOAbandonCode,
      'fl93q8': instance.fl93q8OAbandonReason,
      'ej04h8': instance.ej04h8OReasonVersion,
    };

FeedbackReq _$FeedbackReqFromJson(Map<String, dynamic> json) => FeedbackReq(
  raiaOUserGid: json['raia'] as String?,
  content: json['content'] as String?,
  type: json['type'] as String?,
  source: json['source'] as String?,
);

Map<String, dynamic> _$FeedbackReqToJson(FeedbackReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'content': instance.content,
      'type': instance.type,
      'source': instance.source,
    };

NeedAbandonReasonReq _$NeedAbandonReasonReqFromJson(
  Map<String, dynamic> json,
) => NeedAbandonReasonReq(
  raiaOUserGid: json['raia'] as String?,
  pageId: json['pageId'] as String?,
  ej04h8OReasonVersion: json['ej04h8'] as String?,
);

Map<String, dynamic> _$NeedAbandonReasonReqToJson(
  NeedAbandonReasonReq instance,
) => <String, dynamic>{
  'raia': instance.raiaOUserGid,
  'pageId': instance.pageId,
  'ej04h8': instance.ej04h8OReasonVersion,
};

LoanNoticeReq _$LoanNoticeReqFromJson(Map<String, dynamic> json) =>
    LoanNoticeReq(
      raiaOUserGid: json['raia'] as String?,
      gynecoidOLoanNoticeCode: json['gynecoid'] as String?,
      d7x52pOBizChannel: json['d7x52p'] as String?,
      s377v5OBizLine: json['s377v5'] as String?,
    );

Map<String, dynamic> _$LoanNoticeReqToJson(LoanNoticeReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'gynecoid': instance.gynecoidOLoanNoticeCode,
      'd7x52p': instance.d7x52pOBizChannel,
      's377v5': instance.s377v5OBizLine,
    };

SubmitResultReq _$SubmitResultReqFromJson(Map<String, dynamic> json) =>
    SubmitResultReq(raiaOUserGid: json['raia'] as String?);

Map<String, dynamic> _$SubmitResultReqToJson(SubmitResultReq instance) =>
    <String, dynamic>{'raia': instance.raiaOUserGid};

LivingDataReq _$LivingDataReqFromJson(Map<String, dynamic> json) =>
    LivingDataReq(
      raiaOUserGid: json['raia'] as String?,
      d7x52pOBizChannel: json['d7x52p'] as String?,
      s377v5OBizLine: json['s377v5'] as String?,
      u2g032OStartTime: (json['u2g032'] as num?)?.toInt(),
      colubridOEndTime: (json['colubrid'] as num?)?.toInt(),
      outsungOLivingDataList: (json['outsung'] as List<dynamic>?)
          ?.map(
            (e) => LivingDataReq$OutsungOLivingDataList$Item.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );

Map<String, dynamic> _$LivingDataReqToJson(
  LivingDataReq instance,
) => <String, dynamic>{
  'raia': instance.raiaOUserGid,
  'd7x52p': instance.d7x52pOBizChannel,
  's377v5': instance.s377v5OBizLine,
  'u2g032': instance.u2g032OStartTime,
  'colubrid': instance.colubridOEndTime,
  'outsung': instance.outsungOLivingDataList?.map((e) => e.toJson()).toList(),
};

PhotoSubmitReq _$PhotoSubmitReqFromJson(Map<String, dynamic> json) =>
    PhotoSubmitReq(
      raiaOUserGid: json['raia'] as String?,
      merdekaOIdCard: json['merdeka'] as String?,
      is9e52OIdCardType: (json['is9e52'] as num?)?.toInt(),
      d7x52pOBizChannel: json['d7x52p'] as String?,
      su31n2OIdFrontUrl: json['su31n2'] as String?,
      plutusOIdBackUrl: json['plutus'] as String?,
      hognutOLivingUrl: json['hognut'] as String?,
    );

Map<String, dynamic> _$PhotoSubmitReqToJson(PhotoSubmitReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'merdeka': instance.merdekaOIdCard,
      'is9e52': instance.is9e52OIdCardType,
      'd7x52p': instance.d7x52pOBizChannel,
      'su31n2': instance.su31n2OIdFrontUrl,
      'plutus': instance.plutusOIdBackUrl,
      'hognut': instance.hognutOLivingUrl,
    };

SubmitDataReq _$SubmitDataReqFromJson(Map<String, dynamic> json) =>
    SubmitDataReq(
      raiaOUserGid: json['raia'] as String?,
      sordidOMobile: json['sordid'] as String?,
      gargetOBirthday: (json['garget'] as num?)?.toInt(),
      merdekaOIdCard: json['merdeka'] as String?,
      name: json['name'] as String?,
      lq1s05OFirstName: json['lq1s05'] as String?,
      darktownOLastName: json['darktown'] as String?,
      floozieOFatherSurname: json['floozie'] as String?,
      orpinOMatherSurname: json['orpin'] as String?,
      grippleOFirstContactName: json['gripple'] as String?,
      rainOFirstContactMobile: json['rain'] as String?,
      baryeOFirstContactRelationship: (json['barye'] as num?)?.toInt(),
      aquarianOSecondContactName: json['aquarian'] as String?,
      h3d2wfOSecondContactMobile: json['h3d2wf'] as String?,
      kibeOSecondContactRelationship: (json['kibe'] as num?)?.toInt(),
      gender: (json['gender'] as num?)?.toInt(),
      limpidlyOIncomeLevel: (json['limpidly'] as num?)?.toInt(),
      coseOEducation: (json['cose'] as num?)?.toInt(),
      m2wx4tOMaritalStatus: (json['m2wx4t'] as num?)?.toInt(),
      danielaOPostalCode: json['daniela'] as String?,
      x1iu04OOtherMobile: json['x1iu04'] as String?,
      spadicesOAddressState: json['spadices'] as String?,
      gasconyOAddressCity: json['gascony'] as String?,
      enfetterOAddressDistrict: json['enfetter'] as String?,
      craalOAddressDetail: json['craal'] as String?,
      chaffyOHouseStatus: (json['chaffy'] as num?)?.toInt(),
      a8vhhfOContactMobiles: json['a8vhhf'] as String?,
      f31u3kOEmail: json['f31u3k'] as String?,
      diopsideOOccupation: (json['diopside'] as num?)?.toInt(),
      alloOWorkingYears: (json['allo'] as num?)?.toInt(),
      b1417wOPayPeriod: (json['b1417w'] as num?)?.toInt(),
      r67p23OPayday: (json['r67p23'] as num?)?.toInt(),
      plenishOSecondPayday: (json['plenish'] as num?)?.toInt(),
      staticsOCreateTime: (json['statics'] as num?)?.toInt(),
      l16h95OUpdateTime: (json['l16h95'] as num?)?.toInt(),
      s377v5OBizLine: (json['s377v5'] as num?)?.toInt(),
      r78s45ORandomNumber: (json['r78s45'] as num?)?.toInt(),
      himfjuOOtherLoans: (json['himfju'] as num?)?.toInt(),
      bja8s5OElectricityBill: (json['bja8s5'] as num?)?.toInt(),
      volumenOElectricityRelated: json['volumen'] as String?,
      z4s937OHouseholdMonthlyExpenses: (json['z4s937'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SubmitDataReqToJson(SubmitDataReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'sordid': instance.sordidOMobile,
      'garget': instance.gargetOBirthday,
      'merdeka': instance.merdekaOIdCard,
      'name': instance.name,
      'lq1s05': instance.lq1s05OFirstName,
      'darktown': instance.darktownOLastName,
      'floozie': instance.floozieOFatherSurname,
      'orpin': instance.orpinOMatherSurname,
      'gripple': instance.grippleOFirstContactName,
      'rain': instance.rainOFirstContactMobile,
      'barye': instance.baryeOFirstContactRelationship,
      'aquarian': instance.aquarianOSecondContactName,
      'h3d2wf': instance.h3d2wfOSecondContactMobile,
      'kibe': instance.kibeOSecondContactRelationship,
      'gender': instance.gender,
      'limpidly': instance.limpidlyOIncomeLevel,
      'cose': instance.coseOEducation,
      'm2wx4t': instance.m2wx4tOMaritalStatus,
      'daniela': instance.danielaOPostalCode,
      'x1iu04': instance.x1iu04OOtherMobile,
      'spadices': instance.spadicesOAddressState,
      'gascony': instance.gasconyOAddressCity,
      'enfetter': instance.enfetterOAddressDistrict,
      'craal': instance.craalOAddressDetail,
      'chaffy': instance.chaffyOHouseStatus,
      'a8vhhf': instance.a8vhhfOContactMobiles,
      'f31u3k': instance.f31u3kOEmail,
      'diopside': instance.diopsideOOccupation,
      'allo': instance.alloOWorkingYears,
      'b1417w': instance.b1417wOPayPeriod,
      'r67p23': instance.r67p23OPayday,
      'plenish': instance.plenishOSecondPayday,
      'statics': instance.staticsOCreateTime,
      'l16h95': instance.l16h95OUpdateTime,
      's377v5': instance.s377v5OBizLine,
      'r78s45': instance.r78s45ORandomNumber,
      'himfju': instance.himfjuOOtherLoans,
      'bja8s5': instance.bja8s5OElectricityBill,
      'volumen': instance.volumenOElectricityRelated,
      'z4s937': instance.z4s937OHouseholdMonthlyExpenses,
    };

SubmitCheckReq _$SubmitCheckReqFromJson(Map<String, dynamic> json) =>
    SubmitCheckReq(
      raiaOUserGid: json['raia'] as String?,
      f31u3kOEmail: json['f31u3k'] as String?,
      merdekaOIdCard: json['merdeka'] as String?,
    );

Map<String, dynamic> _$SubmitCheckReqToJson(SubmitCheckReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'f31u3k': instance.f31u3kOEmail,
      'merdeka': instance.merdekaOIdCard,
    };

HomeCouponReq _$HomeCouponReqFromJson(Map<String, dynamic> json) =>
    HomeCouponReq(raiaOUserGid: json['raia'] as String?);

Map<String, dynamic> _$HomeCouponReqToJson(HomeCouponReq instance) =>
    <String, dynamic>{'raia': instance.raiaOUserGid};

LoanCouponReq _$LoanCouponReqFromJson(Map<String, dynamic> json) =>
    LoanCouponReq(
      raiaOUserGid: json['raia'] as String?,
      retiaryOLoanAmount: (json['retiary'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LoanCouponReqToJson(LoanCouponReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'retiary': instance.retiaryOLoanAmount,
    };

MyCouponReq _$MyCouponReqFromJson(Map<String, dynamic> json) => MyCouponReq(
  raiaOUserGid: json['raia'] as String?,
  type: (json['type'] as num?)?.toInt(),
);

Map<String, dynamic> _$MyCouponReqToJson(MyCouponReq instance) =>
    <String, dynamic>{'raia': instance.raiaOUserGid, 'type': instance.type};

CouponGetReq _$CouponGetReqFromJson(Map<String, dynamic> json) => CouponGetReq(
  raiaOUserGid: json['raia'] as String?,
  a17s38OActivityGid: json['a17s38'] as String?,
);

Map<String, dynamic> _$CouponGetReqToJson(CouponGetReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'a17s38': instance.a17s38OActivityGid,
    };

LandCouponReq _$LandCouponReqFromJson(Map<String, dynamic> json) =>
    LandCouponReq(
      raiaOUserGid: json['raia'] as String?,
      a17s38OActivityGid: json['a17s38'] as String?,
    );

Map<String, dynamic> _$LandCouponReqToJson(LandCouponReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'a17s38': instance.a17s38OActivityGid,
    };

CouponPopReq _$CouponPopReqFromJson(Map<String, dynamic> json) => CouponPopReq(
  raiaOUserGid: json['raia'] as String?,
  a17s38OActivityGid: json['a17s38'] as String?,
);

Map<String, dynamic> _$CouponPopReqToJson(CouponPopReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'a17s38': instance.a17s38OActivityGid,
    };

LoanBillReq _$LoanBillReqFromJson(Map<String, dynamic> json) => LoanBillReq(
  raiaOUserGid: json['raia'] as String?,
  size: (json['size'] as num?)?.toInt(),
  current: (json['current'] as num?)?.toInt(),
  d95091ORepaymentStatus:
      (json['d95091'] as List<dynamic>?)?.map((e) => e as Object).toList() ??
      [],
  suffOLoanStatus:
      (json['suff'] as List<dynamic>?)?.map((e) => e as Object).toList() ?? [],
);

Map<String, dynamic> _$LoanBillReqToJson(LoanBillReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'size': instance.size,
      'current': instance.current,
      'd95091': instance.d95091ORepaymentStatus,
      'suff': instance.suffOLoanStatus,
    };

BillStatusReq _$BillStatusReqFromJson(Map<String, dynamic> json) =>
    BillStatusReq(
      r5a4x8OLoanGid: (json['r5a4x8'] as num?)?.toInt(),
      a4wq4jORenewAmountRate: json['a4wq4j'] as String?,
    );

Map<String, dynamic> _$BillStatusReqToJson(BillStatusReq instance) =>
    <String, dynamic>{
      'r5a4x8': instance.r5a4x8OLoanGid,
      'a4wq4j': instance.a4wq4jORenewAmountRate,
    };

BillListReq _$BillListReqFromJson(Map<String, dynamic> json) =>
    BillListReq(raiaOUserGid: json['raia'] as String?);

Map<String, dynamic> _$BillListReqToJson(BillListReq instance) =>
    <String, dynamic>{'raia': instance.raiaOUserGid};

BillDetailReq _$BillDetailReqFromJson(Map<String, dynamic> json) =>
    BillDetailReq(
      r5a4x8OLoanGid: (json['r5a4x8'] as num?)?.toInt(),
      a4wq4jORenewAmountRate: json['a4wq4j'] as String?,
    );

Map<String, dynamic> _$BillDetailReqToJson(BillDetailReq instance) =>
    <String, dynamic>{
      'r5a4x8': instance.r5a4x8OLoanGid,
      'a4wq4j': instance.a4wq4jORenewAmountRate,
    };

BillRepayReq _$BillRepayReqFromJson(Map<String, dynamic> json) => BillRepayReq(
  raiaOUserGid: json['raia'] as String?,
  r5a4x8OLoanGid: (json['r5a4x8'] as num?)?.toInt(),
  size: (json['size'] as num?)?.toInt(),
  current: (json['current'] as num?)?.toInt(),
);

Map<String, dynamic> _$BillRepayReqToJson(BillRepayReq instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'r5a4x8': instance.r5a4x8OLoanGid,
      'size': instance.size,
      'current': instance.current,
    };

HeadResp _$HeadRespFromJson(Map<String, dynamic> json) => HeadResp(
  code: json['code'] as String?,
  msg: json['msg'] as String?,
  data: json['data'],
);

Map<String, dynamic> _$HeadRespToJson(HeadResp instance) => <String, dynamic>{
  'code': instance.code,
  'msg': instance.msg,
  'data': instance.data,
};

BankDeleteResp _$BankDeleteRespFromJson(Map<String, dynamic> json) =>
    BankDeleteResp(
      code: json['code'] as String?,
      msg: json['msg'] as String?,
      antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
      rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
      tympanumOMsgTitle: json['tympanum'] as String?,
      directOMsgBtn01: json['direct'] as String?,
      i9145gOMsgBtn02: json['i9145g'] as String?,
    );

Map<String, dynamic> _$BankDeleteRespToJson(BankDeleteResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'antiicer': instance.antiicerOMsgType,
      'rumford': instance.rumfordOMsgDisplay,
      'tympanum': instance.tympanumOMsgTitle,
      'direct': instance.directOMsgBtn01,
      'i9145g': instance.i9145gOMsgBtn02,
    };

MyBankCardResp$Item _$MyBankCardResp$ItemFromJson(Map<String, dynamic> json) =>
    MyBankCardResp$Item(
      vnbh46OBankCardGid: (json['vnbh46'] as num?)?.toInt(),
      t1h91pOBankName: json['t1h91p'] as String?,
      insolentOBankCode: json['insolent'] as String?,
      zebrineOCardNo: json['zebrine'] as String?,
      tigonOCardNoReal: json['tigon'] as String?,
      aot1jaOBindType: (json['aot1ja'] as num?)?.toInt(),
      f31u3kOEmail: json['f31u3k'] as String?,
      cvn: json['cvn'] as String?,
      stukaOExpiryDate: json['stuka'] as String?,
      journeyOIsValid: json['journey'] as bool?,
      moffieOIsAutoDeduct: json['moffie'] as bool?,
      exhedraOAccountType: (json['exhedra'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MyBankCardResp$ItemToJson(
  MyBankCardResp$Item instance,
) => <String, dynamic>{
  'vnbh46': instance.vnbh46OBankCardGid,
  't1h91p': instance.t1h91pOBankName,
  'insolent': instance.insolentOBankCode,
  'zebrine': instance.zebrineOCardNo,
  'tigon': instance.tigonOCardNoReal,
  'aot1ja': instance.aot1jaOBindType,
  'f31u3k': instance.f31u3kOEmail,
  'cvn': instance.cvn,
  'stuka': instance.stukaOExpiryDate,
  'journey': instance.journeyOIsValid,
  'moffie': instance.moffieOIsAutoDeduct,
  'exhedra': instance.exhedraOAccountType,
};

BankVOResp$Item _$BankVOResp$ItemFromJson(Map<String, dynamic> json) =>
    BankVOResp$Item(
      exonymOBankGid: json['exonym'] as String?,
      t1h91pOBankName: json['t1h91p'] as String?,
      insolentOBankCode: json['insolent'] as String?,
      songODigits: json['song'] as String?,
    );

Map<String, dynamic> _$BankVOResp$ItemToJson(BankVOResp$Item instance) =>
    <String, dynamic>{
      'exonym': instance.exonymOBankGid,
      't1h91p': instance.t1h91pOBankName,
      'insolent': instance.insolentOBankCode,
      'song': instance.songODigits,
    };

BankBinResp _$BankBinRespFromJson(Map<String, dynamic> json) => BankBinResp(
  exonymOBankGid: json['exonym'] as String?,
  t1h91pOBankName: json['t1h91p'] as String?,
  insolentOBankCode: json['insolent'] as String?,
  songODigits: json['song'] as String?,
);

Map<String, dynamic> _$BankBinRespToJson(BankBinResp instance) =>
    <String, dynamic>{
      'exonym': instance.exonymOBankGid,
      't1h91p': instance.t1h91pOBankName,
      'insolent': instance.insolentOBankCode,
      'song': instance.songODigits,
    };

BindResultResp _$BindResultRespFromJson(Map<String, dynamic> json) =>
    BindResultResp(
      status: (json['status'] as num?)?.toInt(),
      vx4165OFailReason: json['vx4165'] as String?,
    );

Map<String, dynamic> _$BindResultRespToJson(BindResultResp instance) =>
    <String, dynamic>{
      'status': instance.status,
      'vx4165': instance.vx4165OFailReason,
    };

BindCardResp _$BindCardRespFromJson(Map<String, dynamic> json) => BindCardResp(
  lynceanOBindcardGid: (json['lyncean'] as num?)?.toInt(),
  vnbh46OBankCardGid: (json['vnbh46'] as num?)?.toInt(),
  zj1m73OIsBindSuccess: json['zj1m73'] as bool?,
);

Map<String, dynamic> _$BindCardRespToJson(BindCardResp instance) =>
    <String, dynamic>{
      'lyncean': instance.lynceanOBindcardGid,
      'vnbh46': instance.vnbh46OBankCardGid,
      'zj1m73': instance.zj1m73OIsBindSuccess,
    };

BankCardResp$Item _$BankCardResp$ItemFromJson(Map<String, dynamic> json) =>
    BankCardResp$Item(
      vnbh46OBankCardGid: (json['vnbh46'] as num?)?.toInt(),
      t1h91pOBankName: json['t1h91p'] as String?,
      insolentOBankCode: json['insolent'] as String?,
      zebrineOCardNo: json['zebrine'] as String?,
      s90dw0OCciNumber: json['s90dw0'] as String?,
      f31u3kOEmail: json['f31u3k'] as String?,
      exhedraOAccountType: (json['exhedra'] as num?)?.toInt(),
      q732r7OCardTransMessage: json['q732r7'] as String?,
      o049cxOTransType: (json['o049cx'] as num?)?.toInt(),
      e29z9eODefaultCheckFlag: json['e29z9e'] as bool?,
      l83bexOLastTriggerTime: (json['l83bex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BankCardResp$ItemToJson(BankCardResp$Item instance) =>
    <String, dynamic>{
      'vnbh46': instance.vnbh46OBankCardGid,
      't1h91p': instance.t1h91pOBankName,
      'insolent': instance.insolentOBankCode,
      'zebrine': instance.zebrineOCardNo,
      's90dw0': instance.s90dw0OCciNumber,
      'f31u3k': instance.f31u3kOEmail,
      'exhedra': instance.exhedraOAccountType,
      'q732r7': instance.q732r7OCardTransMessage,
      'o049cx': instance.o049cxOTransType,
      'e29z9e': instance.e29z9eODefaultCheckFlag,
      'l83bex': instance.l83bexOLastTriggerTime,
    };

TraderPwdCheckResp _$TraderPwdCheckRespFromJson(Map<String, dynamic> json) =>
    TraderPwdCheckResp();

Map<String, dynamic> _$TraderPwdCheckRespToJson(TraderPwdCheckResp instance) =>
    <String, dynamic>{};

AccountCancelJudgeResp _$AccountCancelJudgeRespFromJson(
  Map<String, dynamic> json,
) => AccountCancelJudgeResp(
  code: json['code'] as String?,
  msg: json['msg'] as String?,
  antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
  rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
  tympanumOMsgTitle: json['tympanum'] as String?,
  directOMsgBtn01: json['direct'] as String?,
  i9145gOMsgBtn02: json['i9145g'] as String?,
);

Map<String, dynamic> _$AccountCancelJudgeRespToJson(
  AccountCancelJudgeResp instance,
) => <String, dynamic>{
  'code': instance.code,
  'msg': instance.msg,
  'antiicer': instance.antiicerOMsgType,
  'rumford': instance.rumfordOMsgDisplay,
  'tympanum': instance.tympanumOMsgTitle,
  'direct': instance.directOMsgBtn01,
  'i9145g': instance.i9145gOMsgBtn02,
};

CheckRegisterResp _$CheckRegisterRespFromJson(Map<String, dynamic> json) =>
    CheckRegisterResp(
      qm5h5tOIsRegistered: json['qm5h5t'] as bool?,
      fm50w8OLoginPwd: json['fm50w8'] as bool?,
      cressyOTraderPwd: json['cressy'] as bool?,
      j1mnl2OExistLoginPwd: json['j1mnl2'] as bool?,
    );

Map<String, dynamic> _$CheckRegisterRespToJson(CheckRegisterResp instance) =>
    <String, dynamic>{
      'qm5h5t': instance.qm5h5tOIsRegistered,
      'fm50w8': instance.fm50w8OLoginPwd,
      'cressy': instance.cressyOTraderPwd,
      'j1mnl2': instance.j1mnl2OExistLoginPwd,
    };

WhiteListResp _$WhiteListRespFromJson(Map<String, dynamic> json) =>
    WhiteListResp();

Map<String, dynamic> _$WhiteListRespToJson(WhiteListResp instance) =>
    <String, dynamic>{};

NeedCaptchaResp _$NeedCaptchaRespFromJson(Map<String, dynamic> json) =>
    NeedCaptchaResp(data: json['data'] as bool?);

Map<String, dynamic> _$NeedCaptchaRespToJson(NeedCaptchaResp instance) =>
    <String, dynamic>{'data': instance.data};

RegisterResp _$RegisterRespFromJson(Map<String, dynamic> json) => RegisterResp(
  sordidOMobile: json['sordid'] as String?,
  y260zpOToken: json['y260zp'] as String?,
  name: json['name'] as String?,
  raiaOUserGid: json['raia'] as String?,
  hik0qmORegisterTime: (json['hik0qm'] as num?)?.toInt(),
);

Map<String, dynamic> _$RegisterRespToJson(RegisterResp instance) =>
    <String, dynamic>{
      'sordid': instance.sordidOMobile,
      'y260zp': instance.y260zpOToken,
      'name': instance.name,
      'raia': instance.raiaOUserGid,
      'hik0qm': instance.hik0qmORegisterTime,
    };

UserInfoResp _$UserInfoRespFromJson(Map<String, dynamic> json) => UserInfoResp(
  name: json['name'] as String?,
  bvn: json['bvn'] as String?,
  merdekaOIdCard: json['merdeka'] as String?,
  hashIdCard: json['hashIdCard'] as String?,
  s6bfq9OUserClass: (json['s6bfq9'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserInfoRespToJson(UserInfoResp instance) =>
    <String, dynamic>{
      'name': instance.name,
      'bvn': instance.bvn,
      'merdeka': instance.merdekaOIdCard,
      'hashIdCard': instance.hashIdCard,
      's6bfq9': instance.s6bfq9OUserClass,
    };

LoginResp _$LoginRespFromJson(Map<String, dynamic> json) => LoginResp(
  sordidOMobile: json['sordid'] as String?,
  y260zpOToken: json['y260zp'] as String?,
  name: json['name'] as String?,
  raiaOUserGid: json['raia'] as String?,
  hik0qmORegisterTime: (json['hik0qm'] as num?)?.toInt(),
);

Map<String, dynamic> _$LoginRespToJson(LoginResp instance) => <String, dynamic>{
  'sordid': instance.sordidOMobile,
  'y260zp': instance.y260zpOToken,
  'name': instance.name,
  'raia': instance.raiaOUserGid,
  'hik0qm': instance.hik0qmORegisterTime,
};

CaptchaGetResp _$CaptchaGetRespFromJson(Map<String, dynamic> json) =>
    CaptchaGetResp();

Map<String, dynamic> _$CaptchaGetRespToJson(CaptchaGetResp instance) =>
    <String, dynamic>{};

AccountCancelAppResp _$AccountCancelAppRespFromJson(
  Map<String, dynamic> json,
) => AccountCancelAppResp(
  code: json['code'] as String?,
  msg: json['msg'] as String?,
  antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
  rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
  tympanumOMsgTitle: json['tympanum'] as String?,
  directOMsgBtn01: json['direct'] as String?,
  i9145gOMsgBtn02: json['i9145g'] as String?,
);

Map<String, dynamic> _$AccountCancelAppRespToJson(
  AccountCancelAppResp instance,
) => <String, dynamic>{
  'code': instance.code,
  'msg': instance.msg,
  'antiicer': instance.antiicerOMsgType,
  'rumford': instance.rumfordOMsgDisplay,
  'tympanum': instance.tympanumOMsgTitle,
  'direct': instance.directOMsgBtn01,
  'i9145g': instance.i9145gOMsgBtn02,
};

AccountCancelLandResp _$AccountCancelLandRespFromJson(
  Map<String, dynamic> json,
) => AccountCancelLandResp(
  code: json['code'] as String?,
  msg: json['msg'] as String?,
  antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
  rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
  tympanumOMsgTitle: json['tympanum'] as String?,
  directOMsgBtn01: json['direct'] as String?,
  i9145gOMsgBtn02: json['i9145g'] as String?,
);

Map<String, dynamic> _$AccountCancelLandRespToJson(
  AccountCancelLandResp instance,
) => <String, dynamic>{
  'code': instance.code,
  'msg': instance.msg,
  'antiicer': instance.antiicerOMsgType,
  'rumford': instance.rumfordOMsgDisplay,
  'tympanum': instance.tympanumOMsgTitle,
  'direct': instance.directOMsgBtn01,
  'i9145g': instance.i9145gOMsgBtn02,
};

TraderPwdResetResp _$TraderPwdResetRespFromJson(Map<String, dynamic> json) =>
    TraderPwdResetResp(
      code: json['code'] as String?,
      msg: json['msg'] as String?,
      antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
      rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
      tympanumOMsgTitle: json['tympanum'] as String?,
      directOMsgBtn01: json['direct'] as String?,
      i9145gOMsgBtn02: json['i9145g'] as String?,
    );

Map<String, dynamic> _$TraderPwdResetRespToJson(TraderPwdResetResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'antiicer': instance.antiicerOMsgType,
      'rumford': instance.rumfordOMsgDisplay,
      'tympanum': instance.tympanumOMsgTitle,
      'direct': instance.directOMsgBtn01,
      'i9145g': instance.i9145gOMsgBtn02,
    };

LoginPwdResetResp _$LoginPwdResetRespFromJson(Map<String, dynamic> json) =>
    LoginPwdResetResp(
      code: json['code'] as String?,
      msg: json['msg'] as String?,
      antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
      rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
      tympanumOMsgTitle: json['tympanum'] as String?,
      directOMsgBtn01: json['direct'] as String?,
      i9145gOMsgBtn02: json['i9145g'] as String?,
    );

Map<String, dynamic> _$LoginPwdResetRespToJson(LoginPwdResetResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'antiicer': instance.antiicerOMsgType,
      'rumford': instance.rumfordOMsgDisplay,
      'tympanum': instance.tympanumOMsgTitle,
      'direct': instance.directOMsgBtn01,
      'i9145g': instance.i9145gOMsgBtn02,
    };

LogUploadResp _$LogUploadRespFromJson(Map<String, dynamic> json) =>
    LogUploadResp();

Map<String, dynamic> _$LogUploadRespToJson(LogUploadResp instance) =>
    <String, dynamic>{};

CaptchaCheckResp _$CaptchaCheckRespFromJson(Map<String, dynamic> json) =>
    CaptchaCheckResp(
      code: json['code'] as String?,
      msg: json['msg'] as String?,
      antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
      rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
      tympanumOMsgTitle: json['tympanum'] as String?,
      directOMsgBtn01: json['direct'] as String?,
      i9145gOMsgBtn02: json['i9145g'] as String?,
    );

Map<String, dynamic> _$CaptchaCheckRespToJson(CaptchaCheckResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'antiicer': instance.antiicerOMsgType,
      'rumford': instance.rumfordOMsgDisplay,
      'tympanum': instance.tympanumOMsgTitle,
      'direct': instance.directOMsgBtn01,
      'i9145g': instance.i9145gOMsgBtn02,
    };

CodeVerifyResp _$CodeVerifyRespFromJson(Map<String, dynamic> json) =>
    CodeVerifyResp(
      code: json['code'] as String?,
      msg: json['msg'] as String?,
      antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
      rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
      tympanumOMsgTitle: json['tympanum'] as String?,
      directOMsgBtn01: json['direct'] as String?,
      i9145gOMsgBtn02: json['i9145g'] as String?,
    );

Map<String, dynamic> _$CodeVerifyRespToJson(CodeVerifyResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'antiicer': instance.antiicerOMsgType,
      'rumford': instance.rumfordOMsgDisplay,
      'tympanum': instance.tympanumOMsgTitle,
      'direct': instance.directOMsgBtn01,
      'i9145g': instance.i9145gOMsgBtn02,
    };

CodeSendResp _$CodeSendRespFromJson(Map<String, dynamic> json) => CodeSendResp(
  code: json['code'] as String?,
  msg: json['msg'] as String?,
  antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
  rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
  tympanumOMsgTitle: json['tympanum'] as String?,
  directOMsgBtn01: json['direct'] as String?,
  i9145gOMsgBtn02: json['i9145g'] as String?,
);

Map<String, dynamic> _$CodeSendRespToJson(CodeSendResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'antiicer': instance.antiicerOMsgType,
      'rumford': instance.rumfordOMsgDisplay,
      'tympanum': instance.tympanumOMsgTitle,
      'direct': instance.directOMsgBtn01,
      'i9145g': instance.i9145gOMsgBtn02,
    };

TrackReportResp _$TrackReportRespFromJson(Map<String, dynamic> json) =>
    TrackReportResp(
      code: json['code'] as String?,
      msg: json['msg'] as String?,
      antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
      rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
      tympanumOMsgTitle: json['tympanum'] as String?,
      directOMsgBtn01: json['direct'] as String?,
      i9145gOMsgBtn02: json['i9145g'] as String?,
    );

Map<String, dynamic> _$TrackReportRespToJson(TrackReportResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'antiicer': instance.antiicerOMsgType,
      'rumford': instance.rumfordOMsgDisplay,
      'tympanum': instance.tympanumOMsgTitle,
      'direct': instance.directOMsgBtn01,
      'i9145g': instance.i9145gOMsgBtn02,
    };

NeedReportResp _$NeedReportRespFromJson(Map<String, dynamic> json) =>
    NeedReportResp(
      q0ui28OIsNeedReport: json['q0ui28'] as bool?,
      paroxysmOReportTimeOut: (json['paroxysm'] as num?)?.toInt(),
      f4d0s6OReportTimes: (json['f4d0s6'] as num?)?.toInt(),
      stationOReportLeftTimes: (json['station'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NeedReportRespToJson(NeedReportResp instance) =>
    <String, dynamic>{
      'q0ui28': instance.q0ui28OIsNeedReport,
      'paroxysm': instance.paroxysmOReportTimeOut,
      'f4d0s6': instance.f4d0s6OReportTimes,
      'station': instance.stationOReportLeftTimes,
    };

RiskReportResp _$RiskReportRespFromJson(Map<String, dynamic> json) =>
    RiskReportResp(
      zdzsepOVerificationConfig: json['zdzsep'] == null
          ? null
          : RiskReportResp$ZdzsepOVerificationConfig.fromJson(
              json['zdzsep'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$RiskReportRespToJson(RiskReportResp instance) =>
    <String, dynamic>{'zdzsep': instance.zdzsepOVerificationConfig?.toJson()};

VaCreateResp _$VaCreateRespFromJson(Map<String, dynamic> json) => VaCreateResp(
  code: json['code'] as String?,
  msg: json['msg'] as String?,
  antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
  rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
  tympanumOMsgTitle: json['tympanum'] as String?,
  directOMsgBtn01: json['direct'] as String?,
  i9145gOMsgBtn02: json['i9145g'] as String?,
);

Map<String, dynamic> _$VaCreateRespToJson(VaCreateResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'antiicer': instance.antiicerOMsgType,
      'rumford': instance.rumfordOMsgDisplay,
      'tympanum': instance.tympanumOMsgTitle,
      'direct': instance.directOMsgBtn01,
      'i9145g': instance.i9145gOMsgBtn02,
    };

VoSubmitResp _$VoSubmitRespFromJson(Map<String, dynamic> json) => VoSubmitResp(
  code: json['code'] as String?,
  msg: json['msg'] as String?,
  antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
  rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
  tympanumOMsgTitle: json['tympanum'] as String?,
  directOMsgBtn01: json['direct'] as String?,
  i9145gOMsgBtn02: json['i9145g'] as String?,
);

Map<String, dynamic> _$VoSubmitRespToJson(VoSubmitResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'antiicer': instance.antiicerOMsgType,
      'rumford': instance.rumfordOMsgDisplay,
      'tympanum': instance.tympanumOMsgTitle,
      'direct': instance.directOMsgBtn01,
      'i9145g': instance.i9145gOMsgBtn02,
    };

VaGetResp _$VaGetRespFromJson(Map<String, dynamic> json) => VaGetResp(
  yca98cOAccount: json['yca98c'] as String?,
  eff6jkOExpTime: (json['eff6jk'] as num?)?.toInt(),
  t1h91pOBankName: json['t1h91p'] as String?,
  insolentOBankCode: json['insolent'] as String?,
  g550r5OAccountName: json['g550r5'] as String?,
);

Map<String, dynamic> _$VaGetRespToJson(VaGetResp instance) => <String, dynamic>{
  'yca98c': instance.yca98cOAccount,
  'eff6jk': instance.eff6jkOExpTime,
  't1h91p': instance.t1h91pOBankName,
  'insolent': instance.insolentOBankCode,
  'g550r5': instance.g550r5OAccountName,
};

RepayApplyResp _$RepayApplyRespFromJson(Map<String, dynamic> json) =>
    RepayApplyResp(
      r5a4x8OLoanGid: (json['r5a4x8'] as num?)?.toInt(),
      raiaOUserGid: json['raia'] as String?,
      n410zdOLoanTime: (json['n410zd'] as num?)?.toInt(),
      r5k31qODueTime: (json['r5k31q'] as num?)?.toInt(),
      coandaODueDays: (json['coanda'] as num?)?.toInt(),
      faciendOOverdueFee: (json['faciend'] as num?)?.toDouble(),
      gatemanORepaymentAmount: (json['gateman'] as num?)?.toDouble(),
      wantonlyOLoanLeftAmount: (json['wantonly'] as num?)?.toDouble(),
      d95091ORepaymentStatus: (json['d95091'] as num?)?.toInt(),
      oj603uOApplyId: (json['oj603u'] as num?)?.toInt(),
      parquetORedirectUrl: json['parquet'] as String?,
      zebrineOCardNo: json['zebrine'] as String?,
      cvv: json['cvv'] as String?,
      courtierOAccessCode: json['courtier'] as String?,
      p9428vOExpireTime: (json['p9428v'] as num?)?.toInt(),
      krddvvOReference: json['krddvv'] as String?,
      w2y37vOOrderType: (json['w2y37v'] as num?)?.toInt(),
      oe5u39OChannelName: json['oe5u39'] as String?,
      tartarlyOPins: (json['tartarly'] as List<dynamic>?)
          ?.map(
            (e) => RepayApplyResp$TartarlyOPins$Item.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );

Map<String, dynamic> _$RepayApplyRespToJson(RepayApplyResp instance) =>
    <String, dynamic>{
      'r5a4x8': instance.r5a4x8OLoanGid,
      'raia': instance.raiaOUserGid,
      'n410zd': instance.n410zdOLoanTime,
      'r5k31q': instance.r5k31qODueTime,
      'coanda': instance.coandaODueDays,
      'faciend': instance.faciendOOverdueFee,
      'gateman': instance.gatemanORepaymentAmount,
      'wantonly': instance.wantonlyOLoanLeftAmount,
      'd95091': instance.d95091ORepaymentStatus,
      'oj603u': instance.oj603uOApplyId,
      'parquet': instance.parquetORedirectUrl,
      'zebrine': instance.zebrineOCardNo,
      'cvv': instance.cvv,
      'courtier': instance.courtierOAccessCode,
      'p9428v': instance.p9428vOExpireTime,
      'krddvv': instance.krddvvOReference,
      'w2y37v': instance.w2y37vOOrderType,
      'oe5u39': instance.oe5u39OChannelName,
      'tartarly': instance.tartarlyOPins?.map((e) => e.toJson()).toList(),
    };

RepayRecordResp$Item _$RepayRecordResp$ItemFromJson(
  Map<String, dynamic> json,
) => RepayRecordResp$Item(
  e77490ORequestId: json['e77490'] as String?,
  t1h91pOBankName: json['t1h91p'] as String?,
  o12sd0OAmount: (json['o12sd0'] as num?)?.toDouble(),
  lz09kpOUserName: json['lz09kp'] as String?,
  staticsOCreateTime: (json['statics'] as num?)?.toInt(),
  status: (json['status'] as num?)?.toInt(),
  electiveOPicUrl: json['elective'] as String?,
  ratteenORejectReason: json['ratteen'] as String?,
);

Map<String, dynamic> _$RepayRecordResp$ItemToJson(
  RepayRecordResp$Item instance,
) => <String, dynamic>{
  'e77490': instance.e77490ORequestId,
  't1h91p': instance.t1h91pOBankName,
  'o12sd0': instance.o12sd0OAmount,
  'lz09kp': instance.lz09kpOUserName,
  'statics': instance.staticsOCreateTime,
  'status': instance.status,
  'elective': instance.electiveOPicUrl,
  'ratteen': instance.ratteenORejectReason,
};

CheckReviewAccountResp _$CheckReviewAccountRespFromJson(
  Map<String, dynamic> json,
) => CheckReviewAccountResp();

Map<String, dynamic> _$CheckReviewAccountRespToJson(
  CheckReviewAccountResp instance,
) => <String, dynamic>{};

MainInfoResp _$MainInfoRespFromJson(Map<String, dynamic> json) =>
    MainInfoResp();

Map<String, dynamic> _$MainInfoRespToJson(MainInfoResp instance) =>
    <String, dynamic>{};

NoticeMainResp _$NoticeMainRespFromJson(Map<String, dynamic> json) =>
    NoticeMainResp();

Map<String, dynamic> _$NoticeMainRespToJson(NoticeMainResp instance) =>
    <String, dynamic>{};

VersionCheckResp _$VersionCheckRespFromJson(Map<String, dynamic> json) =>
    VersionCheckResp(
      code: json['code'] as String?,
      msg: json['msg'] as String?,
      antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
      rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
      tympanumOMsgTitle: json['tympanum'] as String?,
      directOMsgBtn01: json['direct'] as String?,
      i9145gOMsgBtn02: json['i9145g'] as String?,
      data: json['data'] == null
          ? null
          : VersionCheckResp$Data.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$VersionCheckRespToJson(VersionCheckResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'antiicer': instance.antiicerOMsgType,
      'rumford': instance.rumfordOMsgDisplay,
      'tympanum': instance.tympanumOMsgTitle,
      'direct': instance.directOMsgBtn01,
      'i9145g': instance.i9145gOMsgBtn02,
      'data': instance.data?.toJson(),
    };

ColoanGpResp _$ColoanGpRespFromJson(Map<String, dynamic> json) => ColoanGpResp(
  s2c1wyOAppCoLoanGpDetailPOList: (json['s2c1wy'] as List<dynamic>?)
      ?.map(
        (e) => ColoanGpResp$S2c1wyOAppCoLoanGpDetailPOList$Item.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
);

Map<String, dynamic> _$ColoanGpRespToJson(ColoanGpResp instance) =>
    <String, dynamic>{
      's2c1wy': instance.s2c1wyOAppCoLoanGpDetailPOList
          ?.map((e) => e.toJson())
          .toList(),
    };

HomeInfoResp _$HomeInfoRespFromJson(Map<String, dynamic> json) => HomeInfoResp(
  bopomofoOCreditStatus: (json['bopomofo'] as num?)?.toInt(),
  rnpu7fOCreditLine: (json['rnpu7f'] as num?)?.toDouble(),
  papuanOLastRecordLoan: json['papuan'] == null
      ? null
      : HomeInfoResp$PapuanOLastRecordLoan.fromJson(
          json['papuan'] as Map<String, dynamic>,
        ),
  xu551uOSpareLastRecordLoan: json['xu551u'] == null
      ? null
      : HomeInfoResp$Xu551uOSpareLastRecordLoan.fromJson(
          json['xu551u'] as Map<String, dynamic>,
        ),
  overdidOIsLockAll: json['overdid'] as bool?,
  mojr11OLoanRangeMin: (json['mojr11'] as num?)?.toDouble(),
  xuwh2oOLoanRangeMax: (json['xuwh2o'] as num?)?.toDouble(),
  marrowOLoanRangeUnit: (json['marrow'] as num?)?.toDouble(),
  fx6b0yOIsFreeze: (json['fx6b0y'] as num?)?.toInt(),
  grafterOIsWhiteUser: json['grafter'] as bool?,
  za1s1eOSpareCreditLine: (json['za1s1e'] as num?)?.toDouble(),
  u6n134OSpareCanBorrowAmount: (json['u6n134'] as num?)?.toDouble(),
  nailheadOIsSpareLockAll: json['nailhead'] as bool?,
  lysogenOSpareProductGroup: (json['lysogen'] as List<dynamic>?)
      ?.map(
        (e) => HomeInfoResp$LysogenOSpareProductGroup$Item.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  spicateOSpareLoanRangeMin: (json['spicate'] as num?)?.toDouble(),
  cumarinOSpareLoanRangeMax: (json['cumarin'] as num?)?.toDouble(),
  iwibiuOSpareLoanRangeUnit: (json['iwibiu'] as num?)?.toDouble(),
  assurOFaceList: (json['assur'] as List<dynamic>?)
      ?.map(
        (e) => HomeInfoResp$AssurOFaceList$Item.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  v7d1moOSpareFaceType: json['v7d1mo'] as String?,
  parryOSpareFaceList: (json['parry'] as List<dynamic>?)
      ?.map(
        (e) => HomeInfoResp$ParryOSpareFaceList$Item.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  s2c1wyOAppCoLoanGpDetailPOList: (json['s2c1wy'] as List<dynamic>?)
      ?.map(
        (e) => HomeInfoResp$S2c1wyOAppCoLoanGpDetailPOList$Item.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  co5i9lOForceUpdateFlag: json['co5i9l'] as bool?,
  y934teOTotalAmount: (json['y934te'] as num?)?.toDouble(),
  yawnOExpectTime: (json['yawn'] as num?)?.toInt(),
  undyedOHasLoan: json['undyed'] as bool?,
);

Map<String, dynamic> _$HomeInfoRespToJson(HomeInfoResp instance) =>
    <String, dynamic>{
      'bopomofo': instance.bopomofoOCreditStatus,
      'rnpu7f': instance.rnpu7fOCreditLine,
      'papuan': instance.papuanOLastRecordLoan?.toJson(),
      'xu551u': instance.xu551uOSpareLastRecordLoan?.toJson(),
      'overdid': instance.overdidOIsLockAll,
      'mojr11': instance.mojr11OLoanRangeMin,
      'xuwh2o': instance.xuwh2oOLoanRangeMax,
      'marrow': instance.marrowOLoanRangeUnit,
      'fx6b0y': instance.fx6b0yOIsFreeze,
      'grafter': instance.grafterOIsWhiteUser,
      'za1s1e': instance.za1s1eOSpareCreditLine,
      'u6n134': instance.u6n134OSpareCanBorrowAmount,
      'nailhead': instance.nailheadOIsSpareLockAll,
      'lysogen': instance.lysogenOSpareProductGroup
          ?.map((e) => e.toJson())
          .toList(),
      'spicate': instance.spicateOSpareLoanRangeMin,
      'cumarin': instance.cumarinOSpareLoanRangeMax,
      'iwibiu': instance.iwibiuOSpareLoanRangeUnit,
      'assur': instance.assurOFaceList?.map((e) => e.toJson()).toList(),
      'v7d1mo': instance.v7d1moOSpareFaceType,
      'parry': instance.parryOSpareFaceList?.map((e) => e.toJson()).toList(),
      's2c1wy': instance.s2c1wyOAppCoLoanGpDetailPOList
          ?.map((e) => e.toJson())
          .toList(),
      'co5i9l': instance.co5i9lOForceUpdateFlag,
      'y934te': instance.y934teOTotalAmount,
      'yawn': instance.yawnOExpectTime,
      'undyed': instance.undyedOHasLoan,
    };

LoanConfirmResp _$LoanConfirmRespFromJson(Map<String, dynamic> json) =>
    LoanConfirmResp(
      suffOLoanStatus: (json['suff'] as num?)?.toInt(),
      hyphenOReason: json['hyphen'] as String?,
    );

Map<String, dynamic> _$LoanConfirmRespToJson(LoanConfirmResp instance) =>
    <String, dynamic>{
      'suff': instance.suffOLoanStatus,
      'hyphen': instance.hyphenOReason,
    };

PicUploadReqResp _$PicUploadReqRespFromJson(Map<String, dynamic> json) =>
    PicUploadReqResp(
      code: json['code'] as String?,
      msg: json['msg'] as String?,
      antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
      rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
      tympanumOMsgTitle: json['tympanum'] as String?,
      directOMsgBtn01: json['direct'] as String?,
      i9145gOMsgBtn02: json['i9145g'] as String?,
      data: json['data'] == null
          ? null
          : PicUploadReqResp$Data.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$PicUploadReqRespToJson(PicUploadReqResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'antiicer': instance.antiicerOMsgType,
      'rumford': instance.rumfordOMsgDisplay,
      'tympanum': instance.tympanumOMsgTitle,
      'direct': instance.directOMsgBtn01,
      'i9145g': instance.i9145gOMsgBtn02,
      'data': instance.data?.toJson(),
    };

CollTimeResp _$CollTimeRespFromJson(Map<String, dynamic> json) => CollTimeResp(
  code: json['code'] as String?,
  msg: json['msg'] as String?,
  antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
  rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
  tympanumOMsgTitle: json['tympanum'] as String?,
  directOMsgBtn01: json['direct'] as String?,
  i9145gOMsgBtn02: json['i9145g'] as String?,
);

Map<String, dynamic> _$CollTimeRespToJson(CollTimeResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'antiicer': instance.antiicerOMsgType,
      'rumford': instance.rumfordOMsgDisplay,
      'tympanum': instance.tympanumOMsgTitle,
      'direct': instance.directOMsgBtn01,
      'i9145g': instance.i9145gOMsgBtn02,
    };

CheckFirstLoanResp _$CheckFirstLoanRespFromJson(Map<String, dynamic> json) =>
    CheckFirstLoanResp(
      raiaOUserGid: json['raia'] as String?,
      candidlyOIsFirst: json['candidly'] as bool?,
      tassesOPopUpNotice: json['tasses'] as bool?,
    );

Map<String, dynamic> _$CheckFirstLoanRespToJson(CheckFirstLoanResp instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'candidly': instance.candidlyOIsFirst,
      'tasses': instance.tassesOPopUpNotice,
    };

LoanOrderResp _$LoanOrderRespFromJson(Map<String, dynamic> json) =>
    LoanOrderResp(
      id: (json['id'] as num?)?.toInt(),
      r5a4x8OLoanGid: (json['r5a4x8'] as num?)?.toInt(),
      staticsOCreateTime: (json['statics'] as num?)?.toInt(),
      l16h95OUpdateTime: (json['l16h95'] as num?)?.toInt(),
      raiaOUserGid: json['raia'] as String?,
      vkql27OReqChannel: (json['vkql27'] as num?)?.toInt(),
      zebrassOReqSubChannel: (json['zebrass'] as num?)?.toInt(),
      feminieOCardAccount: json['feminie'] as String?,
      diosmoseOLoanType: (json['diosmose'] as num?)?.toInt(),
      qc5edvORepaymentChannel: json['qc5edv'] as String?,
      tonelessORepaymentChannelName: json['toneless'] as String?,
      ussuriOPaymentChannel: json['ussuri'] as String?,
      dauntingOPaymentChannelName: json['daunting'] as String?,
      foreyardOProductId: (json['foreyard'] as num?)?.toInt(),
      spinachyOLoanPeriod: (json['spinachy'] as num?)?.toInt(),
      n410zdOLoanTime: (json['n410zd'] as num?)?.toInt(),
      r5k31qODueTime: (json['r5k31q'] as num?)?.toInt(),
      retiaryOLoanAmount: (json['retiary'] as num?)?.toDouble(),
      suffOLoanStatus: (json['suff'] as num?)?.toInt(),
      vx4165OFailReason: json['vx4165'] as String?,
      v4nynoOFeeType: (json['v4nyno'] as num?)?.toInt(),
      e88wy1OLoanFee: (json['e88wy1'] as num?)?.toDouble(),
      q3568aOLoanPrefixRate: (json['q3568a'] as num?)?.toDouble(),
      muscleOPrefixFee: (json['muscle'] as num?)?.toDouble(),
      e2x2waOPayableFee: (json['e2x2wa'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      pluralOReceiveAmount: (json['plural'] as num?)?.toDouble(),
      nbk975OPlatformAmount: (json['nbk975'] as num?)?.toDouble(),
      faciendOOverdueFee: (json['faciend'] as num?)?.toDouble(),
      wantonlyOLoanLeftAmount: (json['wantonly'] as num?)?.toDouble(),
      gatemanORepaymentAmount: (json['gateman'] as num?)?.toDouble(),
      hakodateOLastRepaymentTime: (json['hakodate'] as num?)?.toInt(),
      d95091ORepaymentStatus: (json['d95091'] as num?)?.toInt(),
      johannesODosettleFeeTime: (json['johannes'] as num?)?.toInt(),
      slackOIsOverdue: json['slack'] as bool?,
      c2r90qOLoanRefixRate: (json['c2r90q'] as num?)?.toDouble(),
      tigereyeOInterest: (json['tigereye'] as num?)?.toDouble(),
      remark: json['remark'] as String?,
      z38e62OOrderGid: json['z38e62'] as String?,
      vnbh46OBankCardGid: (json['vnbh46'] as num?)?.toInt(),
      t1h91pOBankName: json['t1h91p'] as String?,
      r8fgx7OHashCardAccount: json['r8fgx7'] as String?,
      e0a79hOIsCollectCase: json['e0a79h'] as bool?,
      n5ioy3ORenewLoanGid: (json['n5ioy3'] as num?)?.toInt(),
      d7x52pOBizChannel: json['d7x52p'] as String?,
      pinionOUserCouponGid: json['pinion'] as String?,
      sk6s63OCouponAmount: (json['sk6s63'] as num?)?.toDouble(),
      sweenyOWorkFlowId: (json['sweeny'] as num?)?.toInt(),
      brantOPurpose: (json['brant'] as num?)?.toInt(),
      mxs06uOApplyStatus: json['mxs06u'] as String?,
      r86mu7OProductTag: json['r86mu7'] as String?,
      ez64t7OPeriodCount: (json['ez64t7'] as num?)?.toInt(),
      maxDueDay: (json['maxDueDay'] as num?)?.toInt(),
      j4n2j6ODueRate: json['j4n2j6'] as String?,
      periodPaidCount: (json['periodPaidCount'] as num?)?.toInt(),
      z7c658OPrincipalPaidAmount: (json['z7c658'] as num?)?.toDouble(),
      reeditOServiceFeePaidAmount: (json['reedit'] as num?)?.toDouble(),
      guilefulOOverdueFeePaidAmount: (json['guileful'] as num?)?.toDouble(),
      emceeOReduceAmount: (json['emcee'] as num?)?.toDouble(),
      spriteOBusinessFee: (json['sprite'] as num?)?.toDouble(),
      loanRank: (json['loanRank'] as num?)?.toInt(),
      renewPaidAmount: (json['renewPaidAmount'] as num?)?.toDouble(),
      renewLoanFee: (json['renewLoanFee'] as num?)?.toDouble(),
      originDueTime: (json['originDueTime'] as num?)?.toInt(),
      firstRenewLoanTime: (json['firstRenewLoanTime'] as num?)?.toInt(),
      chuseOLoanProductType: (json['chuse'] as num?)?.toInt(),
      riskUserType: (json['riskUserType'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LoanOrderRespToJson(LoanOrderResp instance) =>
    <String, dynamic>{
      'id': instance.id,
      'r5a4x8': instance.r5a4x8OLoanGid,
      'statics': instance.staticsOCreateTime,
      'l16h95': instance.l16h95OUpdateTime,
      'raia': instance.raiaOUserGid,
      'vkql27': instance.vkql27OReqChannel,
      'zebrass': instance.zebrassOReqSubChannel,
      'feminie': instance.feminieOCardAccount,
      'diosmose': instance.diosmoseOLoanType,
      'qc5edv': instance.qc5edvORepaymentChannel,
      'toneless': instance.tonelessORepaymentChannelName,
      'ussuri': instance.ussuriOPaymentChannel,
      'daunting': instance.dauntingOPaymentChannelName,
      'foreyard': instance.foreyardOProductId,
      'spinachy': instance.spinachyOLoanPeriod,
      'n410zd': instance.n410zdOLoanTime,
      'r5k31q': instance.r5k31qODueTime,
      'retiary': instance.retiaryOLoanAmount,
      'suff': instance.suffOLoanStatus,
      'vx4165': instance.vx4165OFailReason,
      'v4nyno': instance.v4nynoOFeeType,
      'e88wy1': instance.e88wy1OLoanFee,
      'q3568a': instance.q3568aOLoanPrefixRate,
      'muscle': instance.muscleOPrefixFee,
      'e2x2wa': instance.e2x2waOPayableFee,
      'tax': instance.tax,
      'plural': instance.pluralOReceiveAmount,
      'nbk975': instance.nbk975OPlatformAmount,
      'faciend': instance.faciendOOverdueFee,
      'wantonly': instance.wantonlyOLoanLeftAmount,
      'gateman': instance.gatemanORepaymentAmount,
      'hakodate': instance.hakodateOLastRepaymentTime,
      'd95091': instance.d95091ORepaymentStatus,
      'johannes': instance.johannesODosettleFeeTime,
      'slack': instance.slackOIsOverdue,
      'c2r90q': instance.c2r90qOLoanRefixRate,
      'tigereye': instance.tigereyeOInterest,
      'remark': instance.remark,
      'z38e62': instance.z38e62OOrderGid,
      'vnbh46': instance.vnbh46OBankCardGid,
      't1h91p': instance.t1h91pOBankName,
      'r8fgx7': instance.r8fgx7OHashCardAccount,
      'e0a79h': instance.e0a79hOIsCollectCase,
      'n5ioy3': instance.n5ioy3ORenewLoanGid,
      'd7x52p': instance.d7x52pOBizChannel,
      'pinion': instance.pinionOUserCouponGid,
      'sk6s63': instance.sk6s63OCouponAmount,
      'sweeny': instance.sweenyOWorkFlowId,
      'brant': instance.brantOPurpose,
      'mxs06u': instance.mxs06uOApplyStatus,
      'r86mu7': instance.r86mu7OProductTag,
      'ez64t7': instance.ez64t7OPeriodCount,
      'maxDueDay': instance.maxDueDay,
      'j4n2j6': instance.j4n2j6ODueRate,
      'periodPaidCount': instance.periodPaidCount,
      'z7c658': instance.z7c658OPrincipalPaidAmount,
      'reedit': instance.reeditOServiceFeePaidAmount,
      'guileful': instance.guilefulOOverdueFeePaidAmount,
      'emcee': instance.emceeOReduceAmount,
      'sprite': instance.spriteOBusinessFee,
      'loanRank': instance.loanRank,
      'renewPaidAmount': instance.renewPaidAmount,
      'renewLoanFee': instance.renewLoanFee,
      'originDueTime': instance.originDueTime,
      'firstRenewLoanTime': instance.firstRenewLoanTime,
      'chuse': instance.chuseOLoanProductType,
      'riskUserType': instance.riskUserType,
    };

LoanPreInfoResp _$LoanPreInfoRespFromJson(Map<String, dynamic> json) =>
    LoanPreInfoResp(
      raiaOUserGid: json['raia'] as String?,
      r5k31qODueTime: (json['r5k31q'] as num?)?.toInt(),
      retiaryOLoanAmount: (json['retiary'] as num?)?.toDouble(),
      pluralOReceiveAmount: (json['plural'] as num?)?.toDouble(),
      mt66nzOReceiveSubAmount: (json['mt66nz'] as num?)?.toDouble(),
      q922g5OReceiveAddAmount: (json['q922g5'] as num?)?.toDouble(),
      gatemanORepaymentAmount: (json['gateman'] as num?)?.toDouble(),
      v4nynoOFeeType: (json['v4nyno'] as num?)?.toInt(),
      e88wy1OLoanFee: (json['e88wy1'] as num?)?.toDouble(),
      b9h5ndOPreLoanFee: (json['b9h5nd'] as num?)?.toDouble(),
      l6v3npOPreFeeRate: (json['l6v3np'] as num?)?.toDouble(),
      fissionOAfterLoanFee: (json['fission'] as num?)?.toDouble(),
      ringhalsOAfterFeeRate: (json['ringhals'] as num?)?.toDouble(),
      h4f7x4OCoupon: (json['h4f7x4'] as num?)?.toDouble(),
      prelaticOReceiveAccount: json['prelatic'] as String?,
      qn9yimOHasTransPwd: (json['qn9yim'] as num?)?.toInt(),
      lumberlyOFeeRate: (json['lumberly'] as num?)?.toDouble(),
      reprisalOReceiveAccountHash: json['reprisal'] as String?,
      z38e62OOrderGid: json['z38e62'] as String?,
      unciformOOriginationFee: (json['unciform'] as num?)?.toDouble(),
      centiareOServiceFee: (json['centiare'] as num?)?.toDouble(),
      pinionOUserCouponGid: json['pinion'] as String?,
      sk6s63OCouponAmount: (json['sk6s63'] as num?)?.toDouble(),
      u04098OIsFirstLoan: json['u04098'] as bool?,
      nkf6o5OIsOtpValid: json['nkf6o5'] as bool?,
      taphouseOMobileList:
          (json['taphouse'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      cadremanOIsFaceValid: json['cadreman'] as bool?,
      woopieOOtpValidSwitch: (json['woopie'] as num?)?.toInt(),
      r86mu7OProductTag: json['r86mu7'] as String?,
      ez64t7OPeriodCount: (json['ez64t7'] as num?)?.toInt(),
      y5695eOProductFactory: json['y5695e'] == null
          ? null
          : LoanPreInfoResp$Y5695eOProductFactory.fromJson(
              json['y5695e'] as Map<String, dynamic>,
            ),
      foreyardOProductId: (json['foreyard'] as num?)?.toInt(),
      glacisORepaymentPlanList: (json['glacis'] as List<dynamic>?)
          ?.map(
            (e) => LoanPreInfoResp$GlacisORepaymentPlanList$Item.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      spinachyOLoanPeriod: (json['spinachy'] as num?)?.toInt(),
      t72jj1OCreditSearchFee: (json['t72jj1'] as num?)?.toDouble(),
      cdslOTransferFee: (json['cdsl'] as num?)?.toDouble(),
      badnessOIgvFee: (json['badness'] as num?)?.toDouble(),
      spriteOBusinessFee: (json['sprite'] as num?)?.toDouble(),
      chuseOLoanProductType: (json['chuse'] as num?)?.toInt(),
      orderOrigin: (json['orderOrigin'] as num?)?.toInt(),
      satCheckStatus: (json['satCheckStatus'] as num?)?.toInt(),
      cressyOTraderPwd: json['cressy'] as bool?,
    );

Map<String, dynamic> _$LoanPreInfoRespToJson(
  LoanPreInfoResp instance,
) => <String, dynamic>{
  'raia': instance.raiaOUserGid,
  'r5k31q': instance.r5k31qODueTime,
  'retiary': instance.retiaryOLoanAmount,
  'plural': instance.pluralOReceiveAmount,
  'mt66nz': instance.mt66nzOReceiveSubAmount,
  'q922g5': instance.q922g5OReceiveAddAmount,
  'gateman': instance.gatemanORepaymentAmount,
  'v4nyno': instance.v4nynoOFeeType,
  'e88wy1': instance.e88wy1OLoanFee,
  'b9h5nd': instance.b9h5ndOPreLoanFee,
  'l6v3np': instance.l6v3npOPreFeeRate,
  'fission': instance.fissionOAfterLoanFee,
  'ringhals': instance.ringhalsOAfterFeeRate,
  'h4f7x4': instance.h4f7x4OCoupon,
  'prelatic': instance.prelaticOReceiveAccount,
  'qn9yim': instance.qn9yimOHasTransPwd,
  'lumberly': instance.lumberlyOFeeRate,
  'reprisal': instance.reprisalOReceiveAccountHash,
  'z38e62': instance.z38e62OOrderGid,
  'unciform': instance.unciformOOriginationFee,
  'centiare': instance.centiareOServiceFee,
  'pinion': instance.pinionOUserCouponGid,
  'sk6s63': instance.sk6s63OCouponAmount,
  'u04098': instance.u04098OIsFirstLoan,
  'nkf6o5': instance.nkf6o5OIsOtpValid,
  'taphouse': instance.taphouseOMobileList,
  'cadreman': instance.cadremanOIsFaceValid,
  'woopie': instance.woopieOOtpValidSwitch,
  'r86mu7': instance.r86mu7OProductTag,
  'ez64t7': instance.ez64t7OPeriodCount,
  'y5695e': instance.y5695eOProductFactory?.toJson(),
  'foreyard': instance.foreyardOProductId,
  'glacis': instance.glacisORepaymentPlanList?.map((e) => e.toJson()).toList(),
  'spinachy': instance.spinachyOLoanPeriod,
  't72jj1': instance.t72jj1OCreditSearchFee,
  'cdsl': instance.cdslOTransferFee,
  'badness': instance.badnessOIgvFee,
  'sprite': instance.spriteOBusinessFee,
  'chuse': instance.chuseOLoanProductType,
  'orderOrigin': instance.orderOrigin,
  'satCheckStatus': instance.satCheckStatus,
  'cressy': instance.cressyOTraderPwd,
};

LoanFeeDetailResp _$LoanFeeDetailRespFromJson(Map<String, dynamic> json) =>
    LoanFeeDetailResp(
      code: json['code'] as String?,
      msg: json['msg'] as String?,
      antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
      rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
      tympanumOMsgTitle: json['tympanum'] as String?,
      directOMsgBtn01: json['direct'] as String?,
      i9145gOMsgBtn02: json['i9145g'] as String?,
      data: json['data'] == null
          ? null
          : LoanFeeDetailResp$Data.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$LoanFeeDetailRespToJson(LoanFeeDetailResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'antiicer': instance.antiicerOMsgType,
      'rumford': instance.rumfordOMsgDisplay,
      'tympanum': instance.tympanumOMsgTitle,
      'direct': instance.directOMsgBtn01,
      'i9145g': instance.i9145gOMsgBtn02,
      'data': instance.data?.toJson(),
    };

BankValidInfoResp _$BankValidInfoRespFromJson(Map<String, dynamic> json) =>
    BankValidInfoResp(
      exonymOBankGid: json['exonym'] as String?,
      t1h91pOBankName: json['t1h91p'] as String?,
      insolentOBankCode: json['insolent'] as String?,
      songODigits: json['song'] as String?,
      vnbh46OBankCardGid: (json['vnbh46'] as num?)?.toInt(),
      q732r7OCardTransMessage: json['q732r7'] as String?,
      zebrineOCardNo: json['zebrine'] as String?,
      exhedraOAccountType: (json['exhedra'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BankValidInfoRespToJson(BankValidInfoResp instance) =>
    <String, dynamic>{
      'exonym': instance.exonymOBankGid,
      't1h91p': instance.t1h91pOBankName,
      'insolent': instance.insolentOBankCode,
      'song': instance.songODigits,
      'vnbh46': instance.vnbh46OBankCardGid,
      'q732r7': instance.q732r7OCardTransMessage,
      'zebrine': instance.zebrineOCardNo,
      'exhedra': instance.exhedraOAccountType,
    };

AbandonReasonResp _$AbandonReasonRespFromJson(Map<String, dynamic> json) =>
    AbandonReasonResp(
      code: json['code'] as String?,
      msg: json['msg'] as String?,
      antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
      rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
      tympanumOMsgTitle: json['tympanum'] as String?,
      directOMsgBtn01: json['direct'] as String?,
      i9145gOMsgBtn02: json['i9145g'] as String?,
    );

Map<String, dynamic> _$AbandonReasonRespToJson(AbandonReasonResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'antiicer': instance.antiicerOMsgType,
      'rumford': instance.rumfordOMsgDisplay,
      'tympanum': instance.tympanumOMsgTitle,
      'direct': instance.directOMsgBtn01,
      'i9145g': instance.i9145gOMsgBtn02,
    };

FeedbackResp _$FeedbackRespFromJson(Map<String, dynamic> json) => FeedbackResp(
  code: json['code'] as String?,
  msg: json['msg'] as String?,
  antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
  rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
  tympanumOMsgTitle: json['tympanum'] as String?,
  directOMsgBtn01: json['direct'] as String?,
  i9145gOMsgBtn02: json['i9145g'] as String?,
);

Map<String, dynamic> _$FeedbackRespToJson(FeedbackResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'antiicer': instance.antiicerOMsgType,
      'rumford': instance.rumfordOMsgDisplay,
      'tympanum': instance.tympanumOMsgTitle,
      'direct': instance.directOMsgBtn01,
      'i9145g': instance.i9145gOMsgBtn02,
    };

NeedAbandonReasonResp _$NeedAbandonReasonRespFromJson(
  Map<String, dynamic> json,
) => NeedAbandonReasonResp(
  s6bfq9OUserClass: (json['s6bfq9'] as num?)?.toInt(),
  h1rhepOIsOnLoan: json['h1rhep'] as bool?,
  q0ui28OIsNeedReport: json['q0ui28'] as bool?,
  du00hsOAbandonReasons: (json['du00hs'] as List<dynamic>?)
      ?.map(
        (e) => NeedAbandonReasonResp$Du00hsOAbandonReasons$Item.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
);

Map<String, dynamic> _$NeedAbandonReasonRespToJson(
  NeedAbandonReasonResp instance,
) => <String, dynamic>{
  's6bfq9': instance.s6bfq9OUserClass,
  'h1rhep': instance.h1rhepOIsOnLoan,
  'q0ui28': instance.q0ui28OIsNeedReport,
  'du00hs': instance.du00hsOAbandonReasons?.map((e) => e.toJson()).toList(),
};

LoanNoticeResp _$LoanNoticeRespFromJson(Map<String, dynamic> json) =>
    LoanNoticeResp(
      code: json['code'] as String?,
      msg: json['msg'] as String?,
      antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
      rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
      tympanumOMsgTitle: json['tympanum'] as String?,
      directOMsgBtn01: json['direct'] as String?,
      i9145gOMsgBtn02: json['i9145g'] as String?,
      data: json['data'] == null
          ? null
          : LoanNoticeResp$Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoanNoticeRespToJson(LoanNoticeResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'antiicer': instance.antiicerOMsgType,
      'rumford': instance.rumfordOMsgDisplay,
      'tympanum': instance.tympanumOMsgTitle,
      'direct': instance.directOMsgBtn01,
      'i9145g': instance.i9145gOMsgBtn02,
      'data': instance.data?.toJson(),
    };

SubmitResultResp _$SubmitResultRespFromJson(Map<String, dynamic> json) =>
    SubmitResultResp(
      raiaOUserGid: json['raia'] as String?,
      bopomofoOCreditStatus: (json['bopomofo'] as num?)?.toInt(),
      rnpu7fOCreditLine: (json['rnpu7f'] as num?)?.toDouble(),
      nookieOCanBorrowAmount: (json['nookie'] as num?)?.toDouble(),
      foreyardOProductId: (json['foreyard'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SubmitResultRespToJson(SubmitResultResp instance) =>
    <String, dynamic>{
      'raia': instance.raiaOUserGid,
      'bopomofo': instance.bopomofoOCreditStatus,
      'rnpu7f': instance.rnpu7fOCreditLine,
      'nookie': instance.nookieOCanBorrowAmount,
      'foreyard': instance.foreyardOProductId,
    };

LivingDataResp _$LivingDataRespFromJson(Map<String, dynamic> json) =>
    LivingDataResp(
      code: json['code'] as String?,
      msg: json['msg'] as String?,
      antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
      rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
      tympanumOMsgTitle: json['tympanum'] as String?,
      directOMsgBtn01: json['direct'] as String?,
      i9145gOMsgBtn02: json['i9145g'] as String?,
    );

Map<String, dynamic> _$LivingDataRespToJson(LivingDataResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'antiicer': instance.antiicerOMsgType,
      'rumford': instance.rumfordOMsgDisplay,
      'tympanum': instance.tympanumOMsgTitle,
      'direct': instance.directOMsgBtn01,
      'i9145g': instance.i9145gOMsgBtn02,
    };

PhotoSubmitResp _$PhotoSubmitRespFromJson(Map<String, dynamic> json) =>
    PhotoSubmitResp(
      code: json['code'] as String?,
      msg: json['msg'] as String?,
      antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
      rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
      tympanumOMsgTitle: json['tympanum'] as String?,
      directOMsgBtn01: json['direct'] as String?,
      i9145gOMsgBtn02: json['i9145g'] as String?,
    );

Map<String, dynamic> _$PhotoSubmitRespToJson(PhotoSubmitResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'antiicer': instance.antiicerOMsgType,
      'rumford': instance.rumfordOMsgDisplay,
      'tympanum': instance.tympanumOMsgTitle,
      'direct': instance.directOMsgBtn01,
      'i9145g': instance.i9145gOMsgBtn02,
    };

SubmitDataResp _$SubmitDataRespFromJson(Map<String, dynamic> json) =>
    SubmitDataResp(
      code: json['code'] as String?,
      msg: json['msg'] as String?,
      antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
      rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
      tympanumOMsgTitle: json['tympanum'] as String?,
      directOMsgBtn01: json['direct'] as String?,
      i9145gOMsgBtn02: json['i9145g'] as String?,
      data: (json['data'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SubmitDataRespToJson(SubmitDataResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'antiicer': instance.antiicerOMsgType,
      'rumford': instance.rumfordOMsgDisplay,
      'tympanum': instance.tympanumOMsgTitle,
      'direct': instance.directOMsgBtn01,
      'i9145g': instance.i9145gOMsgBtn02,
      'data': instance.data,
    };

SubmitCheckResp _$SubmitCheckRespFromJson(Map<String, dynamic> json) =>
    SubmitCheckResp(
      code: json['code'] as String?,
      msg: json['msg'] as String?,
      antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
      rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
      tympanumOMsgTitle: json['tympanum'] as String?,
      directOMsgBtn01: json['direct'] as String?,
      i9145gOMsgBtn02: json['i9145g'] as String?,
    );

Map<String, dynamic> _$SubmitCheckRespToJson(SubmitCheckResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'antiicer': instance.antiicerOMsgType,
      'rumford': instance.rumfordOMsgDisplay,
      'tympanum': instance.tympanumOMsgTitle,
      'direct': instance.directOMsgBtn01,
      'i9145g': instance.i9145gOMsgBtn02,
    };

HomeCouponResp _$HomeCouponRespFromJson(Map<String, dynamic> json) =>
    HomeCouponResp(
      fireballOUserCouponList: (json['fireball'] as List<dynamic>?)
          ?.map(
            (e) => HomeCouponResp$FireballOUserCouponList$Item.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      gmn2dbOCouponNum: (json['gmn2db'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HomeCouponRespToJson(
  HomeCouponResp instance,
) => <String, dynamic>{
  'fireball': instance.fireballOUserCouponList?.map((e) => e.toJson()).toList(),
  'gmn2db': instance.gmn2dbOCouponNum,
};

LoanCouponResp _$LoanCouponRespFromJson(Map<String, dynamic> json) =>
    LoanCouponResp(
      t933d6OUserCouponAvailableList: (json['t933d6'] as List<dynamic>?)
          ?.map(
            (e) => LoanCouponResp$T933d6OUserCouponAvailableList$Item.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      stannateOUserCouponUnavailableList: (json['stannate'] as List<dynamic>?)
          ?.map(
            (e) =>
                LoanCouponResp$StannateOUserCouponUnavailableList$Item.fromJson(
                  e as Map<String, dynamic>,
                ),
          )
          .toList(),
    );

Map<String, dynamic> _$LoanCouponRespToJson(LoanCouponResp instance) =>
    <String, dynamic>{
      't933d6': instance.t933d6OUserCouponAvailableList
          ?.map((e) => e.toJson())
          .toList(),
      'stannate': instance.stannateOUserCouponUnavailableList
          ?.map((e) => e.toJson())
          .toList(),
    };

MyCouponResp _$MyCouponRespFromJson(Map<String, dynamic> json) => MyCouponResp(
  fireballOUserCouponList: (json['fireball'] as List<dynamic>?)
      ?.map(
        (e) => MyCouponResp$FireballOUserCouponList$Item.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  gmn2dbOCouponNum: (json['gmn2db'] as num?)?.toInt(),
);

Map<String, dynamic> _$MyCouponRespToJson(
  MyCouponResp instance,
) => <String, dynamic>{
  'fireball': instance.fireballOUserCouponList?.map((e) => e.toJson()).toList(),
  'gmn2db': instance.gmn2dbOCouponNum,
};

CouponGetResp _$CouponGetRespFromJson(Map<String, dynamic> json) =>
    CouponGetResp(
      code: json['code'] as String?,
      msg: json['msg'] as String?,
      antiicerOMsgType: (json['antiicer'] as num?)?.toInt(),
      rumfordOMsgDisplay: (json['rumford'] as num?)?.toInt(),
      tympanumOMsgTitle: json['tympanum'] as String?,
      directOMsgBtn01: json['direct'] as String?,
      i9145gOMsgBtn02: json['i9145g'] as String?,
    );

Map<String, dynamic> _$CouponGetRespToJson(CouponGetResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'antiicer': instance.antiicerOMsgType,
      'rumford': instance.rumfordOMsgDisplay,
      'tympanum': instance.tympanumOMsgTitle,
      'direct': instance.directOMsgBtn01,
      'i9145g': instance.i9145gOMsgBtn02,
    };

LandCouponResp _$LandCouponRespFromJson(Map<String, dynamic> json) =>
    LandCouponResp(
      fireballOUserCouponList: (json['fireball'] as List<dynamic>?)
          ?.map(
            (e) => LandCouponResp$FireballOUserCouponList$Item.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      gmn2dbOCouponNum: (json['gmn2db'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LandCouponRespToJson(
  LandCouponResp instance,
) => <String, dynamic>{
  'fireball': instance.fireballOUserCouponList?.map((e) => e.toJson()).toList(),
  'gmn2db': instance.gmn2dbOCouponNum,
};

CouponPopResp _$CouponPopRespFromJson(Map<String, dynamic> json) =>
    CouponPopResp(
      oxmqq4OHomePopFlag: json['oxmqq4'] == null
          ? null
          : CouponPopResp$Oxmqq4OHomePopFlag.fromJson(
              json['oxmqq4'] as Map<String, dynamic>,
            ),
      gmn2dbOCouponNum: (json['gmn2db'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CouponPopRespToJson(CouponPopResp instance) =>
    <String, dynamic>{
      'oxmqq4': instance.oxmqq4OHomePopFlag?.toJson(),
      'gmn2db': instance.gmn2dbOCouponNum,
    };

LoanBillResp _$LoanBillRespFromJson(Map<String, dynamic> json) => LoanBillResp(
  y934teOTotalAmount: (json['y934te'] as num?)?.toDouble(),
  total: (json['total'] as num?)?.toInt(),
  pages: (json['pages'] as num?)?.toInt(),
  ouxtd3OLoanList: (json['ouxtd3'] as List<dynamic>?)
      ?.map(
        (e) => LoanBillResp$Ouxtd3OLoanList$Item.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
);

Map<String, dynamic> _$LoanBillRespToJson(LoanBillResp instance) =>
    <String, dynamic>{
      'y934te': instance.y934teOTotalAmount,
      'total': instance.total,
      'pages': instance.pages,
      'ouxtd3': instance.ouxtd3OLoanList?.map((e) => e.toJson()).toList(),
    };

BillStatusResp _$BillStatusRespFromJson(Map<String, dynamic> json) =>
    BillStatusResp(d95091ORepaymentStatus: (json['d95091'] as num?)?.toInt());

Map<String, dynamic> _$BillStatusRespToJson(BillStatusResp instance) =>
    <String, dynamic>{'d95091': instance.d95091ORepaymentStatus};

BillListResp _$BillListRespFromJson(Map<String, dynamic> json) => BillListResp(
  y934teOTotalAmount: (json['y934te'] as num?)?.toDouble(),
  soberOBillList: (json['sober'] as List<dynamic>?)
      ?.map(
        (e) => BillListResp$SoberOBillList$Item.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
);

Map<String, dynamic> _$BillListRespToJson(BillListResp instance) =>
    <String, dynamic>{
      'y934te': instance.y934teOTotalAmount,
      'sober': instance.soberOBillList?.map((e) => e.toJson()).toList(),
    };

BillDetailResp _$BillDetailRespFromJson(Map<String, dynamic> json) =>
    BillDetailResp(
      n410zdOLoanTime: (json['n410zd'] as num?)?.toInt(),
      r5k31qODueTime: (json['r5k31q'] as num?)?.toInt(),
      coandaODueDays: (json['coanda'] as num?)?.toInt(),
      faciendOOverdueFee: (json['faciend'] as num?)?.toDouble(),
      retiaryOLoanAmount: (json['retiary'] as num?)?.toDouble(),
      pluralOReceiveAmount: (json['plural'] as num?)?.toDouble(),
      e88wy1OLoanFee: (json['e88wy1'] as num?)?.toDouble(),
      gatemanORepaymentAmount: (json['gateman'] as num?)?.toDouble(),
      wantonlyOLoanLeftAmount: (json['wantonly'] as num?)?.toDouble(),
      h4f7x4OCoupon: (json['h4f7x4'] as num?)?.toDouble(),
      d95091ORepaymentStatus: (json['d95091'] as num?)?.toInt(),
      suffOLoanStatus: (json['suff'] as num?)?.toInt(),
      slackOIsOverdue: json['slack'] as bool?,
      feminieOCardAccount: json['feminie'] as String?,
      ux8tv0OTotalLeftAmount: (json['ux8tv0'] as num?)?.toDouble(),
      wt3258OOverdueRate: (json['wt3258'] as num?)?.toDouble(),
      asiaticOOverduePfMgrRate: (json['asiatic'] as num?)?.toDouble(),
      foreyardOProductId: (json['foreyard'] as num?)?.toInt(),
      unciformOOriginationFee: (json['unciform'] as num?)?.toDouble(),
      centiareOServiceFee: (json['centiare'] as num?)?.toDouble(),
      v08uw3ORepaymentChannelList: (json['v08uw3'] as List<dynamic>?)
          ?.map(
            (e) => BillDetailResp$V08uw3ORepaymentChannelList$Item.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      pinionOUserCouponGid: json['pinion'] as String?,
      sk6s63OCouponAmount: (json['sk6s63'] as num?)?.toDouble(),
      mt66nzOReceiveSubAmount: (json['mt66nz'] as num?)?.toDouble(),
      q922g5OReceiveAddAmount: (json['q922g5'] as num?)?.toDouble(),
      vx4165OFailReason: json['vx4165'] as String?,
      mxs06uOApplyStatus: json['mxs06u'] as String?,
      ez64t7OPeriodCount: (json['ez64t7'] as num?)?.toInt(),
      glacisORepaymentPlanList: (json['glacis'] as List<dynamic>?)
          ?.map(
            (e) => BillDetailResp$GlacisORepaymentPlanList$Item.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      cherubimOOrderStatus: (json['cherubim'] as num?)?.toInt(),
      encloseOOrderTime: (json['enclose'] as num?)?.toInt(),
      wa5f08OOrderDueDays: (json['wa5f08'] as num?)?.toInt(),
      iy8ujyOIsShowTime: json['iy8ujy'] as bool?,
      kinkyOOrderAmount: (json['kinky'] as num?)?.toDouble(),
      t72jj1OCreditSearchFee: (json['t72jj1'] as num?)?.toDouble(),
      cdslOTransferFee: (json['cdsl'] as num?)?.toDouble(),
      badnessOIgvFee: (json['badness'] as num?)?.toDouble(),
      spriteOBusinessFee: (json['sprite'] as num?)?.toDouble(),
      bac6b3OUserInfoDetail: json['bac6b3'] == null
          ? null
          : BillDetailResp$Bac6b3OUserInfoDetail.fromJson(
              json['bac6b3'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$BillDetailRespToJson(
  BillDetailResp instance,
) => <String, dynamic>{
  'n410zd': instance.n410zdOLoanTime,
  'r5k31q': instance.r5k31qODueTime,
  'coanda': instance.coandaODueDays,
  'faciend': instance.faciendOOverdueFee,
  'retiary': instance.retiaryOLoanAmount,
  'plural': instance.pluralOReceiveAmount,
  'e88wy1': instance.e88wy1OLoanFee,
  'gateman': instance.gatemanORepaymentAmount,
  'wantonly': instance.wantonlyOLoanLeftAmount,
  'h4f7x4': instance.h4f7x4OCoupon,
  'd95091': instance.d95091ORepaymentStatus,
  'suff': instance.suffOLoanStatus,
  'slack': instance.slackOIsOverdue,
  'feminie': instance.feminieOCardAccount,
  'ux8tv0': instance.ux8tv0OTotalLeftAmount,
  'wt3258': instance.wt3258OOverdueRate,
  'asiatic': instance.asiaticOOverduePfMgrRate,
  'foreyard': instance.foreyardOProductId,
  'unciform': instance.unciformOOriginationFee,
  'centiare': instance.centiareOServiceFee,
  'v08uw3': instance.v08uw3ORepaymentChannelList
      ?.map((e) => e.toJson())
      .toList(),
  'pinion': instance.pinionOUserCouponGid,
  'sk6s63': instance.sk6s63OCouponAmount,
  'mt66nz': instance.mt66nzOReceiveSubAmount,
  'q922g5': instance.q922g5OReceiveAddAmount,
  'vx4165': instance.vx4165OFailReason,
  'mxs06u': instance.mxs06uOApplyStatus,
  'ez64t7': instance.ez64t7OPeriodCount,
  'glacis': instance.glacisORepaymentPlanList?.map((e) => e.toJson()).toList(),
  'cherubim': instance.cherubimOOrderStatus,
  'enclose': instance.encloseOOrderTime,
  'wa5f08': instance.wa5f08OOrderDueDays,
  'iy8ujy': instance.iy8ujyOIsShowTime,
  'kinky': instance.kinkyOOrderAmount,
  't72jj1': instance.t72jj1OCreditSearchFee,
  'cdsl': instance.cdslOTransferFee,
  'badness': instance.badnessOIgvFee,
  'sprite': instance.spriteOBusinessFee,
  'bac6b3': instance.bac6b3OUserInfoDetail?.toJson(),
};

BillRepayResp _$BillRepayRespFromJson(Map<String, dynamic> json) =>
    BillRepayResp(
      total: (json['total'] as num?)?.toInt(),
      pages: (json['pages'] as num?)?.toInt(),
      endmostOTotalLoanLeftAmount: (json['endmost'] as num?)?.toDouble(),
      my4dd2ORepaymentList: (json['my4dd2'] as List<dynamic>?)
          ?.map(
            (e) => BillRepayResp$My4dd2ORepaymentList$Item.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );

Map<String, dynamic> _$BillRepayRespToJson(BillRepayResp instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pages': instance.pages,
      'endmost': instance.endmostOTotalLoanLeftAmount,
      'my4dd2': instance.my4dd2ORepaymentList?.map((e) => e.toJson()).toList(),
    };

TrackReportReq$FibulaOReportBaseInfo
_$TrackReportReq$FibulaOReportBaseInfoFromJson(Map<String, dynamic> json) =>
    TrackReportReq$FibulaOReportBaseInfo(
      h0390bOWifiName: json['h0390b'] as String?,
      alackOIpAddress: json['alack'] as String?,
      qianaOMacAddress: json['qiana'] as String?,
      trj8s6OImei: json['trj8s6'] as String?,
      novellyOBssid: json['novelly'] as String?,
      p4fv8oOMemory: json['p4fv8o'] as String?,
      yr0nx3OPower: (json['yr0nx3'] as num?)?.toInt(),
      illthOBrand: json['illth'] as String?,
      lawfullyOSysVersion: json['lawfully'] as String?,
      r307x2ONetType: json['r307x2'] as String?,
      acetylcoOGeolocation: json['acetylco'] == null
          ? null
          : TrackReportReq$FibulaOReportBaseInfo$AcetylcoOGeolocation.fromJson(
              json['acetylco'] as Map<String, dynamic>,
            ),
      sodalistODeviceInfo: json['sodalist'] as String?,
      model: json['model'] as String?,
      root: (json['root'] as num?)?.toInt(),
      wb8jk2OEmulator: (json['wb8jk2'] as num?)?.toInt(),
      anilOMid: json['anil'] as String?,
      fnwdw7OPhotoNum: (json['fnwdw7'] as num?)?.toInt(),
      eztov7OVideoNum: (json['eztov7'] as num?)?.toInt(),
      dai86eOMusicNum: (json['dai86e'] as num?)?.toInt(),
      gze221OBootTime: (json['gze221'] as num?)?.toInt(),
      hmdso0OMemUsed: (json['hmdso0'] as num?)?.toInt(),
      so31o2OImeis: json['so31o2'],
      inb: (json['inb'] as num?)?.toInt(),
      z5pioqOOutb: (json['z5pioq'] as num?)?.toInt(),
      hass: (json['hass'] as num?)?.toInt(),
      n7e5diOMidOriginal: json['n7e5di'] as String?,
      buid: json['buid'],
      ja3Hash: json['ja3Hash'] as String?,
    );

Map<String, dynamic> _$TrackReportReq$FibulaOReportBaseInfoToJson(
  TrackReportReq$FibulaOReportBaseInfo instance,
) => <String, dynamic>{
  'h0390b': instance.h0390bOWifiName,
  'alack': instance.alackOIpAddress,
  'qiana': instance.qianaOMacAddress,
  'trj8s6': instance.trj8s6OImei,
  'novelly': instance.novellyOBssid,
  'p4fv8o': instance.p4fv8oOMemory,
  'yr0nx3': instance.yr0nx3OPower,
  'illth': instance.illthOBrand,
  'lawfully': instance.lawfullyOSysVersion,
  'r307x2': instance.r307x2ONetType,
  'acetylco': instance.acetylcoOGeolocation?.toJson(),
  'sodalist': instance.sodalistODeviceInfo,
  'model': instance.model,
  'root': instance.root,
  'wb8jk2': instance.wb8jk2OEmulator,
  'anil': instance.anilOMid,
  'fnwdw7': instance.fnwdw7OPhotoNum,
  'eztov7': instance.eztov7OVideoNum,
  'dai86e': instance.dai86eOMusicNum,
  'gze221': instance.gze221OBootTime,
  'hmdso0': instance.hmdso0OMemUsed,
  'so31o2': instance.so31o2OImeis,
  'inb': instance.inb,
  'z5pioq': instance.z5pioqOOutb,
  'hass': instance.hass,
  'n7e5di': instance.n7e5diOMidOriginal,
  'buid': instance.buid,
  'ja3Hash': instance.ja3Hash,
};

TrackReportReq$AdcraftOAddressBook$Item
_$TrackReportReq$AdcraftOAddressBook$ItemFromJson(Map<String, dynamic> json) =>
    TrackReportReq$AdcraftOAddressBook$Item(
      name: json['name'] as String?,
      phone:
          (json['phone'] as List<dynamic>?)?.map((e) => e as Object).toList() ??
          [],
      type: json['type'] as String?,
      time: json['time'] as String?,
      n: json['n'] as String?,
      p: (json['p'] as List<dynamic>?)?.map((e) => e as Object).toList() ?? [],
      t: json['t'] as String?,
      m: (json['m'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TrackReportReq$AdcraftOAddressBook$ItemToJson(
  TrackReportReq$AdcraftOAddressBook$Item instance,
) => <String, dynamic>{
  'name': instance.name,
  'phone': instance.phone,
  'type': instance.type,
  'time': instance.time,
  'n': instance.n,
  'p': instance.p,
  't': instance.t,
  'm': instance.m,
};

TrackReportReq$Jx3w61OAppList$Item _$TrackReportReq$Jx3w61OAppList$ItemFromJson(
  Map<String, dynamic> json,
) => TrackReportReq$Jx3w61OAppList$Item(
  name: json['name'] as String?,
  n1s2v2OPackageName: json['n1s2v2'] as String?,
  a8h656OVersionCode: (json['a8h656'] as num?)?.toInt(),
  b: json['b'] as String?,
  a: json['a'] as String?,
  c: (json['c'] as num?)?.toInt(),
  itu: (json['itu'] as num?)?.toInt(),
  y3xrccOAddTime: (json['y3xrcc'] as num?)?.toInt(),
  dtu: (json['dtu'] as num?)?.toInt(),
  f1fc0dOUTime: (json['f1fc0d'] as num?)?.toInt(),
);

Map<String, dynamic> _$TrackReportReq$Jx3w61OAppList$ItemToJson(
  TrackReportReq$Jx3w61OAppList$Item instance,
) => <String, dynamic>{
  'name': instance.name,
  'n1s2v2': instance.n1s2v2OPackageName,
  'a8h656': instance.a8h656OVersionCode,
  'b': instance.b,
  'a': instance.a,
  'c': instance.c,
  'itu': instance.itu,
  'y3xrcc': instance.y3xrccOAddTime,
  'dtu': instance.dtu,
  'f1fc0d': instance.f1fc0dOUTime,
};

TrackReportReq$BanallyOReportDevDTO
_$TrackReportReq$BanallyOReportDevDTOFromJson(
  Map<String, dynamic> json,
) => TrackReportReq$BanallyOReportDevDTO(
  hafizORootPlus: json['hafiz'],
  hdcopyOBattery: json['hdcopy'] == null
      ? null
      : TrackReportReq$BanallyOReportDevDTO$HdcopyOBattery.fromJson(
          json['hdcopy'] as Map<String, dynamic>,
        ),
  i39296OBluetooth: json['i39296'] == null
      ? null
      : TrackReportReq$BanallyOReportDevDTO$I39296OBluetooth.fromJson(
          json['i39296'] as Map<String, dynamic>,
        ),
  costingOCameras: (json['costing'] as List<dynamic>?)
      ?.map(
        (e) =>
            TrackReportReq$BanallyOReportDevDTO$CostingOCameras$Item.fromJson(
              e as Map<String, dynamic>,
            ),
      )
      .toList(),
  cpu: json['cpu'] == null
      ? null
      : TrackReportReq$BanallyOReportDevDTO$Cpu.fromJson(
          json['cpu'] as Map<String, dynamic>,
        ),
  slqri6OGeneral: json['slqri6'] == null
      ? null
      : TrackReportReq$BanallyOReportDevDTO$Slqri6OGeneral.fromJson(
          json['slqri6'] as Map<String, dynamic>,
        ),
  r6i83kONetSignal: json['r6i83k'] == null
      ? null
      : TrackReportReq$BanallyOReportDevDTO$R6i83kONetSignal.fromJson(
          json['r6i83k'] as Map<String, dynamic>,
        ),
  autumnalOSensors: (json['autumnal'] as List<dynamic>?)
      ?.map(
        (e) =>
            TrackReportReq$BanallyOReportDevDTO$AutumnalOSensors$Item.fromJson(
              e as Map<String, dynamic>,
            ),
      )
      .toList(),
  system: json['system'] == null
      ? null
      : TrackReportReq$BanallyOReportDevDTO$System.fromJson(
          json['system'] as Map<String, dynamic>,
        ),
  e3d40eOStructure: json['e3d40e'] == null
      ? null
      : TrackReportReq$BanallyOReportDevDTO$E3d40eOStructure.fromJson(
          json['e3d40e'] as Map<String, dynamic>,
        ),
  h4878cOLanguage: json['h4878c'] as String?,
  jp689uOTimeZone: json['jp689u'] as String?,
);

Map<String, dynamic> _$TrackReportReq$BanallyOReportDevDTOToJson(
  TrackReportReq$BanallyOReportDevDTO instance,
) => <String, dynamic>{
  'hafiz': instance.hafizORootPlus,
  'hdcopy': instance.hdcopyOBattery?.toJson(),
  'i39296': instance.i39296OBluetooth?.toJson(),
  'costing': instance.costingOCameras?.map((e) => e.toJson()).toList(),
  'cpu': instance.cpu?.toJson(),
  'slqri6': instance.slqri6OGeneral?.toJson(),
  'r6i83k': instance.r6i83kONetSignal?.toJson(),
  'autumnal': instance.autumnalOSensors?.map((e) => e.toJson()).toList(),
  'system': instance.system?.toJson(),
  'e3d40e': instance.e3d40eOStructure?.toJson(),
  'h4878c': instance.h4878cOLanguage,
  'jp689u': instance.jp689uOTimeZone,
};

TrackReportReq$SilaneOReportGyroDTO$Item
_$TrackReportReq$SilaneOReportGyroDTO$ItemFromJson(Map<String, dynamic> json) =>
    TrackReportReq$SilaneOReportGyroDTO$Item(
      x: json['x'] as String?,
      y: json['y'] as String?,
      z: json['z'] as String?,
    );

Map<String, dynamic> _$TrackReportReq$SilaneOReportGyroDTO$ItemToJson(
  TrackReportReq$SilaneOReportGyroDTO$Item instance,
) => <String, dynamic>{'x': instance.x, 'y': instance.y, 'z': instance.z};

TrackReportReq$FrcoOSmsItems$Item _$TrackReportReq$FrcoOSmsItems$ItemFromJson(
  Map<String, dynamic> json,
) => TrackReportReq$FrcoOSmsItems$Item(
  yi3y78OItemId: (json['yi3y78'] as num?)?.toInt(),
  type: (json['type'] as num?)?.toInt(),
  address: json['address'] as String?,
  u7m1kfOBody: json['u7m1kf'] as String?,
  roumc2ODate: (json['roumc2'] as num?)?.toInt(),
);

Map<String, dynamic> _$TrackReportReq$FrcoOSmsItems$ItemToJson(
  TrackReportReq$FrcoOSmsItems$Item instance,
) => <String, dynamic>{
  'yi3y78': instance.yi3y78OItemId,
  'type': instance.type,
  'address': instance.address,
  'u7m1kf': instance.u7m1kfOBody,
  'roumc2': instance.roumc2ODate,
};

NeedReportReq$ReopposeOMapValue _$NeedReportReq$ReopposeOMapValueFromJson(
  Map<String, dynamic> json,
) => NeedReportReq$ReopposeOMapValue(hash: (json['hash'] as num?)?.toInt());

Map<String, dynamic> _$NeedReportReq$ReopposeOMapValueToJson(
  NeedReportReq$ReopposeOMapValue instance,
) => <String, dynamic>{'hash': instance.hash};

LivingDataReq$OutsungOLivingDataList$Item
_$LivingDataReq$OutsungOLivingDataList$ItemFromJson(
  Map<String, dynamic> json,
) => LivingDataReq$OutsungOLivingDataList$Item(
  sanctionOResultStage: (json['sanction'] as num?)?.toInt(),
  woodbindOResultType: (json['woodbind'] as num?)?.toInt(),
  impiOTriggerTime: (json['impi'] as num?)?.toInt(),
);

Map<String, dynamic> _$LivingDataReq$OutsungOLivingDataList$ItemToJson(
  LivingDataReq$OutsungOLivingDataList$Item instance,
) => <String, dynamic>{
  'sanction': instance.sanctionOResultStage,
  'woodbind': instance.woodbindOResultType,
  'impi': instance.impiOTriggerTime,
};

RiskReportResp$ZdzsepOVerificationConfig
_$RiskReportResp$ZdzsepOVerificationConfigFromJson(
  Map<String, dynamic> json,
) => RiskReportResp$ZdzsepOVerificationConfig(
  u7yl7cOItemsDisplayConfig: json['u7yl7c'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig.fromJson(
          json['u7yl7c'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$RiskReportResp$ZdzsepOVerificationConfigToJson(
  RiskReportResp$ZdzsepOVerificationConfig instance,
) => <String, dynamic>{'u7yl7c': instance.u7yl7cOItemsDisplayConfig?.toJson()};

RepayApplyResp$TartarlyOPins$Item _$RepayApplyResp$TartarlyOPins$ItemFromJson(
  Map<String, dynamic> json,
) => RepayApplyResp$TartarlyOPins$Item(
  nakhodkaOPin: json['nakhodka'] as String?,
  ruralOAgentes: (json['rural'] as List<dynamic>?)
      ?.map(
        (e) => RepayApplyResp$TartarlyOPins$Item$RuralOAgentes$Item.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
);

Map<String, dynamic> _$RepayApplyResp$TartarlyOPins$ItemToJson(
  RepayApplyResp$TartarlyOPins$Item instance,
) => <String, dynamic>{
  'nakhodka': instance.nakhodkaOPin,
  'rural': instance.ruralOAgentes?.map((e) => e.toJson()).toList(),
};

VersionCheckResp$Data _$VersionCheckResp$DataFromJson(
  Map<String, dynamic> json,
) => VersionCheckResp$Data(
  populousOHasUpdate: json['populous'] as bool?,
  c1o9nqONewVersion: json['c1o9nq'] == null
      ? null
      : VersionCheckResp$Data$C1o9nqONewVersion.fromJson(
          json['c1o9nq'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$VersionCheckResp$DataToJson(
  VersionCheckResp$Data instance,
) => <String, dynamic>{
  'populous': instance.populousOHasUpdate,
  'c1o9nq': instance.c1o9nqONewVersion?.toJson(),
};

ColoanGpResp$S2c1wyOAppCoLoanGpDetailPOList$Item
_$ColoanGpResp$S2c1wyOAppCoLoanGpDetailPOList$ItemFromJson(
  Map<String, dynamic> json,
) => ColoanGpResp$S2c1wyOAppCoLoanGpDetailPOList$Item(
  audacityOAppTags: json['audacity'] as String?,
  es8l4kOCoLoanAppName: json['es8l4k'] as String?,
  fatherlyOShowAppName: json['fatherly'] as String?,
  n1s2v2OPackageName: json['n1s2v2'] as String?,
  a2787eOLogo: json['a2787e'] as String?,
  ui1pz2OLink: json['ui1pz2'] as String?,
  o053asOAppDesc: json['o053as'] as String?,
  thousandOIsEffect: json['thousand'] as bool?,
  lubricOGpStatus: json['lubric'] as bool?,
);

Map<String, dynamic> _$ColoanGpResp$S2c1wyOAppCoLoanGpDetailPOList$ItemToJson(
  ColoanGpResp$S2c1wyOAppCoLoanGpDetailPOList$Item instance,
) => <String, dynamic>{
  'audacity': instance.audacityOAppTags,
  'es8l4k': instance.es8l4kOCoLoanAppName,
  'fatherly': instance.fatherlyOShowAppName,
  'n1s2v2': instance.n1s2v2OPackageName,
  'a2787e': instance.a2787eOLogo,
  'ui1pz2': instance.ui1pz2OLink,
  'o053as': instance.o053asOAppDesc,
  'thousand': instance.thousandOIsEffect,
  'lubric': instance.lubricOGpStatus,
};

HomeInfoResp$PapuanOLastRecordLoan _$HomeInfoResp$PapuanOLastRecordLoanFromJson(
  Map<String, dynamic> json,
) => HomeInfoResp$PapuanOLastRecordLoan(
  r5a4x8OLoanGid: json['r5a4x8'] as String?,
  n410zdOLoanTime: (json['n410zd'] as num?)?.toInt(),
  r5k31qODueTime: (json['r5k31q'] as num?)?.toInt(),
  wantonlyOLoanLeftAmount: (json['wantonly'] as num?)?.toDouble(),
  retiaryOLoanAmount: (json['retiary'] as num?)?.toDouble(),
  d95091ORepaymentStatus: (json['d95091'] as num?)?.toInt(),
  suffOLoanStatus: (json['suff'] as num?)?.toInt(),
  feminieOCardAccount: json['feminie'] as String?,
  ah1e18OBillStatus: (json['ah1e18'] as num?)?.toInt(),
  coandaODueDays: (json['coanda'] as num?)?.toInt(),
  vx4165OFailReason: json['vx4165'] as String?,
  pinionOUserCouponGid: json['pinion'] as String?,
  sk6s63OCouponAmount: (json['sk6s63'] as num?)?.toDouble(),
  mxs06uOApplyStatus: json['mxs06u'] as String?,
  ez64t7OPeriodCount: (json['ez64t7'] as num?)?.toInt(),
  cherubimOOrderStatus: (json['cherubim'] as num?)?.toInt(),
  encloseOOrderTime: (json['enclose'] as num?)?.toInt(),
  wa5f08OOrderDueDays: (json['wa5f08'] as num?)?.toInt(),
  iy8ujyOIsShowTime: json['iy8ujy'] as bool?,
  kinkyOOrderAmount: (json['kinky'] as num?)?.toDouble(),
  outdoOPlanSimpleList: (json['outdo'] as List<dynamic>?)
      ?.map(
        (e) =>
            HomeInfoResp$PapuanOLastRecordLoan$OutdoOPlanSimpleList$Item.fromJson(
              e as Map<String, dynamic>,
            ),
      )
      .toList(),
  slackOIsOverdue: json['slack'] as bool?,
  remark: json['remark'] as String?,
  kc1347OEnableRenew: json['kc1347'] as bool?,
);

Map<String, dynamic> _$HomeInfoResp$PapuanOLastRecordLoanToJson(
  HomeInfoResp$PapuanOLastRecordLoan instance,
) => <String, dynamic>{
  'r5a4x8': instance.r5a4x8OLoanGid,
  'n410zd': instance.n410zdOLoanTime,
  'r5k31q': instance.r5k31qODueTime,
  'wantonly': instance.wantonlyOLoanLeftAmount,
  'retiary': instance.retiaryOLoanAmount,
  'd95091': instance.d95091ORepaymentStatus,
  'suff': instance.suffOLoanStatus,
  'feminie': instance.feminieOCardAccount,
  'ah1e18': instance.ah1e18OBillStatus,
  'coanda': instance.coandaODueDays,
  'vx4165': instance.vx4165OFailReason,
  'pinion': instance.pinionOUserCouponGid,
  'sk6s63': instance.sk6s63OCouponAmount,
  'mxs06u': instance.mxs06uOApplyStatus,
  'ez64t7': instance.ez64t7OPeriodCount,
  'cherubim': instance.cherubimOOrderStatus,
  'enclose': instance.encloseOOrderTime,
  'wa5f08': instance.wa5f08OOrderDueDays,
  'iy8ujy': instance.iy8ujyOIsShowTime,
  'kinky': instance.kinkyOOrderAmount,
  'outdo': instance.outdoOPlanSimpleList?.map((e) => e.toJson()).toList(),
  'slack': instance.slackOIsOverdue,
  'remark': instance.remark,
  'kc1347': instance.kc1347OEnableRenew,
};

HomeInfoResp$Xu551uOSpareLastRecordLoan
_$HomeInfoResp$Xu551uOSpareLastRecordLoanFromJson(
  Map<String, dynamic> json,
) => HomeInfoResp$Xu551uOSpareLastRecordLoan(
  r5a4x8OLoanGid: json['r5a4x8'] as String?,
  n410zdOLoanTime: (json['n410zd'] as num?)?.toInt(),
  r5k31qODueTime: (json['r5k31q'] as num?)?.toInt(),
  wantonlyOLoanLeftAmount: (json['wantonly'] as num?)?.toDouble(),
  retiaryOLoanAmount: (json['retiary'] as num?)?.toDouble(),
  d95091ORepaymentStatus: (json['d95091'] as num?)?.toInt(),
  suffOLoanStatus: (json['suff'] as num?)?.toInt(),
  feminieOCardAccount: json['feminie'] as String?,
  ah1e18OBillStatus: (json['ah1e18'] as num?)?.toInt(),
  coandaODueDays: (json['coanda'] as num?)?.toInt(),
  vx4165OFailReason: json['vx4165'] as String?,
  pinionOUserCouponGid: json['pinion'] as String?,
  sk6s63OCouponAmount: (json['sk6s63'] as num?)?.toDouble(),
  mxs06uOApplyStatus: json['mxs06u'] as String?,
  ez64t7OPeriodCount: (json['ez64t7'] as num?)?.toInt(),
  cherubimOOrderStatus: (json['cherubim'] as num?)?.toInt(),
  encloseOOrderTime: (json['enclose'] as num?)?.toInt(),
  wa5f08OOrderDueDays: (json['wa5f08'] as num?)?.toInt(),
  iy8ujyOIsShowTime: json['iy8ujy'] as bool?,
  kinkyOOrderAmount: (json['kinky'] as num?)?.toDouble(),
  outdoOPlanSimpleList: (json['outdo'] as List<dynamic>?)
      ?.map(
        (e) =>
            HomeInfoResp$Xu551uOSpareLastRecordLoan$OutdoOPlanSimpleList$Item.fromJson(
              e as Map<String, dynamic>,
            ),
      )
      .toList(),
  slackOIsOverdue: json['slack'] as bool?,
  remark: json['remark'] as String?,
  kc1347OEnableRenew: json['kc1347'] as bool?,
);

Map<String, dynamic> _$HomeInfoResp$Xu551uOSpareLastRecordLoanToJson(
  HomeInfoResp$Xu551uOSpareLastRecordLoan instance,
) => <String, dynamic>{
  'r5a4x8': instance.r5a4x8OLoanGid,
  'n410zd': instance.n410zdOLoanTime,
  'r5k31q': instance.r5k31qODueTime,
  'wantonly': instance.wantonlyOLoanLeftAmount,
  'retiary': instance.retiaryOLoanAmount,
  'd95091': instance.d95091ORepaymentStatus,
  'suff': instance.suffOLoanStatus,
  'feminie': instance.feminieOCardAccount,
  'ah1e18': instance.ah1e18OBillStatus,
  'coanda': instance.coandaODueDays,
  'vx4165': instance.vx4165OFailReason,
  'pinion': instance.pinionOUserCouponGid,
  'sk6s63': instance.sk6s63OCouponAmount,
  'mxs06u': instance.mxs06uOApplyStatus,
  'ez64t7': instance.ez64t7OPeriodCount,
  'cherubim': instance.cherubimOOrderStatus,
  'enclose': instance.encloseOOrderTime,
  'wa5f08': instance.wa5f08OOrderDueDays,
  'iy8ujy': instance.iy8ujyOIsShowTime,
  'kinky': instance.kinkyOOrderAmount,
  'outdo': instance.outdoOPlanSimpleList?.map((e) => e.toJson()).toList(),
  'slack': instance.slackOIsOverdue,
  'remark': instance.remark,
  'kc1347': instance.kc1347OEnableRenew,
};

HomeInfoResp$LysogenOSpareProductGroup$Item
_$HomeInfoResp$LysogenOSpareProductGroup$ItemFromJson(
  Map<String, dynamic> json,
) => HomeInfoResp$LysogenOSpareProductGroup$Item(
  b49d07OProductPeriodId: json['b49d07'] as String?,
  faroucheOIsLock: json['farouche'] as bool?,
  list: (json['list'] as List<dynamic>?)
      ?.map(
        (e) => HomeInfoResp$LysogenOSpareProductGroup$Item$List$Item.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
);

Map<String, dynamic> _$HomeInfoResp$LysogenOSpareProductGroup$ItemToJson(
  HomeInfoResp$LysogenOSpareProductGroup$Item instance,
) => <String, dynamic>{
  'b49d07': instance.b49d07OProductPeriodId,
  'farouche': instance.faroucheOIsLock,
  'list': instance.list?.map((e) => e.toJson()).toList(),
};

HomeInfoResp$AssurOFaceList$Item _$HomeInfoResp$AssurOFaceList$ItemFromJson(
  Map<String, dynamic> json,
) => HomeInfoResp$AssurOFaceList$Item(
  foreyardOProductId: (json['foreyard'] as num?)?.toInt(),
  za6d92OProductName: json['za6d92'] as String?,
  b49d07OProductPeriodId: json['b49d07'] as String?,
  peddlerOPeriodCountId: json['peddler'] as String?,
  morticeOFeeTypeId: json['mortice'] as String?,
  faroucheOIsLock: json['farouche'] as bool?,
  mojr11OLoanRangeMin: (json['mojr11'] as num?)?.toDouble(),
  xuwh2oOLoanRangeMax: (json['xuwh2o'] as num?)?.toDouble(),
  marrowOLoanRangeUnit: (json['marrow'] as num?)?.toDouble(),
  newbornOSigPeriod: (json['newborn'] as num?)?.toInt(),
  elbaOSigRate: (json['elba'] as num?)?.toDouble(),
  i41lj0OProductTags: json['i41lj0'] as String?,
);

Map<String, dynamic> _$HomeInfoResp$AssurOFaceList$ItemToJson(
  HomeInfoResp$AssurOFaceList$Item instance,
) => <String, dynamic>{
  'foreyard': instance.foreyardOProductId,
  'za6d92': instance.za6d92OProductName,
  'b49d07': instance.b49d07OProductPeriodId,
  'peddler': instance.peddlerOPeriodCountId,
  'mortice': instance.morticeOFeeTypeId,
  'farouche': instance.faroucheOIsLock,
  'mojr11': instance.mojr11OLoanRangeMin,
  'xuwh2o': instance.xuwh2oOLoanRangeMax,
  'marrow': instance.marrowOLoanRangeUnit,
  'newborn': instance.newbornOSigPeriod,
  'elba': instance.elbaOSigRate,
  'i41lj0': instance.i41lj0OProductTags,
};

HomeInfoResp$ParryOSpareFaceList$Item
_$HomeInfoResp$ParryOSpareFaceList$ItemFromJson(Map<String, dynamic> json) =>
    HomeInfoResp$ParryOSpareFaceList$Item(
      foreyardOProductId: (json['foreyard'] as num?)?.toInt(),
      za6d92OProductName: json['za6d92'] as String?,
      b49d07OProductPeriodId: json['b49d07'] as String?,
      peddlerOPeriodCountId: json['peddler'] as String?,
      morticeOFeeTypeId: json['mortice'] as String?,
      faroucheOIsLock: json['farouche'] as bool?,
      mojr11OLoanRangeMin: (json['mojr11'] as num?)?.toDouble(),
      xuwh2oOLoanRangeMax: (json['xuwh2o'] as num?)?.toDouble(),
      marrowOLoanRangeUnit: (json['marrow'] as num?)?.toDouble(),
      newbornOSigPeriod: (json['newborn'] as num?)?.toInt(),
      elbaOSigRate: (json['elba'] as num?)?.toDouble(),
      i41lj0OProductTags: json['i41lj0'] as String?,
    );

Map<String, dynamic> _$HomeInfoResp$ParryOSpareFaceList$ItemToJson(
  HomeInfoResp$ParryOSpareFaceList$Item instance,
) => <String, dynamic>{
  'foreyard': instance.foreyardOProductId,
  'za6d92': instance.za6d92OProductName,
  'b49d07': instance.b49d07OProductPeriodId,
  'peddler': instance.peddlerOPeriodCountId,
  'mortice': instance.morticeOFeeTypeId,
  'farouche': instance.faroucheOIsLock,
  'mojr11': instance.mojr11OLoanRangeMin,
  'xuwh2o': instance.xuwh2oOLoanRangeMax,
  'marrow': instance.marrowOLoanRangeUnit,
  'newborn': instance.newbornOSigPeriod,
  'elba': instance.elbaOSigRate,
  'i41lj0': instance.i41lj0OProductTags,
};

HomeInfoResp$S2c1wyOAppCoLoanGpDetailPOList$Item
_$HomeInfoResp$S2c1wyOAppCoLoanGpDetailPOList$ItemFromJson(
  Map<String, dynamic> json,
) => HomeInfoResp$S2c1wyOAppCoLoanGpDetailPOList$Item(
  audacityOAppTags: json['audacity'] as String?,
  es8l4kOCoLoanAppName: json['es8l4k'] as String?,
  fatherlyOShowAppName: json['fatherly'] as String?,
  n1s2v2OPackageName: json['n1s2v2'] as String?,
  a2787eOLogo: json['a2787e'] as String?,
  ui1pz2OLink: json['ui1pz2'] as String?,
  o053asOAppDesc: json['o053as'] as String?,
  thousandOIsEffect: json['thousand'] as bool?,
  lubricOGpStatus: json['lubric'] as bool?,
);

Map<String, dynamic> _$HomeInfoResp$S2c1wyOAppCoLoanGpDetailPOList$ItemToJson(
  HomeInfoResp$S2c1wyOAppCoLoanGpDetailPOList$Item instance,
) => <String, dynamic>{
  'audacity': instance.audacityOAppTags,
  'es8l4k': instance.es8l4kOCoLoanAppName,
  'fatherly': instance.fatherlyOShowAppName,
  'n1s2v2': instance.n1s2v2OPackageName,
  'a2787e': instance.a2787eOLogo,
  'ui1pz2': instance.ui1pz2OLink,
  'o053as': instance.o053asOAppDesc,
  'thousand': instance.thousandOIsEffect,
  'lubric': instance.lubricOGpStatus,
};

PicUploadReqResp$Data _$PicUploadReqResp$DataFromJson(
  Map<String, dynamic> json,
) => PicUploadReqResp$Data(
  raiaOUserGid: json['raia'] as String?,
  gx0f5kOPictureUrl: json['gx0f5k'] as String?,
  nvooyfOObjectKey: json['nvooyf'] as String?,
);

Map<String, dynamic> _$PicUploadReqResp$DataToJson(
  PicUploadReqResp$Data instance,
) => <String, dynamic>{
  'raia': instance.raiaOUserGid,
  'gx0f5k': instance.gx0f5kOPictureUrl,
  'nvooyf': instance.nvooyfOObjectKey,
};

LoanPreInfoResp$Y5695eOProductFactory
_$LoanPreInfoResp$Y5695eOProductFactoryFromJson(Map<String, dynamic> json) =>
    LoanPreInfoResp$Y5695eOProductFactory(
      foreyardOProductId: (json['foreyard'] as num?)?.toInt(),
      za6d92OProductName: json['za6d92'] as String?,
      om06ldOProductPeriod: (json['om06ld'] as num?)?.toInt(),
      ez64t7OPeriodCount: (json['ez64t7'] as num?)?.toInt(),
      ningsiaOPeriodRate: (json['ningsia'] as num?)?.toDouble(),
      spinachyOLoanPeriod: (json['spinachy'] as num?)?.toInt(),
      v4nynoOFeeType: (json['v4nyno'] as num?)?.toInt(),
      u26p9dODueRateId: json['u26p9d'] as String?,
      j4n2j6ODueRate: (json['j4n2j6'] as num?)?.toDouble(),
      ltjgODueManageRate: (json['ltjg'] as num?)?.toDouble(),
      stropODueManageDay: (json['strop'] as num?)?.toInt(),
      uppieODueStartDay: (json['uppie'] as num?)?.toInt(),
      dandyismODueMaxLimit: (json['dandyism'] as num?)?.toDouble(),
      mojr11OLoanRangeMin: (json['mojr11'] as num?)?.toDouble(),
      xuwh2oOLoanRangeMax: (json['xuwh2o'] as num?)?.toDouble(),
      marrowOLoanRangeUnit: (json['marrow'] as num?)?.toDouble(),
      i41lj0OProductTags: json['i41lj0'] as String?,
      dieterOProductTagsList:
          (json['dieter'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      comfortOProductType: (json['comfort'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LoanPreInfoResp$Y5695eOProductFactoryToJson(
  LoanPreInfoResp$Y5695eOProductFactory instance,
) => <String, dynamic>{
  'foreyard': instance.foreyardOProductId,
  'za6d92': instance.za6d92OProductName,
  'om06ld': instance.om06ldOProductPeriod,
  'ez64t7': instance.ez64t7OPeriodCount,
  'ningsia': instance.ningsiaOPeriodRate,
  'spinachy': instance.spinachyOLoanPeriod,
  'v4nyno': instance.v4nynoOFeeType,
  'u26p9d': instance.u26p9dODueRateId,
  'j4n2j6': instance.j4n2j6ODueRate,
  'ltjg': instance.ltjgODueManageRate,
  'strop': instance.stropODueManageDay,
  'uppie': instance.uppieODueStartDay,
  'dandyism': instance.dandyismODueMaxLimit,
  'mojr11': instance.mojr11OLoanRangeMin,
  'xuwh2o': instance.xuwh2oOLoanRangeMax,
  'marrow': instance.marrowOLoanRangeUnit,
  'i41lj0': instance.i41lj0OProductTags,
  'dieter': instance.dieterOProductTagsList,
  'comfort': instance.comfortOProductType,
};

LoanPreInfoResp$GlacisORepaymentPlanList$Item
_$LoanPreInfoResp$GlacisORepaymentPlanList$ItemFromJson(
  Map<String, dynamic> json,
) => LoanPreInfoResp$GlacisORepaymentPlanList$Item(
  imprintOPlanGid: (json['imprint'] as num?)?.toInt(),
  r5a4x8OLoanGid: (json['r5a4x8'] as num?)?.toInt(),
  raiaOUserGid: json['raia'] as String?,
  ih2upqOCtPeriod: (json['ih2upq'] as num?)?.toInt(),
  spinachyOLoanPeriod: (json['spinachy'] as num?)?.toInt(),
  ez64t7OPeriodCount: (json['ez64t7'] as num?)?.toInt(),
  foreyardOProductId: json['foreyard'] as String?,
  n410zdOLoanTime: (json['n410zd'] as num?)?.toInt(),
  u2g032OStartTime: (json['u2g032'] as num?)?.toInt(),
  r5k31qODueTime: (json['r5k31q'] as num?)?.toInt(),
  suffOLoanStatus: (json['suff'] as num?)?.toInt(),
  brantailOTotalLoanAmount: (json['brantail'] as num?)?.toDouble(),
  c5ju9nOTotalLoanFee: (json['c5ju9n'] as num?)?.toDouble(),
  retiaryOLoanAmount: (json['retiary'] as num?)?.toDouble(),
  timesOBillAmount: (json['times'] as num?)?.toDouble(),
  fl92yrOBillLeftAmount: (json['fl92yr'] as num?)?.toDouble(),
  uqm81lOPrincipalAmount: (json['uqm81l'] as num?)?.toDouble(),
  v6e22nOPrincipalLeftAmount: (json['v6e22n'] as num?)?.toDouble(),
  wantonlyOLoanLeftAmount: (json['wantonly'] as num?)?.toDouble(),
  pinionOUserCouponGid: json['pinion'] as String?,
  sk6s63OCouponAmount: (json['sk6s63'] as num?)?.toDouble(),
  v4nynoOFeeType: (json['v4nyno'] as num?)?.toInt(),
  e88wy1OLoanFee: (json['e88wy1'] as num?)?.toDouble(),
  jp689uOTimeZone: json['jp689u'] as String?,
  d7x52pOBizChannel: json['d7x52p'] as String?,
  z38e62OOrderGid: json['z38e62'] as String?,
);

Map<String, dynamic> _$LoanPreInfoResp$GlacisORepaymentPlanList$ItemToJson(
  LoanPreInfoResp$GlacisORepaymentPlanList$Item instance,
) => <String, dynamic>{
  'imprint': instance.imprintOPlanGid,
  'r5a4x8': instance.r5a4x8OLoanGid,
  'raia': instance.raiaOUserGid,
  'ih2upq': instance.ih2upqOCtPeriod,
  'spinachy': instance.spinachyOLoanPeriod,
  'ez64t7': instance.ez64t7OPeriodCount,
  'foreyard': instance.foreyardOProductId,
  'n410zd': instance.n410zdOLoanTime,
  'u2g032': instance.u2g032OStartTime,
  'r5k31q': instance.r5k31qODueTime,
  'suff': instance.suffOLoanStatus,
  'brantail': instance.brantailOTotalLoanAmount,
  'c5ju9n': instance.c5ju9nOTotalLoanFee,
  'retiary': instance.retiaryOLoanAmount,
  'times': instance.timesOBillAmount,
  'fl92yr': instance.fl92yrOBillLeftAmount,
  'uqm81l': instance.uqm81lOPrincipalAmount,
  'v6e22n': instance.v6e22nOPrincipalLeftAmount,
  'wantonly': instance.wantonlyOLoanLeftAmount,
  'pinion': instance.pinionOUserCouponGid,
  'sk6s63': instance.sk6s63OCouponAmount,
  'v4nyno': instance.v4nynoOFeeType,
  'e88wy1': instance.e88wy1OLoanFee,
  'jp689u': instance.jp689uOTimeZone,
  'd7x52p': instance.d7x52pOBizChannel,
  'z38e62': instance.z38e62OOrderGid,
};

LoanFeeDetailResp$Data _$LoanFeeDetailResp$DataFromJson(
  Map<String, dynamic> json,
) => LoanFeeDetailResp$Data(
  t72jj1OCreditSearchFee: (json['t72jj1'] as num?)?.toDouble(),
  cdslOTransferFee: (json['cdsl'] as num?)?.toDouble(),
  badnessOIgvFee: (json['badness'] as num?)?.toDouble(),
  meatballOAfterFee: (json['meatball'] as num?)?.toDouble(),
  g3x614ORepaymentFee: (json['g3x614'] as num?)?.toDouble(),
  chagalORepaymentFeeFlag: json['chagal'] as bool?,
);

Map<String, dynamic> _$LoanFeeDetailResp$DataToJson(
  LoanFeeDetailResp$Data instance,
) => <String, dynamic>{
  't72jj1': instance.t72jj1OCreditSearchFee,
  'cdsl': instance.cdslOTransferFee,
  'badness': instance.badnessOIgvFee,
  'meatball': instance.meatballOAfterFee,
  'g3x614': instance.g3x614ORepaymentFee,
  'chagal': instance.chagalORepaymentFeeFlag,
};

NeedAbandonReasonResp$Du00hsOAbandonReasons$Item
_$NeedAbandonReasonResp$Du00hsOAbandonReasons$ItemFromJson(
  Map<String, dynamic> json,
) => NeedAbandonReasonResp$Du00hsOAbandonReasons$Item(
  id: (json['id'] as num?)?.toInt(),
  fl93q8OAbandonReason: json['fl93q8'] as String?,
);

Map<String, dynamic> _$NeedAbandonReasonResp$Du00hsOAbandonReasons$ItemToJson(
  NeedAbandonReasonResp$Du00hsOAbandonReasons$Item instance,
) => <String, dynamic>{
  'id': instance.id,
  'fl93q8': instance.fl93q8OAbandonReason,
};

LoanNoticeResp$Data _$LoanNoticeResp$DataFromJson(Map<String, dynamic> json) =>
    LoanNoticeResp$Data(
      cramboOLoanNoticeList: (json['crambo'] as List<dynamic>?)
          ?.map(
            (e) => LoanNoticeResp$Data$CramboOLoanNoticeList$Item.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      jhxzxdOMainShowFlag: json['jhxzxd'] as bool?,
      qy99sbOLoanShowFlag: json['qy99sb'] as bool?,
      diplegiaOUserType: (json['diplegia'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LoanNoticeResp$DataToJson(
  LoanNoticeResp$Data instance,
) => <String, dynamic>{
  'crambo': instance.cramboOLoanNoticeList?.map((e) => e.toJson()).toList(),
  'jhxzxd': instance.jhxzxdOMainShowFlag,
  'qy99sb': instance.qy99sbOLoanShowFlag,
  'diplegia': instance.diplegiaOUserType,
};

HomeCouponResp$FireballOUserCouponList$Item
_$HomeCouponResp$FireballOUserCouponList$ItemFromJson(
  Map<String, dynamic> json,
) => HomeCouponResp$FireballOUserCouponList$Item(
  id: (json['id'] as num?)?.toInt(),
  pinionOUserCouponGid: json['pinion'] as String?,
  a17s38OActivityGid: (json['a17s38'] as num?)?.toInt(),
  raiaOUserGid: json['raia'] as String?,
  tapetteOCouponGid: (json['tapette'] as num?)?.toInt(),
  zevto4OCouponName: json['zevto4'] as String?,
  type: (json['type'] as num?)?.toInt(),
  h05e55OLowerLimitAmount: (json['h05e55'] as num?)?.toDouble(),
  fbctseOCouponValue: (json['fbctse'] as num?)?.toDouble(),
  mammiferOEffectDays: (json['mammifer'] as num?)?.toInt(),
  u2g032OStartTime: (json['u2g032'] as num?)?.toInt(),
  colubridOEndTime: (json['colubrid'] as num?)?.toInt(),
  pqf70dOIsDeleted: (json['pqf70d'] as num?)?.toInt(),
  mtsv37OIsUsed: (json['mtsv37'] as num?)?.toInt(),
  remark: json['remark'] as String?,
  staticsOCreateTime: (json['statics'] as num?)?.toInt(),
  l16h95OUpdateTime: (json['l16h95'] as num?)?.toInt(),
  l536ojOCreateUser: json['l536oj'] as String?,
  og8l1yOUpdateUser: json['og8l1y'] as String?,
  besiegerOIsReceived: (json['besieger'] as num?)?.toInt(),
  bh9cjjOReceiveTime: (json['bh9cjj'] as num?)?.toInt(),
  dmza48OUseTime: (json['dmza48'] as num?)?.toInt(),
);

Map<String, dynamic> _$HomeCouponResp$FireballOUserCouponList$ItemToJson(
  HomeCouponResp$FireballOUserCouponList$Item instance,
) => <String, dynamic>{
  'id': instance.id,
  'pinion': instance.pinionOUserCouponGid,
  'a17s38': instance.a17s38OActivityGid,
  'raia': instance.raiaOUserGid,
  'tapette': instance.tapetteOCouponGid,
  'zevto4': instance.zevto4OCouponName,
  'type': instance.type,
  'h05e55': instance.h05e55OLowerLimitAmount,
  'fbctse': instance.fbctseOCouponValue,
  'mammifer': instance.mammiferOEffectDays,
  'u2g032': instance.u2g032OStartTime,
  'colubrid': instance.colubridOEndTime,
  'pqf70d': instance.pqf70dOIsDeleted,
  'mtsv37': instance.mtsv37OIsUsed,
  'remark': instance.remark,
  'statics': instance.staticsOCreateTime,
  'l16h95': instance.l16h95OUpdateTime,
  'l536oj': instance.l536ojOCreateUser,
  'og8l1y': instance.og8l1yOUpdateUser,
  'besieger': instance.besiegerOIsReceived,
  'bh9cjj': instance.bh9cjjOReceiveTime,
  'dmza48': instance.dmza48OUseTime,
};

LoanCouponResp$T933d6OUserCouponAvailableList$Item
_$LoanCouponResp$T933d6OUserCouponAvailableList$ItemFromJson(
  Map<String, dynamic> json,
) => LoanCouponResp$T933d6OUserCouponAvailableList$Item(
  id: (json['id'] as num?)?.toInt(),
  pinionOUserCouponGid: json['pinion'] as String?,
  a17s38OActivityGid: (json['a17s38'] as num?)?.toInt(),
  raiaOUserGid: json['raia'] as String?,
  tapetteOCouponGid: (json['tapette'] as num?)?.toInt(),
  zevto4OCouponName: json['zevto4'] as String?,
  type: (json['type'] as num?)?.toInt(),
  h05e55OLowerLimitAmount: (json['h05e55'] as num?)?.toDouble(),
  fbctseOCouponValue: (json['fbctse'] as num?)?.toDouble(),
  mammiferOEffectDays: (json['mammifer'] as num?)?.toInt(),
  u2g032OStartTime: (json['u2g032'] as num?)?.toInt(),
  colubridOEndTime: (json['colubrid'] as num?)?.toInt(),
  pqf70dOIsDeleted: (json['pqf70d'] as num?)?.toInt(),
  mtsv37OIsUsed: (json['mtsv37'] as num?)?.toInt(),
  remark: json['remark'] as String?,
  staticsOCreateTime: (json['statics'] as num?)?.toInt(),
  l16h95OUpdateTime: (json['l16h95'] as num?)?.toInt(),
  l536ojOCreateUser: json['l536oj'] as String?,
  og8l1yOUpdateUser: json['og8l1y'] as String?,
  besiegerOIsReceived: (json['besieger'] as num?)?.toInt(),
  bh9cjjOReceiveTime: (json['bh9cjj'] as num?)?.toInt(),
  dmza48OUseTime: (json['dmza48'] as num?)?.toInt(),
);

Map<String, dynamic> _$LoanCouponResp$T933d6OUserCouponAvailableList$ItemToJson(
  LoanCouponResp$T933d6OUserCouponAvailableList$Item instance,
) => <String, dynamic>{
  'id': instance.id,
  'pinion': instance.pinionOUserCouponGid,
  'a17s38': instance.a17s38OActivityGid,
  'raia': instance.raiaOUserGid,
  'tapette': instance.tapetteOCouponGid,
  'zevto4': instance.zevto4OCouponName,
  'type': instance.type,
  'h05e55': instance.h05e55OLowerLimitAmount,
  'fbctse': instance.fbctseOCouponValue,
  'mammifer': instance.mammiferOEffectDays,
  'u2g032': instance.u2g032OStartTime,
  'colubrid': instance.colubridOEndTime,
  'pqf70d': instance.pqf70dOIsDeleted,
  'mtsv37': instance.mtsv37OIsUsed,
  'remark': instance.remark,
  'statics': instance.staticsOCreateTime,
  'l16h95': instance.l16h95OUpdateTime,
  'l536oj': instance.l536ojOCreateUser,
  'og8l1y': instance.og8l1yOUpdateUser,
  'besieger': instance.besiegerOIsReceived,
  'bh9cjj': instance.bh9cjjOReceiveTime,
  'dmza48': instance.dmza48OUseTime,
};

LoanCouponResp$StannateOUserCouponUnavailableList$Item
_$LoanCouponResp$StannateOUserCouponUnavailableList$ItemFromJson(
  Map<String, dynamic> json,
) => LoanCouponResp$StannateOUserCouponUnavailableList$Item(
  id: (json['id'] as num?)?.toInt(),
  pinionOUserCouponGid: json['pinion'] as String?,
  a17s38OActivityGid: (json['a17s38'] as num?)?.toInt(),
  raiaOUserGid: json['raia'] as String?,
  tapetteOCouponGid: (json['tapette'] as num?)?.toInt(),
  zevto4OCouponName: json['zevto4'] as String?,
  type: (json['type'] as num?)?.toInt(),
  h05e55OLowerLimitAmount: (json['h05e55'] as num?)?.toDouble(),
  fbctseOCouponValue: (json['fbctse'] as num?)?.toDouble(),
  mammiferOEffectDays: (json['mammifer'] as num?)?.toInt(),
  u2g032OStartTime: (json['u2g032'] as num?)?.toInt(),
  colubridOEndTime: (json['colubrid'] as num?)?.toInt(),
  pqf70dOIsDeleted: (json['pqf70d'] as num?)?.toInt(),
  mtsv37OIsUsed: (json['mtsv37'] as num?)?.toInt(),
  remark: json['remark'] as String?,
  staticsOCreateTime: (json['statics'] as num?)?.toInt(),
  l16h95OUpdateTime: (json['l16h95'] as num?)?.toInt(),
  l536ojOCreateUser: json['l536oj'] as String?,
  og8l1yOUpdateUser: json['og8l1y'] as String?,
  besiegerOIsReceived: (json['besieger'] as num?)?.toInt(),
  bh9cjjOReceiveTime: (json['bh9cjj'] as num?)?.toInt(),
  dmza48OUseTime: (json['dmza48'] as num?)?.toInt(),
);

Map<String, dynamic>
_$LoanCouponResp$StannateOUserCouponUnavailableList$ItemToJson(
  LoanCouponResp$StannateOUserCouponUnavailableList$Item instance,
) => <String, dynamic>{
  'id': instance.id,
  'pinion': instance.pinionOUserCouponGid,
  'a17s38': instance.a17s38OActivityGid,
  'raia': instance.raiaOUserGid,
  'tapette': instance.tapetteOCouponGid,
  'zevto4': instance.zevto4OCouponName,
  'type': instance.type,
  'h05e55': instance.h05e55OLowerLimitAmount,
  'fbctse': instance.fbctseOCouponValue,
  'mammifer': instance.mammiferOEffectDays,
  'u2g032': instance.u2g032OStartTime,
  'colubrid': instance.colubridOEndTime,
  'pqf70d': instance.pqf70dOIsDeleted,
  'mtsv37': instance.mtsv37OIsUsed,
  'remark': instance.remark,
  'statics': instance.staticsOCreateTime,
  'l16h95': instance.l16h95OUpdateTime,
  'l536oj': instance.l536ojOCreateUser,
  'og8l1y': instance.og8l1yOUpdateUser,
  'besieger': instance.besiegerOIsReceived,
  'bh9cjj': instance.bh9cjjOReceiveTime,
  'dmza48': instance.dmza48OUseTime,
};

MyCouponResp$FireballOUserCouponList$Item
_$MyCouponResp$FireballOUserCouponList$ItemFromJson(
  Map<String, dynamic> json,
) => MyCouponResp$FireballOUserCouponList$Item(
  id: (json['id'] as num?)?.toInt(),
  pinionOUserCouponGid: json['pinion'] as String?,
  a17s38OActivityGid: (json['a17s38'] as num?)?.toInt(),
  raiaOUserGid: json['raia'] as String?,
  tapetteOCouponGid: (json['tapette'] as num?)?.toInt(),
  zevto4OCouponName: json['zevto4'] as String?,
  type: (json['type'] as num?)?.toInt(),
  h05e55OLowerLimitAmount: (json['h05e55'] as num?)?.toDouble(),
  fbctseOCouponValue: (json['fbctse'] as num?)?.toDouble(),
  mammiferOEffectDays: (json['mammifer'] as num?)?.toInt(),
  u2g032OStartTime: (json['u2g032'] as num?)?.toInt(),
  colubridOEndTime: (json['colubrid'] as num?)?.toInt(),
  pqf70dOIsDeleted: (json['pqf70d'] as num?)?.toInt(),
  mtsv37OIsUsed: (json['mtsv37'] as num?)?.toInt(),
  remark: json['remark'] as String?,
  staticsOCreateTime: (json['statics'] as num?)?.toInt(),
  l16h95OUpdateTime: (json['l16h95'] as num?)?.toInt(),
  l536ojOCreateUser: json['l536oj'] as String?,
  og8l1yOUpdateUser: json['og8l1y'] as String?,
  besiegerOIsReceived: (json['besieger'] as num?)?.toInt(),
  bh9cjjOReceiveTime: (json['bh9cjj'] as num?)?.toInt(),
  dmza48OUseTime: (json['dmza48'] as num?)?.toInt(),
);

Map<String, dynamic> _$MyCouponResp$FireballOUserCouponList$ItemToJson(
  MyCouponResp$FireballOUserCouponList$Item instance,
) => <String, dynamic>{
  'id': instance.id,
  'pinion': instance.pinionOUserCouponGid,
  'a17s38': instance.a17s38OActivityGid,
  'raia': instance.raiaOUserGid,
  'tapette': instance.tapetteOCouponGid,
  'zevto4': instance.zevto4OCouponName,
  'type': instance.type,
  'h05e55': instance.h05e55OLowerLimitAmount,
  'fbctse': instance.fbctseOCouponValue,
  'mammifer': instance.mammiferOEffectDays,
  'u2g032': instance.u2g032OStartTime,
  'colubrid': instance.colubridOEndTime,
  'pqf70d': instance.pqf70dOIsDeleted,
  'mtsv37': instance.mtsv37OIsUsed,
  'remark': instance.remark,
  'statics': instance.staticsOCreateTime,
  'l16h95': instance.l16h95OUpdateTime,
  'l536oj': instance.l536ojOCreateUser,
  'og8l1y': instance.og8l1yOUpdateUser,
  'besieger': instance.besiegerOIsReceived,
  'bh9cjj': instance.bh9cjjOReceiveTime,
  'dmza48': instance.dmza48OUseTime,
};

LandCouponResp$FireballOUserCouponList$Item
_$LandCouponResp$FireballOUserCouponList$ItemFromJson(
  Map<String, dynamic> json,
) => LandCouponResp$FireballOUserCouponList$Item(
  id: (json['id'] as num?)?.toInt(),
  pinionOUserCouponGid: json['pinion'] as String?,
  a17s38OActivityGid: (json['a17s38'] as num?)?.toInt(),
  raiaOUserGid: json['raia'] as String?,
  tapetteOCouponGid: (json['tapette'] as num?)?.toInt(),
  zevto4OCouponName: json['zevto4'] as String?,
  type: (json['type'] as num?)?.toInt(),
  h05e55OLowerLimitAmount: (json['h05e55'] as num?)?.toDouble(),
  fbctseOCouponValue: (json['fbctse'] as num?)?.toDouble(),
  mammiferOEffectDays: (json['mammifer'] as num?)?.toInt(),
  u2g032OStartTime: (json['u2g032'] as num?)?.toInt(),
  colubridOEndTime: (json['colubrid'] as num?)?.toInt(),
  pqf70dOIsDeleted: (json['pqf70d'] as num?)?.toInt(),
  mtsv37OIsUsed: (json['mtsv37'] as num?)?.toInt(),
  remark: json['remark'] as String?,
  staticsOCreateTime: (json['statics'] as num?)?.toInt(),
  l16h95OUpdateTime: (json['l16h95'] as num?)?.toInt(),
  l536ojOCreateUser: json['l536oj'] as String?,
  og8l1yOUpdateUser: json['og8l1y'] as String?,
  besiegerOIsReceived: (json['besieger'] as num?)?.toInt(),
  bh9cjjOReceiveTime: (json['bh9cjj'] as num?)?.toInt(),
  dmza48OUseTime: (json['dmza48'] as num?)?.toInt(),
);

Map<String, dynamic> _$LandCouponResp$FireballOUserCouponList$ItemToJson(
  LandCouponResp$FireballOUserCouponList$Item instance,
) => <String, dynamic>{
  'id': instance.id,
  'pinion': instance.pinionOUserCouponGid,
  'a17s38': instance.a17s38OActivityGid,
  'raia': instance.raiaOUserGid,
  'tapette': instance.tapetteOCouponGid,
  'zevto4': instance.zevto4OCouponName,
  'type': instance.type,
  'h05e55': instance.h05e55OLowerLimitAmount,
  'fbctse': instance.fbctseOCouponValue,
  'mammifer': instance.mammiferOEffectDays,
  'u2g032': instance.u2g032OStartTime,
  'colubrid': instance.colubridOEndTime,
  'pqf70d': instance.pqf70dOIsDeleted,
  'mtsv37': instance.mtsv37OIsUsed,
  'remark': instance.remark,
  'statics': instance.staticsOCreateTime,
  'l16h95': instance.l16h95OUpdateTime,
  'l536oj': instance.l536ojOCreateUser,
  'og8l1y': instance.og8l1yOUpdateUser,
  'besieger': instance.besiegerOIsReceived,
  'bh9cjj': instance.bh9cjjOReceiveTime,
  'dmza48': instance.dmza48OUseTime,
};

CouponPopResp$Oxmqq4OHomePopFlag _$CouponPopResp$Oxmqq4OHomePopFlagFromJson(
  Map<String, dynamic> json,
) => CouponPopResp$Oxmqq4OHomePopFlag(
  manoOMapKey: json['mano'],
  reopposeOMapValue: json['reoppose'] == null
      ? null
      : CouponPopResp$Oxmqq4OHomePopFlag$ReopposeOMapValue.fromJson(
          json['reoppose'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$CouponPopResp$Oxmqq4OHomePopFlagToJson(
  CouponPopResp$Oxmqq4OHomePopFlag instance,
) => <String, dynamic>{
  'mano': instance.manoOMapKey,
  'reoppose': instance.reopposeOMapValue?.toJson(),
};

LoanBillResp$Ouxtd3OLoanList$Item _$LoanBillResp$Ouxtd3OLoanList$ItemFromJson(
  Map<String, dynamic> json,
) => LoanBillResp$Ouxtd3OLoanList$Item(
  r5a4x8OLoanGid: json['r5a4x8'] as String?,
  n410zdOLoanTime: (json['n410zd'] as num?)?.toInt(),
  r5k31qODueTime: (json['r5k31q'] as num?)?.toInt(),
  wantonlyOLoanLeftAmount: (json['wantonly'] as num?)?.toDouble(),
  retiaryOLoanAmount: (json['retiary'] as num?)?.toDouble(),
  d95091ORepaymentStatus: (json['d95091'] as num?)?.toInt(),
  suffOLoanStatus: (json['suff'] as num?)?.toInt(),
  feminieOCardAccount: json['feminie'] as String?,
  ah1e18OBillStatus: (json['ah1e18'] as num?)?.toInt(),
  coandaODueDays: (json['coanda'] as num?)?.toInt(),
  vx4165OFailReason: json['vx4165'] as String?,
  pinionOUserCouponGid: json['pinion'] as String?,
  sk6s63OCouponAmount: (json['sk6s63'] as num?)?.toDouble(),
  mxs06uOApplyStatus: json['mxs06u'] as String?,
  ez64t7OPeriodCount: (json['ez64t7'] as num?)?.toInt(),
  cherubimOOrderStatus: (json['cherubim'] as num?)?.toInt(),
  encloseOOrderTime: (json['enclose'] as num?)?.toInt(),
  wa5f08OOrderDueDays: (json['wa5f08'] as num?)?.toInt(),
  iy8ujyOIsShowTime: json['iy8ujy'] as bool?,
  kinkyOOrderAmount: (json['kinky'] as num?)?.toDouble(),
  outdoOPlanSimpleList: (json['outdo'] as List<dynamic>?)
      ?.map(
        (e) =>
            LoanBillResp$Ouxtd3OLoanList$Item$OutdoOPlanSimpleList$Item.fromJson(
              e as Map<String, dynamic>,
            ),
      )
      .toList(),
  slackOIsOverdue: json['slack'] as bool?,
  remark: json['remark'] as String?,
  kc1347OEnableRenew: json['kc1347'] as bool?,
);

Map<String, dynamic> _$LoanBillResp$Ouxtd3OLoanList$ItemToJson(
  LoanBillResp$Ouxtd3OLoanList$Item instance,
) => <String, dynamic>{
  'r5a4x8': instance.r5a4x8OLoanGid,
  'n410zd': instance.n410zdOLoanTime,
  'r5k31q': instance.r5k31qODueTime,
  'wantonly': instance.wantonlyOLoanLeftAmount,
  'retiary': instance.retiaryOLoanAmount,
  'd95091': instance.d95091ORepaymentStatus,
  'suff': instance.suffOLoanStatus,
  'feminie': instance.feminieOCardAccount,
  'ah1e18': instance.ah1e18OBillStatus,
  'coanda': instance.coandaODueDays,
  'vx4165': instance.vx4165OFailReason,
  'pinion': instance.pinionOUserCouponGid,
  'sk6s63': instance.sk6s63OCouponAmount,
  'mxs06u': instance.mxs06uOApplyStatus,
  'ez64t7': instance.ez64t7OPeriodCount,
  'cherubim': instance.cherubimOOrderStatus,
  'enclose': instance.encloseOOrderTime,
  'wa5f08': instance.wa5f08OOrderDueDays,
  'iy8ujy': instance.iy8ujyOIsShowTime,
  'kinky': instance.kinkyOOrderAmount,
  'outdo': instance.outdoOPlanSimpleList?.map((e) => e.toJson()).toList(),
  'slack': instance.slackOIsOverdue,
  'remark': instance.remark,
  'kc1347': instance.kc1347OEnableRenew,
};

BillListResp$SoberOBillList$Item _$BillListResp$SoberOBillList$ItemFromJson(
  Map<String, dynamic> json,
) => BillListResp$SoberOBillList$Item(
  r5a4x8OLoanGid: (json['r5a4x8'] as num?)?.toInt(),
  r5k31qODueTime: (json['r5k31q'] as num?)?.toInt(),
  wantonlyOLoanLeftAmount: (json['wantonly'] as num?)?.toDouble(),
  retiaryOLoanAmount: (json['retiary'] as num?)?.toDouble(),
  slackOIsOverdue: json['slack'] as bool?,
  d95091ORepaymentStatus: (json['d95091'] as num?)?.toInt(),
  suffOLoanStatus: (json['suff'] as num?)?.toInt(),
  ux8tv0OTotalLeftAmount: (json['ux8tv0'] as num?)?.toDouble(),
  coandaODueDays: (json['coanda'] as num?)?.toInt(),
  pinionOUserCouponGid: json['pinion'] as String?,
  sk6s63OCouponAmount: (json['sk6s63'] as num?)?.toDouble(),
  r86mu7OProductTag: json['r86mu7'] as String?,
  ez64t7OPeriodCount: (json['ez64t7'] as num?)?.toInt(),
  maxDueDay: (json['maxDueDay'] as num?)?.toInt(),
  j4n2j6ODueRate: json['j4n2j6'] as String?,
  periodPaidCount: (json['periodPaidCount'] as num?)?.toInt(),
  z7c658OPrincipalPaidAmount: (json['z7c658'] as num?)?.toDouble(),
  reeditOServiceFeePaidAmount: (json['reedit'] as num?)?.toDouble(),
  guilefulOOverdueFeePaidAmount: (json['guileful'] as num?)?.toDouble(),
);

Map<String, dynamic> _$BillListResp$SoberOBillList$ItemToJson(
  BillListResp$SoberOBillList$Item instance,
) => <String, dynamic>{
  'r5a4x8': instance.r5a4x8OLoanGid,
  'r5k31q': instance.r5k31qODueTime,
  'wantonly': instance.wantonlyOLoanLeftAmount,
  'retiary': instance.retiaryOLoanAmount,
  'slack': instance.slackOIsOverdue,
  'd95091': instance.d95091ORepaymentStatus,
  'suff': instance.suffOLoanStatus,
  'ux8tv0': instance.ux8tv0OTotalLeftAmount,
  'coanda': instance.coandaODueDays,
  'pinion': instance.pinionOUserCouponGid,
  'sk6s63': instance.sk6s63OCouponAmount,
  'r86mu7': instance.r86mu7OProductTag,
  'ez64t7': instance.ez64t7OPeriodCount,
  'maxDueDay': instance.maxDueDay,
  'j4n2j6': instance.j4n2j6ODueRate,
  'periodPaidCount': instance.periodPaidCount,
  'z7c658': instance.z7c658OPrincipalPaidAmount,
  'reedit': instance.reeditOServiceFeePaidAmount,
  'guileful': instance.guilefulOOverdueFeePaidAmount,
};

BillDetailResp$V08uw3ORepaymentChannelList$Item
_$BillDetailResp$V08uw3ORepaymentChannelList$ItemFromJson(
  Map<String, dynamic> json,
) => BillDetailResp$V08uw3ORepaymentChannelList$Item(
  oe5u39OChannelName: json['oe5u39'] as String?,
  worstOChannelCode: json['worst'] as String?,
  weight: (json['weight'] as num?)?.toInt(),
  status: (json['status'] as num?)?.toInt(),
  y28nd4OChannelType: (json['y28nd4'] as num?)?.toInt(),
  s377v5OBizLine: json['s377v5'] as String?,
  k5j6q9OChannelAccount: json['k5j6q9'] as String?,
  maxAmount: (json['maxAmount'] as num?)?.toDouble(),
  minAmount: (json['minAmount'] as num?)?.toDouble(),
  sort: (json['sort'] as num?)?.toInt(),
  fratOMark: json['frat'] as String?,
  remark: json['remark'] as String?,
  ejv164OChannelTypeName: json['ejv164'] as String?,
  nq7f9vOMinChannelFee: (json['nq7f9v'] as num?)?.toDouble(),
  kd94z7OChannelRate: (json['kd94z7'] as num?)?.toDouble(),
  scrougeOMinRepaymentAmount: (json['scrouge'] as num?)?.toDouble(),
);

Map<String, dynamic> _$BillDetailResp$V08uw3ORepaymentChannelList$ItemToJson(
  BillDetailResp$V08uw3ORepaymentChannelList$Item instance,
) => <String, dynamic>{
  'oe5u39': instance.oe5u39OChannelName,
  'worst': instance.worstOChannelCode,
  'weight': instance.weight,
  'status': instance.status,
  'y28nd4': instance.y28nd4OChannelType,
  's377v5': instance.s377v5OBizLine,
  'k5j6q9': instance.k5j6q9OChannelAccount,
  'maxAmount': instance.maxAmount,
  'minAmount': instance.minAmount,
  'sort': instance.sort,
  'frat': instance.fratOMark,
  'remark': instance.remark,
  'ejv164': instance.ejv164OChannelTypeName,
  'nq7f9v': instance.nq7f9vOMinChannelFee,
  'kd94z7': instance.kd94z7OChannelRate,
  'scrouge': instance.scrougeOMinRepaymentAmount,
};

BillDetailResp$GlacisORepaymentPlanList$Item
_$BillDetailResp$GlacisORepaymentPlanList$ItemFromJson(
  Map<String, dynamic> json,
) => BillDetailResp$GlacisORepaymentPlanList$Item(
  imprintOPlanGid: (json['imprint'] as num?)?.toInt(),
  r5a4x8OLoanGid: (json['r5a4x8'] as num?)?.toInt(),
  raiaOUserGid: json['raia'] as String?,
  ih2upqOCtPeriod: (json['ih2upq'] as num?)?.toInt(),
  spinachyOLoanPeriod: (json['spinachy'] as num?)?.toInt(),
  ez64t7OPeriodCount: (json['ez64t7'] as num?)?.toInt(),
  foreyardOProductId: (json['foreyard'] as num?)?.toInt(),
  n410zdOLoanTime: (json['n410zd'] as num?)?.toInt(),
  u2g032OStartTime: (json['u2g032'] as num?)?.toInt(),
  r5k31qODueTime: (json['r5k31q'] as num?)?.toInt(),
  suffOLoanStatus: (json['suff'] as num?)?.toInt(),
  mxs06uOApplyStatus: json['mxs06u'] as String?,
  brantailOTotalLoanAmount: (json['brantail'] as num?)?.toDouble(),
  c5ju9nOTotalLoanFee: (json['c5ju9n'] as num?)?.toDouble(),
  retiaryOLoanAmount: (json['retiary'] as num?)?.toDouble(),
  timesOBillAmount: (json['times'] as num?)?.toDouble(),
  fl92yrOBillLeftAmount: (json['fl92yr'] as num?)?.toDouble(),
  uqm81lOPrincipalAmount: (json['uqm81l'] as num?)?.toDouble(),
  v6e22nOPrincipalLeftAmount: (json['v6e22n'] as num?)?.toDouble(),
  wantonlyOLoanLeftAmount: (json['wantonly'] as num?)?.toDouble(),
  pinionOUserCouponGid: json['pinion'] as String?,
  sk6s63OCouponAmount: (json['sk6s63'] as num?)?.toDouble(),
  gatemanORepaymentAmount: (json['gateman'] as num?)?.toDouble(),
  z7c658OPrincipalPaidAmount: (json['z7c658'] as num?)?.toDouble(),
  reeditOServiceFeePaidAmount: (json['reedit'] as num?)?.toDouble(),
  guilefulOOverdueFeePaidAmount: (json['guileful'] as num?)?.toDouble(),
  d95091ORepaymentStatus: (json['d95091'] as num?)?.toInt(),
  v4nynoOFeeType: (json['v4nyno'] as num?)?.toInt(),
  q3568aOLoanPrefixRate: (json['q3568a'] as num?)?.toDouble(),
  bobbedOLoanPostRate: (json['bobbed'] as num?)?.toDouble(),
  j4n2j6ODueRate: json['j4n2j6'] as String?,
  e88wy1OLoanFee: (json['e88wy1'] as num?)?.toDouble(),
  muscleOPrefixFee: (json['muscle'] as num?)?.toDouble(),
  piz72tOPostFee: (json['piz72t'] as num?)?.toDouble(),
  faciendOOverdueFee: (json['faciend'] as num?)?.toDouble(),
  slackOIsOverdue: json['slack'] as bool?,
  nbk975OPlatformAmount: (json['nbk975'] as num?)?.toDouble(),
  clansmanODueDay: (json['clansman'] as num?)?.toInt(),
  johannesODosettleFeeTime: (json['johannes'] as num?)?.toInt(),
  hakodateOLastRepaymentTime: (json['hakodate'] as num?)?.toInt(),
  qc5edvORepaymentChannel: json['qc5edv'] as String?,
  tonelessORepaymentChannelName: json['toneless'] as String?,
  jp689uOTimeZone: json['jp689u'] as String?,
  e0a79hOIsCollectCase: json['e0a79h'] as bool?,
  d7x52pOBizChannel: json['d7x52p'] as String?,
  z38e62OOrderGid: json['z38e62'] as String?,
  sweenyOWorkFlowId: (json['sweeny'] as num?)?.toInt(),
  remark: json['remark'] as String?,
  i2jk5fOPeriodStatus: (json['i2jk5f'] as num?)?.toInt(),
  emceeOReduceAmount: (json['emcee'] as num?)?.toDouble(),
  spriteOBusinessFee: (json['sprite'] as num?)?.toDouble(),
  renewPaidAmount: (json['renewPaidAmount'] as num?)?.toDouble(),
  renewLoanFee: (json['renewLoanFee'] as num?)?.toDouble(),
  originDueTime: (json['originDueTime'] as num?)?.toInt(),
  firstRenewLoanTime: (json['firstRenewLoanTime'] as num?)?.toInt(),
  chuseOLoanProductType: (json['chuse'] as num?)?.toInt(),
);

Map<String, dynamic> _$BillDetailResp$GlacisORepaymentPlanList$ItemToJson(
  BillDetailResp$GlacisORepaymentPlanList$Item instance,
) => <String, dynamic>{
  'imprint': instance.imprintOPlanGid,
  'r5a4x8': instance.r5a4x8OLoanGid,
  'raia': instance.raiaOUserGid,
  'ih2upq': instance.ih2upqOCtPeriod,
  'spinachy': instance.spinachyOLoanPeriod,
  'ez64t7': instance.ez64t7OPeriodCount,
  'foreyard': instance.foreyardOProductId,
  'n410zd': instance.n410zdOLoanTime,
  'u2g032': instance.u2g032OStartTime,
  'r5k31q': instance.r5k31qODueTime,
  'suff': instance.suffOLoanStatus,
  'mxs06u': instance.mxs06uOApplyStatus,
  'brantail': instance.brantailOTotalLoanAmount,
  'c5ju9n': instance.c5ju9nOTotalLoanFee,
  'retiary': instance.retiaryOLoanAmount,
  'times': instance.timesOBillAmount,
  'fl92yr': instance.fl92yrOBillLeftAmount,
  'uqm81l': instance.uqm81lOPrincipalAmount,
  'v6e22n': instance.v6e22nOPrincipalLeftAmount,
  'wantonly': instance.wantonlyOLoanLeftAmount,
  'pinion': instance.pinionOUserCouponGid,
  'sk6s63': instance.sk6s63OCouponAmount,
  'gateman': instance.gatemanORepaymentAmount,
  'z7c658': instance.z7c658OPrincipalPaidAmount,
  'reedit': instance.reeditOServiceFeePaidAmount,
  'guileful': instance.guilefulOOverdueFeePaidAmount,
  'd95091': instance.d95091ORepaymentStatus,
  'v4nyno': instance.v4nynoOFeeType,
  'q3568a': instance.q3568aOLoanPrefixRate,
  'bobbed': instance.bobbedOLoanPostRate,
  'j4n2j6': instance.j4n2j6ODueRate,
  'e88wy1': instance.e88wy1OLoanFee,
  'muscle': instance.muscleOPrefixFee,
  'piz72t': instance.piz72tOPostFee,
  'faciend': instance.faciendOOverdueFee,
  'slack': instance.slackOIsOverdue,
  'nbk975': instance.nbk975OPlatformAmount,
  'clansman': instance.clansmanODueDay,
  'johannes': instance.johannesODosettleFeeTime,
  'hakodate': instance.hakodateOLastRepaymentTime,
  'qc5edv': instance.qc5edvORepaymentChannel,
  'toneless': instance.tonelessORepaymentChannelName,
  'jp689u': instance.jp689uOTimeZone,
  'e0a79h': instance.e0a79hOIsCollectCase,
  'd7x52p': instance.d7x52pOBizChannel,
  'z38e62': instance.z38e62OOrderGid,
  'sweeny': instance.sweenyOWorkFlowId,
  'remark': instance.remark,
  'i2jk5f': instance.i2jk5fOPeriodStatus,
  'emcee': instance.emceeOReduceAmount,
  'sprite': instance.spriteOBusinessFee,
  'renewPaidAmount': instance.renewPaidAmount,
  'renewLoanFee': instance.renewLoanFee,
  'originDueTime': instance.originDueTime,
  'firstRenewLoanTime': instance.firstRenewLoanTime,
  'chuse': instance.chuseOLoanProductType,
};

BillDetailResp$Bac6b3OUserInfoDetail
_$BillDetailResp$Bac6b3OUserInfoDetailFromJson(Map<String, dynamic> json) =>
    BillDetailResp$Bac6b3OUserInfoDetail(
      name: json['name'] as String?,
      sordidOMobile: json['sordid'] as String?,
      x537zyORealMobile: json['x537zy'] as String?,
      ls81q4ORealName: json['ls81q4'] as String?,
    );

Map<String, dynamic> _$BillDetailResp$Bac6b3OUserInfoDetailToJson(
  BillDetailResp$Bac6b3OUserInfoDetail instance,
) => <String, dynamic>{
  'name': instance.name,
  'sordid': instance.sordidOMobile,
  'x537zy': instance.x537zyORealMobile,
  'ls81q4': instance.ls81q4ORealName,
};

BillRepayResp$My4dd2ORepaymentList$Item
_$BillRepayResp$My4dd2ORepaymentList$ItemFromJson(Map<String, dynamic> json) =>
    BillRepayResp$My4dd2ORepaymentList$Item(
      r5a4x8OLoanGid: (json['r5a4x8'] as num?)?.toInt(),
      raiaOUserGid: json['raia'] as String?,
      gatemanORepaymentAmount: (json['gateman'] as num?)?.toDouble(),
      d95091ORepaymentStatus: (json['d95091'] as num?)?.toInt(),
      wtpuztORepaymentTime: (json['wtpuzt'] as num?)?.toInt(),
      remark: json['remark'] as String?,
      nannetteOReturnCode: json['nannette'] as String?,
      vx4165OFailReason: json['vx4165'] as String?,
      pyreneesOPayStatus: (json['pyrenees'] as num?)?.toInt(),
      imprintOPlanGid: (json['imprint'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BillRepayResp$My4dd2ORepaymentList$ItemToJson(
  BillRepayResp$My4dd2ORepaymentList$Item instance,
) => <String, dynamic>{
  'r5a4x8': instance.r5a4x8OLoanGid,
  'raia': instance.raiaOUserGid,
  'gateman': instance.gatemanORepaymentAmount,
  'd95091': instance.d95091ORepaymentStatus,
  'wtpuzt': instance.wtpuztORepaymentTime,
  'remark': instance.remark,
  'nannette': instance.nannetteOReturnCode,
  'vx4165': instance.vx4165OFailReason,
  'pyrenees': instance.pyreneesOPayStatus,
  'imprint': instance.imprintOPlanGid,
};

TrackReportReq$FibulaOReportBaseInfo$AcetylcoOGeolocation
_$TrackReportReq$FibulaOReportBaseInfo$AcetylcoOGeolocationFromJson(
  Map<String, dynamic> json,
) => TrackReportReq$FibulaOReportBaseInfo$AcetylcoOGeolocation(
  qi80b5OCoordinates: json['qi80b5'] as String?,
  natufianOCountry: json['natufian'] as String?,
  city: json['city'] as String?,
  j816gnOReturnErrorCode: (json['j816gn'] as num?)?.toInt(),
  ek8u6mOCallbackErrorCode: (json['ek8u6m'] as num?)?.toInt(),
  vx4165OFailReason: json['vx4165'] as String?,
  s4q56xOLocationOpen: (json['s4q56x'] as num?)?.toInt(),
);

Map<String, dynamic>
_$TrackReportReq$FibulaOReportBaseInfo$AcetylcoOGeolocationToJson(
  TrackReportReq$FibulaOReportBaseInfo$AcetylcoOGeolocation instance,
) => <String, dynamic>{
  'qi80b5': instance.qi80b5OCoordinates,
  'natufian': instance.natufianOCountry,
  'city': instance.city,
  'j816gn': instance.j816gnOReturnErrorCode,
  'ek8u6m': instance.ek8u6mOCallbackErrorCode,
  'vx4165': instance.vx4165OFailReason,
  's4q56x': instance.s4q56xOLocationOpen,
};

TrackReportReq$BanallyOReportDevDTO$HdcopyOBattery
_$TrackReportReq$BanallyOReportDevDTO$HdcopyOBatteryFromJson(
  Map<String, dynamic> json,
) => TrackReportReq$BanallyOReportDevDTO$HdcopyOBattery(
  yardOHealth: json['yard'] as String?,
  yr0nx3OPower: json['yr0nx3'] as String?,
  status: json['status'] as String?,
  k54oy6OTemperature: json['k54oy6'] as String?,
);

Map<String, dynamic> _$TrackReportReq$BanallyOReportDevDTO$HdcopyOBatteryToJson(
  TrackReportReq$BanallyOReportDevDTO$HdcopyOBattery instance,
) => <String, dynamic>{
  'yard': instance.yardOHealth,
  'yr0nx3': instance.yr0nx3OPower,
  'status': instance.status,
  'k54oy6': instance.k54oy6OTemperature,
};

TrackReportReq$BanallyOReportDevDTO$I39296OBluetooth
_$TrackReportReq$BanallyOReportDevDTO$I39296OBluetoothFromJson(
  Map<String, dynamic> json,
) => TrackReportReq$BanallyOReportDevDTO$I39296OBluetooth(
  type: (json['type'] as num?)?.toInt(),
  address: json['address'] as String?,
  m3hs2zODevices: (json['m3hs2z'] as List<dynamic>?)
      ?.map(
        (e) =>
            TrackReportReq$BanallyOReportDevDTO$I39296OBluetooth$M3hs2zODevices$Item.fromJson(
              e as Map<String, dynamic>,
            ),
      )
      .toList(),
  kp228zOIsEnabled: json['kp228z'] as bool?,
  cx8ay2OPhoneName: json['cx8ay2'] as String?,
);

Map<String, dynamic>
_$TrackReportReq$BanallyOReportDevDTO$I39296OBluetoothToJson(
  TrackReportReq$BanallyOReportDevDTO$I39296OBluetooth instance,
) => <String, dynamic>{
  'type': instance.type,
  'address': instance.address,
  'm3hs2z': instance.m3hs2zODevices?.map((e) => e.toJson()).toList(),
  'kp228z': instance.kp228zOIsEnabled,
  'cx8ay2': instance.cx8ay2OPhoneName,
};

TrackReportReq$BanallyOReportDevDTO$CostingOCameras$Item
_$TrackReportReq$BanallyOReportDevDTO$CostingOCameras$ItemFromJson(
  Map<String, dynamic> json,
) => TrackReportReq$BanallyOReportDevDTO$CostingOCameras$Item(
  yb5fusOAfModes: json['yb5fus'] as String?,
  i1u636OAperture: json['i1u636'] as String?,
  jcqdnvOFacing: json['jcqdnv'] as String?,
  flash: (json['flash'] as num?)?.toInt(),
  uveitisOFocalLength: json['uveitis'] as String?,
  level: json['level'] as String?,
  w08yy9OPixelSize: json['w08yy9'] as String?,
  discernOResolution: json['discern'] as String?,
  l9t1fnOSensorSize: json['l9t1fn'] as String?,
  tobaccoOViewAngle: json['tobacco'] as String?,
);

Map<String, dynamic>
_$TrackReportReq$BanallyOReportDevDTO$CostingOCameras$ItemToJson(
  TrackReportReq$BanallyOReportDevDTO$CostingOCameras$Item instance,
) => <String, dynamic>{
  'yb5fus': instance.yb5fusOAfModes,
  'i1u636': instance.i1u636OAperture,
  'jcqdnv': instance.jcqdnvOFacing,
  'flash': instance.flash,
  'uveitis': instance.uveitisOFocalLength,
  'level': instance.level,
  'w08yy9': instance.w08yy9OPixelSize,
  'discern': instance.discernOResolution,
  'l9t1fn': instance.l9t1fnOSensorSize,
  'tobacco': instance.tobaccoOViewAngle,
};

TrackReportReq$BanallyOReportDevDTO$Cpu
_$TrackReportReq$BanallyOReportDevDTO$CpuFromJson(Map<String, dynamic> json) =>
    TrackReportReq$BanallyOReportDevDTO$Cpu(
      cores: (json['cores'] as num?)?.toInt(),
      zamboniOCurFreq: json['zamboni'] as String?,
      r2exwnOHardware: json['r2exwn'] as String?,
      fe5d62OMaxFreq: json['fe5d62'] as String?,
      amortiseOMinFreq: json['amortise'] as String?,
    );

Map<String, dynamic> _$TrackReportReq$BanallyOReportDevDTO$CpuToJson(
  TrackReportReq$BanallyOReportDevDTO$Cpu instance,
) => <String, dynamic>{
  'cores': instance.cores,
  'zamboni': instance.zamboniOCurFreq,
  'r2exwn': instance.r2exwnOHardware,
  'fe5d62': instance.fe5d62OMaxFreq,
  'amortise': instance.amortiseOMinFreq,
};

TrackReportReq$BanallyOReportDevDTO$Slqri6OGeneral
_$TrackReportReq$BanallyOReportDevDTO$Slqri6OGeneralFromJson(
  Map<String, dynamic> json,
) => TrackReportReq$BanallyOReportDevDTO$Slqri6OGeneral(
  brightness: (json['brightness'] as num?)?.toInt(),
  d424a6OHaveIntent: json['d424a6'] as bool?,
  diffuseOInternalAvailableSize: json['diffuse'] as String?,
  iunjmsOInternalTotalSize: json['iunjms'] as String?,
  adjointOIsHotspotEnabled: json['adjoint'] as bool?,
  discernOResolution: json['discern'] as String?,
  bjf1ivOWifiRouterMac: json['bjf1iv'] as String?,
);

Map<String, dynamic> _$TrackReportReq$BanallyOReportDevDTO$Slqri6OGeneralToJson(
  TrackReportReq$BanallyOReportDevDTO$Slqri6OGeneral instance,
) => <String, dynamic>{
  'brightness': instance.brightness,
  'd424a6': instance.d424a6OHaveIntent,
  'diffuse': instance.diffuseOInternalAvailableSize,
  'iunjms': instance.iunjmsOInternalTotalSize,
  'adjoint': instance.adjointOIsHotspotEnabled,
  'discern': instance.discernOResolution,
  'bjf1iv': instance.bjf1ivOWifiRouterMac,
};

TrackReportReq$BanallyOReportDevDTO$R6i83kONetSignal
_$TrackReportReq$BanallyOReportDevDTO$R6i83kONetSignalFromJson(
  Map<String, dynamic> json,
) => TrackReportReq$BanallyOReportDevDTO$R6i83kONetSignal(
  lopeOIpv6: json['lope'] as String?,
  level: (json['level'] as num?)?.toInt(),
  s3zh03OLinkSpeed: json['s3zh03'] as String?,
  oj1h5mORssi: (json['oj1h5m'] as num?)?.toInt(),
);

Map<String, dynamic>
_$TrackReportReq$BanallyOReportDevDTO$R6i83kONetSignalToJson(
  TrackReportReq$BanallyOReportDevDTO$R6i83kONetSignal instance,
) => <String, dynamic>{
  'lope': instance.lopeOIpv6,
  'level': instance.level,
  's3zh03': instance.s3zh03OLinkSpeed,
  'oj1h5m': instance.oj1h5mORssi,
};

TrackReportReq$BanallyOReportDevDTO$AutumnalOSensors$Item
_$TrackReportReq$BanallyOReportDevDTO$AutumnalOSensors$ItemFromJson(
  Map<String, dynamic> json,
) => TrackReportReq$BanallyOReportDevDTO$AutumnalOSensors$Item(
  r09lp6OMaxRange: (json['r09lp6'] as num?)?.toDouble(),
  wienerOMinDelay: (json['wiener'] as num?)?.toInt(),
  name: json['name'] as String?,
  yr0nx3OPower: (json['yr0nx3'] as num?)?.toDouble(),
  discernOResolution: (json['discern'] as num?)?.toDouble(),
  type: (json['type'] as num?)?.toInt(),
  g0hn09OVendor: json['g0hn09'] as String?,
  lutealOVersion: (json['luteal'] as num?)?.toInt(),
);

Map<String, dynamic>
_$TrackReportReq$BanallyOReportDevDTO$AutumnalOSensors$ItemToJson(
  TrackReportReq$BanallyOReportDevDTO$AutumnalOSensors$Item instance,
) => <String, dynamic>{
  'r09lp6': instance.r09lp6OMaxRange,
  'wiener': instance.wienerOMinDelay,
  'name': instance.name,
  'yr0nx3': instance.yr0nx3OPower,
  'discern': instance.discernOResolution,
  'type': instance.type,
  'g0hn09': instance.g0hn09OVendor,
  'luteal': instance.lutealOVersion,
};

TrackReportReq$BanallyOReportDevDTO$System
_$TrackReportReq$BanallyOReportDevDTO$SystemFromJson(
  Map<String, dynamic> json,
) => TrackReportReq$BanallyOReportDevDTO$System(
  soothOBuildTags: json['sooth'] as String?,
  jm63g1OBuildType: json['jm63g1'] as String?,
  turretedOBuilder: json['turreted'] as String?,
  influmpODensity: json['inflump'] as String?,
);

Map<String, dynamic> _$TrackReportReq$BanallyOReportDevDTO$SystemToJson(
  TrackReportReq$BanallyOReportDevDTO$System instance,
) => <String, dynamic>{
  'sooth': instance.soothOBuildTags,
  'jm63g1': instance.jm63g1OBuildType,
  'turreted': instance.turretedOBuilder,
  'inflump': instance.influmpODensity,
};

TrackReportReq$BanallyOReportDevDTO$E3d40eOStructure
_$TrackReportReq$BanallyOReportDevDTO$E3d40eOStructureFromJson(
  Map<String, dynamic> json,
) => TrackReportReq$BanallyOReportDevDTO$E3d40eOStructure(
  id: json['id'] as String?,
  display: json['display'] as String?,
  is9q37OProduct: json['is9q37'] as String?,
  atticaODevice: json['attica'] as String?,
  board: json['board'] as String?,
  everwhoOBootloader: json['everwho'] as String?,
  radio: json['radio'] as String?,
  r2exwnOHardware: json['r2exwn'] as String?,
  el986rOStructVersion: json['el986r'] == null
      ? null
      : TrackReportReq$BanallyOReportDevDTO$E3d40eOStructure$El986rOStructVersion.fromJson(
          json['el986r'] as Map<String, dynamic>,
        ),
  geegawOFingerprint: json['geegaw'] as String?,
);

Map<String, dynamic>
_$TrackReportReq$BanallyOReportDevDTO$E3d40eOStructureToJson(
  TrackReportReq$BanallyOReportDevDTO$E3d40eOStructure instance,
) => <String, dynamic>{
  'id': instance.id,
  'display': instance.display,
  'is9q37': instance.is9q37OProduct,
  'attica': instance.atticaODevice,
  'board': instance.board,
  'everwho': instance.everwhoOBootloader,
  'radio': instance.radio,
  'r2exwn': instance.r2exwnOHardware,
  'el986r': instance.el986rOStructVersion?.toJson(),
  'geegaw': instance.geegawOFingerprint,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfigFromJson(
  Map<String, dynamic> json,
) => RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig(
  lq1s05OFirstName: json['lq1s05'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Lq1s05OFirstName.fromJson(
          json['lq1s05'] as Map<String, dynamic>,
        ),
  darktownOLastName: json['darktown'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$DarktownOLastName.fromJson(
          json['darktown'] as Map<String, dynamic>,
        ),
  gender: json['gender'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Gender.fromJson(
          json['gender'] as Map<String, dynamic>,
        ),
  merdekaOIdCard: json['merdeka'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$MerdekaOIdCard.fromJson(
          json['merdeka'] as Map<String, dynamic>,
        ),
  gargetOBirthday: json['garget'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$GargetOBirthday.fromJson(
          json['garget'] as Map<String, dynamic>,
        ),
  f31u3kOEmail: json['f31u3k'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$F31u3kOEmail.fromJson(
          json['f31u3k'] as Map<String, dynamic>,
        ),
  x1iu04OOtherMobile: json['x1iu04'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$X1iu04OOtherMobile.fromJson(
          json['x1iu04'] as Map<String, dynamic>,
        ),
  coseOEducation: json['cose'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$CoseOEducation.fromJson(
          json['cose'] as Map<String, dynamic>,
        ),
  m2wx4tOMaritalStatus: json['m2wx4t'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$M2wx4tOMaritalStatus.fromJson(
          json['m2wx4t'] as Map<String, dynamic>,
        ),
  chaffyOHouseStatus: json['chaffy'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$ChaffyOHouseStatus.fromJson(
          json['chaffy'] as Map<String, dynamic>,
        ),
  bja8s5OElectricityBill: json['bja8s5'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Bja8s5OElectricityBill.fromJson(
          json['bja8s5'] as Map<String, dynamic>,
        ),
  volumenOElectricityRelated: json['volumen'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$VolumenOElectricityRelated.fromJson(
          json['volumen'] as Map<String, dynamic>,
        ),
  spadicesOAddressState: json['spadices'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$SpadicesOAddressState.fromJson(
          json['spadices'] as Map<String, dynamic>,
        ),
  gasconyOAddressCity: json['gascony'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$GasconyOAddressCity.fromJson(
          json['gascony'] as Map<String, dynamic>,
        ),
  craalOAddressDetail: json['craal'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$CraalOAddressDetail.fromJson(
          json['craal'] as Map<String, dynamic>,
        ),
  himfjuOOtherLoans: json['himfju'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$HimfjuOOtherLoans.fromJson(
          json['himfju'] as Map<String, dynamic>,
        ),
  diopsideOOccupation: json['diopside'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$DiopsideOOccupation.fromJson(
          json['diopside'] as Map<String, dynamic>,
        ),
  limpidlyOIncomeLevel: json['limpidly'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$LimpidlyOIncomeLevel.fromJson(
          json['limpidly'] as Map<String, dynamic>,
        ),
  z4s937OHouseholdMonthlyExpenses: json['z4s937'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Z4s937OHouseholdMonthlyExpenses.fromJson(
          json['z4s937'] as Map<String, dynamic>,
        ),
  expenditure: json['expenditure'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Expenditure.fromJson(
          json['expenditure'] as Map<String, dynamic>,
        ),
  alloOWorkingYears: json['allo'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$AlloOWorkingYears.fromJson(
          json['allo'] as Map<String, dynamic>,
        ),
  b1417wOPayPeriod: json['b1417w'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$B1417wOPayPeriod.fromJson(
          json['b1417w'] as Map<String, dynamic>,
        ),
  r67p23OPayday: json['r67p23'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$R67p23OPayday.fromJson(
          json['r67p23'] as Map<String, dynamic>,
        ),
  plenishOSecondPayday: json['plenish'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$PlenishOSecondPayday.fromJson(
          json['plenish'] as Map<String, dynamic>,
        ),
  grippleOFirstContactName: json['gripple'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$GrippleOFirstContactName.fromJson(
          json['gripple'] as Map<String, dynamic>,
        ),
  rainOFirstContactMobile: json['rain'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$RainOFirstContactMobile.fromJson(
          json['rain'] as Map<String, dynamic>,
        ),
  baryeOFirstContactRelationship: json['barye'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$BaryeOFirstContactRelationship.fromJson(
          json['barye'] as Map<String, dynamic>,
        ),
  aquarianOSecondContactName: json['aquarian'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$AquarianOSecondContactName.fromJson(
          json['aquarian'] as Map<String, dynamic>,
        ),
  h3d2wfOSecondContactMobile: json['h3d2wf'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$H3d2wfOSecondContactMobile.fromJson(
          json['h3d2wf'] as Map<String, dynamic>,
        ),
  kibeOSecondContactRelationship: json['kibe'] == null
      ? null
      : RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$KibeOSecondContactRelationship.fromJson(
          json['kibe'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfigToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig instance,
) => <String, dynamic>{
  'lq1s05': instance.lq1s05OFirstName?.toJson(),
  'darktown': instance.darktownOLastName?.toJson(),
  'gender': instance.gender?.toJson(),
  'merdeka': instance.merdekaOIdCard?.toJson(),
  'garget': instance.gargetOBirthday?.toJson(),
  'f31u3k': instance.f31u3kOEmail?.toJson(),
  'x1iu04': instance.x1iu04OOtherMobile?.toJson(),
  'cose': instance.coseOEducation?.toJson(),
  'm2wx4t': instance.m2wx4tOMaritalStatus?.toJson(),
  'chaffy': instance.chaffyOHouseStatus?.toJson(),
  'bja8s5': instance.bja8s5OElectricityBill?.toJson(),
  'volumen': instance.volumenOElectricityRelated?.toJson(),
  'spadices': instance.spadicesOAddressState?.toJson(),
  'gascony': instance.gasconyOAddressCity?.toJson(),
  'craal': instance.craalOAddressDetail?.toJson(),
  'himfju': instance.himfjuOOtherLoans?.toJson(),
  'diopside': instance.diopsideOOccupation?.toJson(),
  'limpidly': instance.limpidlyOIncomeLevel?.toJson(),
  'z4s937': instance.z4s937OHouseholdMonthlyExpenses?.toJson(),
  'expenditure': instance.expenditure?.toJson(),
  'allo': instance.alloOWorkingYears?.toJson(),
  'b1417w': instance.b1417wOPayPeriod?.toJson(),
  'r67p23': instance.r67p23OPayday?.toJson(),
  'plenish': instance.plenishOSecondPayday?.toJson(),
  'gripple': instance.grippleOFirstContactName?.toJson(),
  'rain': instance.rainOFirstContactMobile?.toJson(),
  'barye': instance.baryeOFirstContactRelationship?.toJson(),
  'aquarian': instance.aquarianOSecondContactName?.toJson(),
  'h3d2wf': instance.h3d2wfOSecondContactMobile?.toJson(),
  'kibe': instance.kibeOSecondContactRelationship?.toJson(),
};

RepayApplyResp$TartarlyOPins$Item$RuralOAgentes$Item
_$RepayApplyResp$TartarlyOPins$Item$RuralOAgentes$ItemFromJson(
  Map<String, dynamic> json,
) => RepayApplyResp$TartarlyOPins$Item$RuralOAgentes$Item(
  name: json['name'] as String?,
  p7x1l4OAgreementNumber: json['p7x1l4'] as String?,
);

Map<String, dynamic>
_$RepayApplyResp$TartarlyOPins$Item$RuralOAgentes$ItemToJson(
  RepayApplyResp$TartarlyOPins$Item$RuralOAgentes$Item instance,
) => <String, dynamic>{
  'name': instance.name,
  'p7x1l4': instance.p7x1l4OAgreementNumber,
};

VersionCheckResp$Data$C1o9nqONewVersion
_$VersionCheckResp$Data$C1o9nqONewVersionFromJson(Map<String, dynamic> json) =>
    VersionCheckResp$Data$C1o9nqONewVersion(
      d7x52pOBizChannel: json['d7x52p'] as String?,
      lutealOVersion: json['luteal'] as String?,
      title: json['title'] as String?,
      desc: json['desc'] as String?,
      denounceODownloadUrl32: json['denounce'] as String?,
      verdictODownloadUrl64: json['verdict'] as String?,
      methinksOForced: json['methinks'] as bool?,
      gramdanOOnGp: json['gramdan'] as bool?,
    );

Map<String, dynamic> _$VersionCheckResp$Data$C1o9nqONewVersionToJson(
  VersionCheckResp$Data$C1o9nqONewVersion instance,
) => <String, dynamic>{
  'd7x52p': instance.d7x52pOBizChannel,
  'luteal': instance.lutealOVersion,
  'title': instance.title,
  'desc': instance.desc,
  'denounce': instance.denounceODownloadUrl32,
  'verdict': instance.verdictODownloadUrl64,
  'methinks': instance.methinksOForced,
  'gramdan': instance.gramdanOOnGp,
};

HomeInfoResp$PapuanOLastRecordLoan$OutdoOPlanSimpleList$Item
_$HomeInfoResp$PapuanOLastRecordLoan$OutdoOPlanSimpleList$ItemFromJson(
  Map<String, dynamic> json,
) => HomeInfoResp$PapuanOLastRecordLoan$OutdoOPlanSimpleList$Item(
  i2jk5fOPeriodStatus: (json['i2jk5f'] as num?)?.toInt(),
  r5k31qODueTime: (json['r5k31q'] as num?)?.toInt(),
  wantonlyOLoanLeftAmount: (json['wantonly'] as num?)?.toDouble(),
  ih2upqOCtPeriod: (json['ih2upq'] as num?)?.toInt(),
  spinachyOLoanPeriod: (json['spinachy'] as num?)?.toInt(),
  ez64t7OPeriodCount: (json['ez64t7'] as num?)?.toInt(),
);

Map<String, dynamic>
_$HomeInfoResp$PapuanOLastRecordLoan$OutdoOPlanSimpleList$ItemToJson(
  HomeInfoResp$PapuanOLastRecordLoan$OutdoOPlanSimpleList$Item instance,
) => <String, dynamic>{
  'i2jk5f': instance.i2jk5fOPeriodStatus,
  'r5k31q': instance.r5k31qODueTime,
  'wantonly': instance.wantonlyOLoanLeftAmount,
  'ih2upq': instance.ih2upqOCtPeriod,
  'spinachy': instance.spinachyOLoanPeriod,
  'ez64t7': instance.ez64t7OPeriodCount,
};

HomeInfoResp$Xu551uOSpareLastRecordLoan$OutdoOPlanSimpleList$Item
_$HomeInfoResp$Xu551uOSpareLastRecordLoan$OutdoOPlanSimpleList$ItemFromJson(
  Map<String, dynamic> json,
) => HomeInfoResp$Xu551uOSpareLastRecordLoan$OutdoOPlanSimpleList$Item(
  i2jk5fOPeriodStatus: (json['i2jk5f'] as num?)?.toInt(),
  r5k31qODueTime: (json['r5k31q'] as num?)?.toInt(),
  wantonlyOLoanLeftAmount: (json['wantonly'] as num?)?.toDouble(),
  ih2upqOCtPeriod: (json['ih2upq'] as num?)?.toInt(),
  spinachyOLoanPeriod: (json['spinachy'] as num?)?.toInt(),
  ez64t7OPeriodCount: (json['ez64t7'] as num?)?.toInt(),
);

Map<String, dynamic>
_$HomeInfoResp$Xu551uOSpareLastRecordLoan$OutdoOPlanSimpleList$ItemToJson(
  HomeInfoResp$Xu551uOSpareLastRecordLoan$OutdoOPlanSimpleList$Item instance,
) => <String, dynamic>{
  'i2jk5f': instance.i2jk5fOPeriodStatus,
  'r5k31q': instance.r5k31qODueTime,
  'wantonly': instance.wantonlyOLoanLeftAmount,
  'ih2upq': instance.ih2upqOCtPeriod,
  'spinachy': instance.spinachyOLoanPeriod,
  'ez64t7': instance.ez64t7OPeriodCount,
};

HomeInfoResp$LysogenOSpareProductGroup$Item$List$Item
_$HomeInfoResp$LysogenOSpareProductGroup$Item$List$ItemFromJson(
  Map<String, dynamic> json,
) => HomeInfoResp$LysogenOSpareProductGroup$Item$List$Item(
  foreyardOProductId: (json['foreyard'] as num?)?.toInt(),
  za6d92OProductName: json['za6d92'] as String?,
  b49d07OProductPeriodId: json['b49d07'] as String?,
  peddlerOPeriodCountId: json['peddler'] as String?,
  morticeOFeeTypeId: json['mortice'] as String?,
  faroucheOIsLock: json['farouche'] as bool?,
  mojr11OLoanRangeMin: (json['mojr11'] as num?)?.toDouble(),
  xuwh2oOLoanRangeMax: (json['xuwh2o'] as num?)?.toDouble(),
  marrowOLoanRangeUnit: (json['marrow'] as num?)?.toDouble(),
  newbornOSigPeriod: (json['newborn'] as num?)?.toInt(),
  elbaOSigRate: (json['elba'] as num?)?.toDouble(),
  i41lj0OProductTags: json['i41lj0'] as String?,
);

Map<String, dynamic>
_$HomeInfoResp$LysogenOSpareProductGroup$Item$List$ItemToJson(
  HomeInfoResp$LysogenOSpareProductGroup$Item$List$Item instance,
) => <String, dynamic>{
  'foreyard': instance.foreyardOProductId,
  'za6d92': instance.za6d92OProductName,
  'b49d07': instance.b49d07OProductPeriodId,
  'peddler': instance.peddlerOPeriodCountId,
  'mortice': instance.morticeOFeeTypeId,
  'farouche': instance.faroucheOIsLock,
  'mojr11': instance.mojr11OLoanRangeMin,
  'xuwh2o': instance.xuwh2oOLoanRangeMax,
  'marrow': instance.marrowOLoanRangeUnit,
  'newborn': instance.newbornOSigPeriod,
  'elba': instance.elbaOSigRate,
  'i41lj0': instance.i41lj0OProductTags,
};

LoanNoticeResp$Data$CramboOLoanNoticeList$Item
_$LoanNoticeResp$Data$CramboOLoanNoticeList$ItemFromJson(
  Map<String, dynamic> json,
) => LoanNoticeResp$Data$CramboOLoanNoticeList$Item(
  gynecoidOLoanNoticeCode: json['gynecoid'] as String?,
  pmtcwpONoticeContent: json['pmtcwp'] as String?,
);

Map<String, dynamic> _$LoanNoticeResp$Data$CramboOLoanNoticeList$ItemToJson(
  LoanNoticeResp$Data$CramboOLoanNoticeList$Item instance,
) => <String, dynamic>{
  'gynecoid': instance.gynecoidOLoanNoticeCode,
  'pmtcwp': instance.pmtcwpONoticeContent,
};

CouponPopResp$Oxmqq4OHomePopFlag$ReopposeOMapValue
_$CouponPopResp$Oxmqq4OHomePopFlag$ReopposeOMapValueFromJson(
  Map<String, dynamic> json,
) => CouponPopResp$Oxmqq4OHomePopFlag$ReopposeOMapValue(
  hash: (json['hash'] as num?)?.toInt(),
);

Map<String, dynamic> _$CouponPopResp$Oxmqq4OHomePopFlag$ReopposeOMapValueToJson(
  CouponPopResp$Oxmqq4OHomePopFlag$ReopposeOMapValue instance,
) => <String, dynamic>{'hash': instance.hash};

LoanBillResp$Ouxtd3OLoanList$Item$OutdoOPlanSimpleList$Item
_$LoanBillResp$Ouxtd3OLoanList$Item$OutdoOPlanSimpleList$ItemFromJson(
  Map<String, dynamic> json,
) => LoanBillResp$Ouxtd3OLoanList$Item$OutdoOPlanSimpleList$Item(
  i2jk5fOPeriodStatus: (json['i2jk5f'] as num?)?.toInt(),
  r5k31qODueTime: (json['r5k31q'] as num?)?.toInt(),
  wantonlyOLoanLeftAmount: (json['wantonly'] as num?)?.toDouble(),
  ih2upqOCtPeriod: (json['ih2upq'] as num?)?.toInt(),
  spinachyOLoanPeriod: (json['spinachy'] as num?)?.toInt(),
  ez64t7OPeriodCount: (json['ez64t7'] as num?)?.toInt(),
);

Map<String, dynamic>
_$LoanBillResp$Ouxtd3OLoanList$Item$OutdoOPlanSimpleList$ItemToJson(
  LoanBillResp$Ouxtd3OLoanList$Item$OutdoOPlanSimpleList$Item instance,
) => <String, dynamic>{
  'i2jk5f': instance.i2jk5fOPeriodStatus,
  'r5k31q': instance.r5k31qODueTime,
  'wantonly': instance.wantonlyOLoanLeftAmount,
  'ih2upq': instance.ih2upqOCtPeriod,
  'spinachy': instance.spinachyOLoanPeriod,
  'ez64t7': instance.ez64t7OPeriodCount,
};

TrackReportReq$BanallyOReportDevDTO$I39296OBluetooth$M3hs2zODevices$Item
_$TrackReportReq$BanallyOReportDevDTO$I39296OBluetooth$M3hs2zODevices$ItemFromJson(
  Map<String, dynamic> json,
) => TrackReportReq$BanallyOReportDevDTO$I39296OBluetooth$M3hs2zODevices$Item(
  address: json['address'] as String?,
  name: json['name'] as String?,
  type: (json['type'] as num?)?.toInt(),
);

Map<String, dynamic>
_$TrackReportReq$BanallyOReportDevDTO$I39296OBluetooth$M3hs2zODevices$ItemToJson(
  TrackReportReq$BanallyOReportDevDTO$I39296OBluetooth$M3hs2zODevices$Item
  instance,
) => <String, dynamic>{
  'address': instance.address,
  'name': instance.name,
  'type': instance.type,
};

TrackReportReq$BanallyOReportDevDTO$E3d40eOStructure$El986rOStructVersion
_$TrackReportReq$BanallyOReportDevDTO$E3d40eOStructure$El986rOStructVersionFromJson(
  Map<String, dynamic> json,
) => TrackReportReq$BanallyOReportDevDTO$E3d40eOStructure$El986rOStructVersion(
  os: json['os'] as String?,
  bussesOCodename: json['busses'] as String?,
  q8cy5mOIncremental: json['q8cy5m'] as String?,
  dinahOPreviewSdkInt: json['dinah'] as String?,
  iz962sOReleaseOrCodename: json['iz962s'] as String?,
  rochelleOSdkInt: json['rochelle'] as String?,
  qx7tskOSecurityPatch: json['qx7tsk'] as String?,
);

Map<String, dynamic>
_$TrackReportReq$BanallyOReportDevDTO$E3d40eOStructure$El986rOStructVersionToJson(
  TrackReportReq$BanallyOReportDevDTO$E3d40eOStructure$El986rOStructVersion
  instance,
) => <String, dynamic>{
  'os': instance.os,
  'busses': instance.bussesOCodename,
  'q8cy5m': instance.q8cy5mOIncremental,
  'dinah': instance.dinahOPreviewSdkInt,
  'iz962s': instance.iz962sOReleaseOrCodename,
  'rochelle': instance.rochelleOSdkInt,
  'qx7tsk': instance.qx7tskOSecurityPatch,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Lq1s05OFirstName
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Lq1s05OFirstNameFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Lq1s05OFirstName(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Lq1s05OFirstNameToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Lq1s05OFirstName
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$DarktownOLastName
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$DarktownOLastNameFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$DarktownOLastName(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$DarktownOLastNameToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$DarktownOLastName
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Gender
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$GenderFromJson(
  Map<String, dynamic> json,
) => RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Gender(
  torlj8OIsShow: json['torlj8'] as bool?,
  d392w8OIsEnforce: json['d392w8'] as bool?,
);

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$GenderToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Gender
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$MerdekaOIdCard
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$MerdekaOIdCardFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$MerdekaOIdCard(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$MerdekaOIdCardToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$MerdekaOIdCard
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$GargetOBirthday
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$GargetOBirthdayFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$GargetOBirthday(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$GargetOBirthdayToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$GargetOBirthday
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$F31u3kOEmail
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$F31u3kOEmailFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$F31u3kOEmail(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$F31u3kOEmailToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$F31u3kOEmail
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$X1iu04OOtherMobile
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$X1iu04OOtherMobileFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$X1iu04OOtherMobile(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$X1iu04OOtherMobileToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$X1iu04OOtherMobile
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$CoseOEducation
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$CoseOEducationFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$CoseOEducation(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$CoseOEducationToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$CoseOEducation
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$M2wx4tOMaritalStatus
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$M2wx4tOMaritalStatusFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$M2wx4tOMaritalStatus(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$M2wx4tOMaritalStatusToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$M2wx4tOMaritalStatus
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$ChaffyOHouseStatus
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$ChaffyOHouseStatusFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$ChaffyOHouseStatus(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$ChaffyOHouseStatusToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$ChaffyOHouseStatus
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Bja8s5OElectricityBill
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Bja8s5OElectricityBillFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Bja8s5OElectricityBill(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Bja8s5OElectricityBillToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Bja8s5OElectricityBill
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$VolumenOElectricityRelated
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$VolumenOElectricityRelatedFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$VolumenOElectricityRelated(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$VolumenOElectricityRelatedToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$VolumenOElectricityRelated
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$SpadicesOAddressState
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$SpadicesOAddressStateFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$SpadicesOAddressState(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$SpadicesOAddressStateToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$SpadicesOAddressState
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$GasconyOAddressCity
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$GasconyOAddressCityFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$GasconyOAddressCity(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$GasconyOAddressCityToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$GasconyOAddressCity
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$CraalOAddressDetail
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$CraalOAddressDetailFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$CraalOAddressDetail(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$CraalOAddressDetailToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$CraalOAddressDetail
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$HimfjuOOtherLoans
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$HimfjuOOtherLoansFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$HimfjuOOtherLoans(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$HimfjuOOtherLoansToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$HimfjuOOtherLoans
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$DiopsideOOccupation
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$DiopsideOOccupationFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$DiopsideOOccupation(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$DiopsideOOccupationToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$DiopsideOOccupation
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$LimpidlyOIncomeLevel
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$LimpidlyOIncomeLevelFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$LimpidlyOIncomeLevel(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$LimpidlyOIncomeLevelToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$LimpidlyOIncomeLevel
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Z4s937OHouseholdMonthlyExpenses
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Z4s937OHouseholdMonthlyExpensesFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Z4s937OHouseholdMonthlyExpenses(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Z4s937OHouseholdMonthlyExpensesToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Z4s937OHouseholdMonthlyExpenses
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Expenditure
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$ExpenditureFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Expenditure(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$ExpenditureToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$Expenditure
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$AlloOWorkingYears
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$AlloOWorkingYearsFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$AlloOWorkingYears(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$AlloOWorkingYearsToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$AlloOWorkingYears
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$B1417wOPayPeriod
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$B1417wOPayPeriodFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$B1417wOPayPeriod(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$B1417wOPayPeriodToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$B1417wOPayPeriod
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$R67p23OPayday
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$R67p23OPaydayFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$R67p23OPayday(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$R67p23OPaydayToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$R67p23OPayday
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$PlenishOSecondPayday
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$PlenishOSecondPaydayFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$PlenishOSecondPayday(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$PlenishOSecondPaydayToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$PlenishOSecondPayday
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$GrippleOFirstContactName
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$GrippleOFirstContactNameFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$GrippleOFirstContactName(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$GrippleOFirstContactNameToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$GrippleOFirstContactName
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$RainOFirstContactMobile
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$RainOFirstContactMobileFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$RainOFirstContactMobile(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$RainOFirstContactMobileToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$RainOFirstContactMobile
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$BaryeOFirstContactRelationship
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$BaryeOFirstContactRelationshipFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$BaryeOFirstContactRelationship(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$BaryeOFirstContactRelationshipToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$BaryeOFirstContactRelationship
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$AquarianOSecondContactName
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$AquarianOSecondContactNameFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$AquarianOSecondContactName(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$AquarianOSecondContactNameToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$AquarianOSecondContactName
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$H3d2wfOSecondContactMobile
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$H3d2wfOSecondContactMobileFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$H3d2wfOSecondContactMobile(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$H3d2wfOSecondContactMobileToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$H3d2wfOSecondContactMobile
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};

RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$KibeOSecondContactRelationship
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$KibeOSecondContactRelationshipFromJson(
  Map<String, dynamic> json,
) =>
    RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$KibeOSecondContactRelationship(
      torlj8OIsShow: json['torlj8'] as bool?,
      d392w8OIsEnforce: json['d392w8'] as bool?,
    );

Map<String, dynamic>
_$RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$KibeOSecondContactRelationshipToJson(
  RiskReportResp$ZdzsepOVerificationConfig$U7yl7cOItemsDisplayConfig$KibeOSecondContactRelationship
  instance,
) => <String, dynamic>{
  'torlj8': instance.torlj8OIsShow,
  'd392w8': instance.d392w8OIsEnforce,
};
