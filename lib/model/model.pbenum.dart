//
//  Generated code. Do not modify.
//  source: smelovsky/proto/model.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GGender extends $pb.ProtobufEnum {
  static const GGender G_GENDER_MALE = GGender._(0, _omitEnumNames ? '' : 'G_GENDER_MALE');
  static const GGender G_GENDER_FEMALE = GGender._(1, _omitEnumNames ? '' : 'G_GENDER_FEMALE');

  static const $core.List<GGender> values = <GGender> [
    G_GENDER_MALE,
    G_GENDER_FEMALE,
  ];

  static final $core.Map<$core.int, GGender> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GGender? valueOf($core.int value) => _byValue[value];

  const GGender._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
