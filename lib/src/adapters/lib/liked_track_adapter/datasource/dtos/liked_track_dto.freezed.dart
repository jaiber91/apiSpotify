// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liked_track_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LikedTrackDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get artist => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String? get previewUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LikedTrackDtoCopyWith<LikedTrackDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikedTrackDtoCopyWith<$Res> {
  factory $LikedTrackDtoCopyWith(
          LikedTrackDto value, $Res Function(LikedTrackDto) then) =
      _$LikedTrackDtoCopyWithImpl<$Res, LikedTrackDto>;
  @useResult
  $Res call(
      {String id,
      String name,
      String artist,
      String imageUrl,
      String? previewUrl});
}

/// @nodoc
class _$LikedTrackDtoCopyWithImpl<$Res, $Val extends LikedTrackDto>
    implements $LikedTrackDtoCopyWith<$Res> {
  _$LikedTrackDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? artist = null,
    Object? imageUrl = null,
    Object? previewUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      previewUrl: freezed == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LikedTrackDtoImplCopyWith<$Res>
    implements $LikedTrackDtoCopyWith<$Res> {
  factory _$$LikedTrackDtoImplCopyWith(
          _$LikedTrackDtoImpl value, $Res Function(_$LikedTrackDtoImpl) then) =
      __$$LikedTrackDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String artist,
      String imageUrl,
      String? previewUrl});
}

/// @nodoc
class __$$LikedTrackDtoImplCopyWithImpl<$Res>
    extends _$LikedTrackDtoCopyWithImpl<$Res, _$LikedTrackDtoImpl>
    implements _$$LikedTrackDtoImplCopyWith<$Res> {
  __$$LikedTrackDtoImplCopyWithImpl(
      _$LikedTrackDtoImpl _value, $Res Function(_$LikedTrackDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? artist = null,
    Object? imageUrl = null,
    Object? previewUrl = freezed,
  }) {
    return _then(_$LikedTrackDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      previewUrl: freezed == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LikedTrackDtoImpl implements _LikedTrackDto {
  const _$LikedTrackDtoImpl(
      {required this.id,
      required this.name,
      required this.artist,
      required this.imageUrl,
      this.previewUrl});

  @override
  final String id;
  @override
  final String name;
  @override
  final String artist;
  @override
  final String imageUrl;
  @override
  final String? previewUrl;

  @override
  String toString() {
    return 'LikedTrackDto(id: $id, name: $name, artist: $artist, imageUrl: $imageUrl, previewUrl: $previewUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikedTrackDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.previewUrl, previewUrl) ||
                other.previewUrl == previewUrl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, artist, imageUrl, previewUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikedTrackDtoImplCopyWith<_$LikedTrackDtoImpl> get copyWith =>
      __$$LikedTrackDtoImplCopyWithImpl<_$LikedTrackDtoImpl>(this, _$identity);
}

abstract class _LikedTrackDto implements LikedTrackDto {
  const factory _LikedTrackDto(
      {required final String id,
      required final String name,
      required final String artist,
      required final String imageUrl,
      final String? previewUrl}) = _$LikedTrackDtoImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get artist;
  @override
  String get imageUrl;
  @override
  String? get previewUrl;
  @override
  @JsonKey(ignore: true)
  _$$LikedTrackDtoImplCopyWith<_$LikedTrackDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
