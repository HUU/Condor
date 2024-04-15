//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:backend_api_client/src/model/fart_variety.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'fart.g.dart';

/// Fart
///
/// Properties:
/// * [owner]
/// * [smellLevel]
/// * [variety]
@BuiltValue()
abstract class Fart implements Built<Fart, FartBuilder> {
  @BuiltValueField(wireName: r'owner')
  String get owner;

  @BuiltValueField(wireName: r'smell_level')
  int get smellLevel;

  @BuiltValueField(wireName: r'variety')
  FartVariety get variety;
  // enum varietyEnum {  Toooot,  Brap,  thrrrrp,  BWOMPFF,  BLART,  Shart,  };

  Fart._();

  factory Fart([void updates(FartBuilder b)]) = _$Fart;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FartBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Fart> get serializer => _$FartSerializer();
}

class _$FartSerializer implements PrimitiveSerializer<Fart> {
  @override
  final Iterable<Type> types = const [Fart, _$Fart];

  @override
  final String wireName = r'Fart';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Fart object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'owner';
    yield serializers.serialize(
      object.owner,
      specifiedType: const FullType(String),
    );
    yield r'smell_level';
    yield serializers.serialize(
      object.smellLevel,
      specifiedType: const FullType(int),
    );
    yield r'variety';
    yield serializers.serialize(
      object.variety,
      specifiedType: const FullType(FartVariety),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    Fart object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required FartBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'owner':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.owner = valueDes;
          break;
        case r'smell_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.smellLevel = valueDes;
          break;
        case r'variety':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(FartVariety),
          ) as FartVariety;
          result.variety = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Fart deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FartBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
