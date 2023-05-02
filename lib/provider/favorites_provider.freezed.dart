// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavNewsState {
  List<Map<String, bool>> get favorites =>
      throw _privateConstructorUsedError; // List<Map<newsUid, like>>
  dynamic get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavNewsStateCopyWith<FavNewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavNewsStateCopyWith<$Res> {
  factory $FavNewsStateCopyWith(
          FavNewsState value, $Res Function(FavNewsState) then) =
      _$FavNewsStateCopyWithImpl<$Res, FavNewsState>;
  @useResult
  $Res call({List<Map<String, bool>> favorites, dynamic isLoading});
}

/// @nodoc
class _$FavNewsStateCopyWithImpl<$Res, $Val extends FavNewsState>
    implements $FavNewsStateCopyWith<$Res> {
  _$FavNewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favorites = null,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      favorites: null == favorites
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<Map<String, bool>>,
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavNewsStateCopyWith<$Res>
    implements $FavNewsStateCopyWith<$Res> {
  factory _$$_FavNewsStateCopyWith(
          _$_FavNewsState value, $Res Function(_$_FavNewsState) then) =
      __$$_FavNewsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Map<String, bool>> favorites, dynamic isLoading});
}

/// @nodoc
class __$$_FavNewsStateCopyWithImpl<$Res>
    extends _$FavNewsStateCopyWithImpl<$Res, _$_FavNewsState>
    implements _$$_FavNewsStateCopyWith<$Res> {
  __$$_FavNewsStateCopyWithImpl(
      _$_FavNewsState _value, $Res Function(_$_FavNewsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favorites = null,
    Object? isLoading = freezed,
  }) {
    return _then(_$_FavNewsState(
      favorites: null == favorites
          ? _value._favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<Map<String, bool>>,
      isLoading: freezed == isLoading ? _value.isLoading! : isLoading,
    ));
  }
}

/// @nodoc

class _$_FavNewsState extends _FavNewsState with DiagnosticableTreeMixin {
  const _$_FavNewsState(
      {final List<Map<String, bool>> favorites = const [],
      this.isLoading = true})
      : _favorites = favorites,
        super._();

  final List<Map<String, bool>> _favorites;
  @override
  @JsonKey()
  List<Map<String, bool>> get favorites {
    if (_favorites is EqualUnmodifiableListView) return _favorites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favorites);
  }

// List<Map<newsUid, like>>
  @override
  @JsonKey()
  final dynamic isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FavNewsState(favorites: $favorites, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FavNewsState'))
      ..add(DiagnosticsProperty('favorites', favorites))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavNewsState &&
            const DeepCollectionEquality()
                .equals(other._favorites, _favorites) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_favorites),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavNewsStateCopyWith<_$_FavNewsState> get copyWith =>
      __$$_FavNewsStateCopyWithImpl<_$_FavNewsState>(this, _$identity);
}

abstract class _FavNewsState extends FavNewsState {
  const factory _FavNewsState(
      {final List<Map<String, bool>> favorites,
      final dynamic isLoading}) = _$_FavNewsState;
  const _FavNewsState._() : super._();

  @override
  List<Map<String, bool>> get favorites;
  @override // List<Map<newsUid, like>>
  dynamic get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_FavNewsStateCopyWith<_$_FavNewsState> get copyWith =>
      throw _privateConstructorUsedError;
}
