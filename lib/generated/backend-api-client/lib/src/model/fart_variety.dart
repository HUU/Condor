//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'fart_variety.g.dart';

class FartVariety extends EnumClass {
  @BuiltValueEnumConst(wireName: r'Toooot')
  static const FartVariety toooot = _$toooot;
  @BuiltValueEnumConst(wireName: r'Brap')
  static const FartVariety brap = _$brap;
  @BuiltValueEnumConst(wireName: r'thrrrrp')
  static const FartVariety thrrrrp = _$thrrrrp;
  @BuiltValueEnumConst(wireName: r'BWOMPFF')
  static const FartVariety BWOMPFF = _$BWOMPFF;
  @BuiltValueEnumConst(wireName: r'BLART')
  static const FartVariety BLART = _$BLART;
  @BuiltValueEnumConst(wireName: r'Shart', fallback: true)
  static const FartVariety shart = _$shart;

  static Serializer<FartVariety> get serializer => _$fartVarietySerializer;

  const FartVariety._(String name) : super(name);

  static BuiltSet<FartVariety> get values => _$values;
  static FartVariety valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class FartVarietyMixin = Object with _$FartVarietyMixin;
