// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foobar_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FoobarResponse extends FoobarResponse {
  @override
  final String message;
  @override
  final BuiltList<Fart> farts;

  factory _$FoobarResponse([void Function(FoobarResponseBuilder)? updates]) =>
      (new FoobarResponseBuilder()..update(updates))._build();

  _$FoobarResponse._({required this.message, required this.farts}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, r'FoobarResponse', 'message');
    BuiltValueNullFieldError.checkNotNull(farts, r'FoobarResponse', 'farts');
  }

  @override
  FoobarResponse rebuild(void Function(FoobarResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoobarResponseBuilder toBuilder() =>
      new FoobarResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoobarResponse &&
        message == other.message &&
        farts == other.farts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, farts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FoobarResponse')
          ..add('message', message)
          ..add('farts', farts))
        .toString();
  }
}

class FoobarResponseBuilder
    implements Builder<FoobarResponse, FoobarResponseBuilder> {
  _$FoobarResponse? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<Fart>? _farts;
  ListBuilder<Fart> get farts => _$this._farts ??= new ListBuilder<Fart>();
  set farts(ListBuilder<Fart>? farts) => _$this._farts = farts;

  FoobarResponseBuilder() {
    FoobarResponse._defaults(this);
  }

  FoobarResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _farts = $v.farts.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoobarResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FoobarResponse;
  }

  @override
  void update(void Function(FoobarResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FoobarResponse build() => _build();

  _$FoobarResponse _build() {
    _$FoobarResponse _$result;
    try {
      _$result = _$v ??
          new _$FoobarResponse._(
              message: BuiltValueNullFieldError.checkNotNull(
                  message, r'FoobarResponse', 'message'),
              farts: farts.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'farts';
        farts.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FoobarResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
