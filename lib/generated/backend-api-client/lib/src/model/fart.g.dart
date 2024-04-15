// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fart.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Fart extends Fart {
  @override
  final String owner;
  @override
  final int smellLevel;
  @override
  final FartVariety variety;

  factory _$Fart([void Function(FartBuilder)? updates]) =>
      (new FartBuilder()..update(updates))._build();

  _$Fart._(
      {required this.owner, required this.smellLevel, required this.variety})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(owner, r'Fart', 'owner');
    BuiltValueNullFieldError.checkNotNull(smellLevel, r'Fart', 'smellLevel');
    BuiltValueNullFieldError.checkNotNull(variety, r'Fart', 'variety');
  }

  @override
  Fart rebuild(void Function(FartBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FartBuilder toBuilder() => new FartBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Fart &&
        owner == other.owner &&
        smellLevel == other.smellLevel &&
        variety == other.variety;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, owner.hashCode);
    _$hash = $jc(_$hash, smellLevel.hashCode);
    _$hash = $jc(_$hash, variety.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Fart')
          ..add('owner', owner)
          ..add('smellLevel', smellLevel)
          ..add('variety', variety))
        .toString();
  }
}

class FartBuilder implements Builder<Fart, FartBuilder> {
  _$Fart? _$v;

  String? _owner;
  String? get owner => _$this._owner;
  set owner(String? owner) => _$this._owner = owner;

  int? _smellLevel;
  int? get smellLevel => _$this._smellLevel;
  set smellLevel(int? smellLevel) => _$this._smellLevel = smellLevel;

  FartVariety? _variety;
  FartVariety? get variety => _$this._variety;
  set variety(FartVariety? variety) => _$this._variety = variety;

  FartBuilder() {
    Fart._defaults(this);
  }

  FartBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _owner = $v.owner;
      _smellLevel = $v.smellLevel;
      _variety = $v.variety;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Fart other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Fart;
  }

  @override
  void update(void Function(FartBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Fart build() => _build();

  _$Fart _build() {
    final _$result = _$v ??
        new _$Fart._(
            owner:
                BuiltValueNullFieldError.checkNotNull(owner, r'Fart', 'owner'),
            smellLevel: BuiltValueNullFieldError.checkNotNull(
                smellLevel, r'Fart', 'smellLevel'),
            variety: BuiltValueNullFieldError.checkNotNull(
                variety, r'Fart', 'variety'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
