// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForumNewsState {
  Map<String, Map<String, String>> get newsContent =>
      throw _privateConstructorUsedError; // Map<newUid, Map<title, String>>
  Map<String, Map<String, List<String>>> get comments =>
      throw _privateConstructorUsedError; // Map<newsUid, Map<name, comments>>
  Map<String, int> get likes =>
      throw _privateConstructorUsedError; // Map<newsUid, numberOfLikes>
  dynamic get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForumNewsStateCopyWith<ForumNewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumNewsStateCopyWith<$Res> {
  factory $ForumNewsStateCopyWith(
          ForumNewsState value, $Res Function(ForumNewsState) then) =
      _$ForumNewsStateCopyWithImpl<$Res, ForumNewsState>;
  @useResult
  $Res call(
      {Map<String, Map<String, String>> newsContent,
      Map<String, Map<String, List<String>>> comments,
      Map<String, int> likes,
      dynamic isLoading});
}

/// @nodoc
class _$ForumNewsStateCopyWithImpl<$Res, $Val extends ForumNewsState>
    implements $ForumNewsStateCopyWith<$Res> {
  _$ForumNewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newsContent = null,
    Object? comments = null,
    Object? likes = null,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      newsContent: null == newsContent
          ? _value.newsContent
          : newsContent // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, String>>,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, List<String>>>,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ForumNewsStateCopyWith<$Res>
    implements $ForumNewsStateCopyWith<$Res> {
  factory _$$_ForumNewsStateCopyWith(
          _$_ForumNewsState value, $Res Function(_$_ForumNewsState) then) =
      __$$_ForumNewsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, Map<String, String>> newsContent,
      Map<String, Map<String, List<String>>> comments,
      Map<String, int> likes,
      dynamic isLoading});
}

/// @nodoc
class __$$_ForumNewsStateCopyWithImpl<$Res>
    extends _$ForumNewsStateCopyWithImpl<$Res, _$_ForumNewsState>
    implements _$$_ForumNewsStateCopyWith<$Res> {
  __$$_ForumNewsStateCopyWithImpl(
      _$_ForumNewsState _value, $Res Function(_$_ForumNewsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newsContent = null,
    Object? comments = null,
    Object? likes = null,
    Object? isLoading = freezed,
  }) {
    return _then(_$_ForumNewsState(
      newsContent: null == newsContent
          ? _value._newsContent
          : newsContent // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, String>>,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, List<String>>>,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      isLoading: freezed == isLoading ? _value.isLoading! : isLoading,
    ));
  }
}

/// @nodoc

class _$_ForumNewsState extends _ForumNewsState with DiagnosticableTreeMixin {
  const _$_ForumNewsState(
      {final Map<String, Map<String, String>> newsContent = const {},
      final Map<String, Map<String, List<String>>> comments = const {},
      final Map<String, int> likes = const {},
      this.isLoading = true})
      : _newsContent = newsContent,
        _comments = comments,
        _likes = likes,
        super._();

  final Map<String, Map<String, String>> _newsContent;
  @override
  @JsonKey()
  Map<String, Map<String, String>> get newsContent {
    if (_newsContent is EqualUnmodifiableMapView) return _newsContent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_newsContent);
  }

// Map<newUid, Map<title, String>>
  final Map<String, Map<String, List<String>>> _comments;
// Map<newUid, Map<title, String>>
  @override
  @JsonKey()
  Map<String, Map<String, List<String>>> get comments {
    if (_comments is EqualUnmodifiableMapView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_comments);
  }

// Map<newsUid, Map<name, comments>>
  final Map<String, int> _likes;
// Map<newsUid, Map<name, comments>>
  @override
  @JsonKey()
  Map<String, int> get likes {
    if (_likes is EqualUnmodifiableMapView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_likes);
  }

// Map<newsUid, numberOfLikes>
  @override
  @JsonKey()
  final dynamic isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForumNewsState(newsContent: $newsContent, comments: $comments, likes: $likes, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForumNewsState'))
      ..add(DiagnosticsProperty('newsContent', newsContent))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('likes', likes))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForumNewsState &&
            const DeepCollectionEquality()
                .equals(other._newsContent, _newsContent) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            const DeepCollectionEquality().equals(other._likes, _likes) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_newsContent),
      const DeepCollectionEquality().hash(_comments),
      const DeepCollectionEquality().hash(_likes),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForumNewsStateCopyWith<_$_ForumNewsState> get copyWith =>
      __$$_ForumNewsStateCopyWithImpl<_$_ForumNewsState>(this, _$identity);
}

abstract class _ForumNewsState extends ForumNewsState {
  const factory _ForumNewsState(
      {final Map<String, Map<String, String>> newsContent,
      final Map<String, Map<String, List<String>>> comments,
      final Map<String, int> likes,
      final dynamic isLoading}) = _$_ForumNewsState;
  const _ForumNewsState._() : super._();

  @override
  Map<String, Map<String, String>> get newsContent;
  @override // Map<newUid, Map<title, String>>
  Map<String, Map<String, List<String>>> get comments;
  @override // Map<newsUid, Map<name, comments>>
  Map<String, int> get likes;
  @override // Map<newsUid, numberOfLikes>
  dynamic get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_ForumNewsStateCopyWith<_$_ForumNewsState> get copyWith =>
      throw _privateConstructorUsedError;
}
