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

/// @nodoc
mixin _$SearchItemsDto {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

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
  $Res call(
      {String id, String title, String subtitle, String imageUrl, String type});
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
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
    Object? imageUrl = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
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
  $Res call(
      {String id, String title, String subtitle, String imageUrl, String type});
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
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
    Object? imageUrl = null,
    Object? type = null,
  }) {
    return _then(_$SearchItemsDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchItemsDtoImpl implements _SearchItemsDto {
  const _$SearchItemsDtoImpl(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.imageUrl,
      required this.type});

  @override
  final String id;
  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String imageUrl;
  @override
  final String type;

  @override
  String toString() {
    return 'SearchItemsDto(id: $id, title: $title, subtitle: $subtitle, imageUrl: $imageUrl, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchItemsDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, subtitle, imageUrl, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchItemsDtoImplCopyWith<_$SearchItemsDtoImpl> get copyWith =>
      __$$SearchItemsDtoImplCopyWithImpl<_$SearchItemsDtoImpl>(
          this, _$identity);
}

abstract class _SearchItemsDto implements SearchItemsDto {
  const factory _SearchItemsDto(
      {required final String id,
      required final String title,
      required final String subtitle,
      required final String imageUrl,
      required final String type}) = _$SearchItemsDtoImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  String get subtitle;
  @override
  String get imageUrl;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$SearchItemsDtoImplCopyWith<_$SearchItemsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
