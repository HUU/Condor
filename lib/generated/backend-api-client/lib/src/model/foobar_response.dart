//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:backend_api_client/src/model/fart.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'foobar_response.g.dart';

/// FoobarResponse
///
/// Properties:
/// * [message]
/// * [farts]
@BuiltValue()
abstract class FoobarResponse
    implements Built<FoobarResponse, FoobarResponseBuilder> {
  @BuiltValueField(wireName: r'message')
  String get message;

  @BuiltValueField(wireName: r'farts')
  BuiltList<Fart> get farts;

  FoobarResponse._();

  factory FoobarResponse([void updates(FoobarResponseBuilder b)]) =
      _$FoobarResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FoobarResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FoobarResponse> get serializer =>
      _$FoobarResponseSerializer();
}

class _$FoobarResponseSerializer
    implements PrimitiveSerializer<FoobarResponse> {
  @override
  final Iterable<Type> types = const [FoobarResponse, _$FoobarResponse];

  @override
  final String wireName = r'FoobarResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FoobarResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'message';
    yield serializers.serialize(
      object.message,
      specifiedType: const FullType(String),
    );
    yield r'farts';
    yield serializers.serialize(
      object.farts,
      specifiedType: const FullType(BuiltList, [FullType(Fart)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    FoobarResponse object, {
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
    required FoobarResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        case r'farts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Fart)]),
          ) as BuiltList<Fart>;
          result.farts.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  FoobarResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FoobarResponseBuilder();
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
