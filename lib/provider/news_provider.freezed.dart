// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewsState {
  List<NewsPreview> get news => throw _privateConstructorUsedError;
  dynamic get isLoading => throw _privateConstructorUsedError;
  dynamic get favoritesOnlyFlag => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsStateCopyWith<NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res, NewsState>;
  @useResult
  $Res call(
      {List<NewsPreview> news, dynamic isLoading, dynamic favoritesOnlyFlag});
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res, $Val extends NewsState>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = null,
    Object? isLoading = freezed,
    Object? favoritesOnlyFlag = freezed,
  }) {
    return _then(_value.copyWith(
      news: null == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as List<NewsPreview>,
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      favoritesOnlyFlag: freezed == favoritesOnlyFlag
          ? _value.favoritesOnlyFlag
          : favoritesOnlyFlag // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewsStateCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory _$$_NewsStateCopyWith(
          _$_NewsState value, $Res Function(_$_NewsState) then) =
      __$$_NewsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<NewsPreview> news, dynamic isLoading, dynamic favoritesOnlyFlag});
}

/// @nodoc
class __$$_NewsStateCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$_NewsState>
    implements _$$_NewsStateCopyWith<$Res> {
  __$$_NewsStateCopyWithImpl(
      _$_NewsState _value, $Res Function(_$_NewsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = null,
    Object? isLoading = freezed,
    Object? favoritesOnlyFlag = freezed,
  }) {
    return _then(_$_NewsState(
      news: null == news
          ? _value._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<NewsPreview>,
      isLoading: freezed == isLoading ? _value.isLoading! : isLoading,
      favoritesOnlyFlag: freezed == favoritesOnlyFlag
          ? _value.favoritesOnlyFlag!
          : favoritesOnlyFlag,
    ));
  }
}

/// @nodoc

class _$_NewsState extends _NewsState {
  const _$_NewsState(
      {final List<NewsPreview> news = const [],
      this.isLoading = true,
      this.favoritesOnlyFlag = false})
      : _news = news,
        super._();

  final List<NewsPreview> _news;
  @override
  @JsonKey()
  List<NewsPreview> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  @override
  @JsonKey()
  final dynamic isLoading;
  @override
  @JsonKey()
  final dynamic favoritesOnlyFlag;

  @override
  String toString() {
    return 'NewsState(news: $news, isLoading: $isLoading, favoritesOnlyFlag: $favoritesOnlyFlag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsState &&
            const DeepCollectionEquality().equals(other._news, _news) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.favoritesOnlyFlag, favoritesOnlyFlag));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_news),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(favoritesOnlyFlag));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsStateCopyWith<_$_NewsState> get copyWith =>
      __$$_NewsStateCopyWithImpl<_$_NewsState>(this, _$identity);
}

abstract class _NewsState extends NewsState {
  const factory _NewsState(
      {final List<NewsPreview> news,
      final dynamic isLoading,
      final dynamic favoritesOnlyFlag}) = _$_NewsState;
  const _NewsState._() : super._();

  @override
  List<NewsPreview> get news;
  @override
  dynamic get isLoading;
  @override
  dynamic get favoritesOnlyFlag;
  @override
  @JsonKey(ignore: true)
  _$$_NewsStateCopyWith<_$_NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}
