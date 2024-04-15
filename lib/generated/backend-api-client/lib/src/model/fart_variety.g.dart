// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fart_variety.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const FartVariety _$toot = const FartVariety._('toot');
const FartVariety _$brap = const FartVariety._('brap');
const FartVariety _$thrrrrp = const FartVariety._('thrrrrp');
const FartVariety _$BWOMPFF = const FartVariety._('BWOMPFF');
const FartVariety _$BLART = const FartVariety._('BLART');
const FartVariety _$shart = const FartVariety._('shart');

FartVariety _$valueOf(String name) {
  switch (name) {
    case 'toot':
      return _$toot;
    case 'brap':
      return _$brap;
    case 'thrrrrp':
      return _$thrrrrp;
    case 'BWOMPFF':
      return _$BWOMPFF;
    case 'BLART':
      return _$BLART;
    case 'shart':
      return _$shart;
    default:
      return _$shart;
  }
}

final BuiltSet<FartVariety> _$values =
    new BuiltSet<FartVariety>(const <FartVariety>[
  _$toot,
  _$brap,
  _$thrrrrp,
  _$BWOMPFF,
  _$BLART,
  _$shart,
]);

class _$FartVarietyMeta {
  const _$FartVarietyMeta();
  FartVariety get toot => _$toot;
  FartVariety get brap => _$brap;
  FartVariety get thrrrrp => _$thrrrrp;
  FartVariety get BWOMPFF => _$BWOMPFF;
  FartVariety get BLART => _$BLART;
  FartVariety get shart => _$shart;
  FartVariety valueOf(String name) => _$valueOf(name);
  BuiltSet<FartVariety> get values => _$values;
}

abstract class _$FartVarietyMixin {
  // ignore: non_constant_identifier_names
  _$FartVarietyMeta get FartVariety => const _$FartVarietyMeta();
}

Serializer<FartVariety> _$fartVarietySerializer = new _$FartVarietySerializer();

class _$FartVarietySerializer implements PrimitiveSerializer<FartVariety> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'toot': 'Toot',
    'brap': 'Brap',
    'thrrrrp': 'thrrrrp',
    'BWOMPFF': 'BWOMPFF',
    'BLART': 'BLART',
    'shart': 'Shart',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Toot': 'toot',
    'Brap': 'brap',
    'thrrrrp': 'thrrrrp',
    'BWOMPFF': 'BWOMPFF',
    'BLART': 'BLART',
    'Shart': 'shart',
  };

  @override
  final Iterable<Type> types = const <Type>[FartVariety];
  @override
  final String wireName = 'FartVariety';

  @override
  Object serialize(Serializers serializers, FartVariety object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  FartVariety deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      FartVariety.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
