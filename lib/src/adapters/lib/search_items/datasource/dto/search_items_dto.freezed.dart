// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_items_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchItemsDto _$SearchItemsDtoFromJson(Map<String, dynamic> json) {
  return _SearchItemsDto.fromJson(json);
}

/// @nodoc
mixin _$SearchItemsDto {
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchItemsDtoCopyWith<SearchItemsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchItemsDtoCopyWith<$Res> {
  factory $SearchItemsDtoCopyWith(
          SearchItemsDto value, $Res Function(SearchItemsDto) then) =
      _$SearchItemsDtoCopyWithImpl<$Res, SearchItemsDto>;
  @useResult
  $Res call({String title, String subtitle, String imageUrl});
}

/// @nodoc
class _$SearchItemsDtoCopyWithImpl<$Res, $Val extends SearchItemsDto>
    implements $SearchItemsDtoCopyWith<$Res> {
  _$SearchItemsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchItemsDtoImplCopyWith<$Res>
    implements $SearchItemsDtoCopyWith<$Res> {
  factory _$$SearchItemsDtoImplCopyWith(_$SearchItemsDtoImpl value,
          $Res Function(_$SearchItemsDtoImpl) then) =
      __$$SearchItemsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String subtitle, String imageUrl});
}

/// @nodoc
class __$$SearchItemsDtoImplCopyWithImpl<$Res>
    extends _$SearchItemsDtoCopyWithImpl<$Res, _$SearchItemsDtoImpl>
    implements _$$SearchItemsDtoImplCopyWith<$Res> {
  __$$SearchItemsDtoImplCopyWithImpl(
      _$SearchItemsDtoImpl _value, $Res Function(_$SearchItemsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? imageUrl = null,
  }) {
    return _then(_$SearchItemsDtoImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchItemsDtoImpl implements _SearchItemsDto {
  const _$SearchItemsDtoImpl(
      {required this.title, required this.subtitle, required this.imageUrl});

  factory _$SearchItemsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchItemsDtoImplFromJson(json);

  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'SearchItemsDto(title: $title, subtitle: $subtitle, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchItemsDtoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchItemsDtoImplCopyWith<_$SearchItemsDtoImpl> get copyWith =>
      __$$SearchItemsDtoImplCopyWithImpl<_$SearchItemsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchItemsDtoImplToJson(
      this,
    );
  }
}

abstract class _SearchItemsDto implements SearchItemsDto {
  const factory _SearchItemsDto(
      {required final String title,
      required final String subtitle,
      required final String imageUrl}) = _$SearchItemsDtoImpl;

  factory _SearchItemsDto.fromJson(Map<String, dynamic> json) =
      _$SearchItemsDtoImpl.fromJson;

  @override
  String get title;
  @override
  String get subtitle;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$SearchItemsDtoImplCopyWith<_$SearchItemsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
