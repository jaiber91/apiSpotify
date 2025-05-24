// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_university_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListUniversityDto _$ListUniversityDtoFromJson(Map<String, dynamic> json) {
  return _ListUniversityDto.fromJson(json);
}

/// @nodoc
mixin _$ListUniversityDto {
  @JsonKey(name: 'alpha_two_code')
  String get alphaTwoCode => throw _privateConstructorUsedError;
  List<String> get domains => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'state-province')
  String? get stateProvince => throw _privateConstructorUsedError;
  @JsonKey(name: 'web_pages')
  List<String> get webPages => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListUniversityDtoCopyWith<ListUniversityDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListUniversityDtoCopyWith<$Res> {
  factory $ListUniversityDtoCopyWith(
          ListUniversityDto value, $Res Function(ListUniversityDto) then) =
      _$ListUniversityDtoCopyWithImpl<$Res, ListUniversityDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'alpha_two_code') String alphaTwoCode,
      List<String> domains,
      String country,
      @JsonKey(name: 'state-province') String? stateProvince,
      @JsonKey(name: 'web_pages') List<String> webPages,
      String name});
}

/// @nodoc
class _$ListUniversityDtoCopyWithImpl<$Res, $Val extends ListUniversityDto>
    implements $ListUniversityDtoCopyWith<$Res> {
  _$ListUniversityDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alphaTwoCode = null,
    Object? domains = null,
    Object? country = null,
    Object? stateProvince = freezed,
    Object? webPages = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      alphaTwoCode: null == alphaTwoCode
          ? _value.alphaTwoCode
          : alphaTwoCode // ignore: cast_nullable_to_non_nullable
              as String,
      domains: null == domains
          ? _value.domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<String>,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      stateProvince: freezed == stateProvince
          ? _value.stateProvince
          : stateProvince // ignore: cast_nullable_to_non_nullable
              as String?,
      webPages: null == webPages
          ? _value.webPages
          : webPages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListUniversityDtoImplCopyWith<$Res>
    implements $ListUniversityDtoCopyWith<$Res> {
  factory _$$ListUniversityDtoImplCopyWith(_$ListUniversityDtoImpl value,
          $Res Function(_$ListUniversityDtoImpl) then) =
      __$$ListUniversityDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'alpha_two_code') String alphaTwoCode,
      List<String> domains,
      String country,
      @JsonKey(name: 'state-province') String? stateProvince,
      @JsonKey(name: 'web_pages') List<String> webPages,
      String name});
}

/// @nodoc
class __$$ListUniversityDtoImplCopyWithImpl<$Res>
    extends _$ListUniversityDtoCopyWithImpl<$Res, _$ListUniversityDtoImpl>
    implements _$$ListUniversityDtoImplCopyWith<$Res> {
  __$$ListUniversityDtoImplCopyWithImpl(_$ListUniversityDtoImpl _value,
      $Res Function(_$ListUniversityDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alphaTwoCode = null,
    Object? domains = null,
    Object? country = null,
    Object? stateProvince = freezed,
    Object? webPages = null,
    Object? name = null,
  }) {
    return _then(_$ListUniversityDtoImpl(
      alphaTwoCode: null == alphaTwoCode
          ? _value.alphaTwoCode
          : alphaTwoCode // ignore: cast_nullable_to_non_nullable
              as String,
      domains: null == domains
          ? _value._domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<String>,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      stateProvince: freezed == stateProvince
          ? _value.stateProvince
          : stateProvince // ignore: cast_nullable_to_non_nullable
              as String?,
      webPages: null == webPages
          ? _value._webPages
          : webPages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListUniversityDtoImpl implements _ListUniversityDto {
  const _$ListUniversityDtoImpl(
      {@JsonKey(name: 'alpha_two_code') required this.alphaTwoCode,
      required final List<String> domains,
      required this.country,
      @JsonKey(name: 'state-province') this.stateProvince,
      @JsonKey(name: 'web_pages') required final List<String> webPages,
      required this.name})
      : _domains = domains,
        _webPages = webPages;

  factory _$ListUniversityDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListUniversityDtoImplFromJson(json);

  @override
  @JsonKey(name: 'alpha_two_code')
  final String alphaTwoCode;
  final List<String> _domains;
  @override
  List<String> get domains {
    if (_domains is EqualUnmodifiableListView) return _domains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_domains);
  }

  @override
  final String country;
  @override
  @JsonKey(name: 'state-province')
  final String? stateProvince;
  final List<String> _webPages;
  @override
  @JsonKey(name: 'web_pages')
  List<String> get webPages {
    if (_webPages is EqualUnmodifiableListView) return _webPages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_webPages);
  }

  @override
  final String name;

  @override
  String toString() {
    return 'ListUniversityDto(alphaTwoCode: $alphaTwoCode, domains: $domains, country: $country, stateProvince: $stateProvince, webPages: $webPages, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListUniversityDtoImpl &&
            (identical(other.alphaTwoCode, alphaTwoCode) ||
                other.alphaTwoCode == alphaTwoCode) &&
            const DeepCollectionEquality().equals(other._domains, _domains) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.stateProvince, stateProvince) ||
                other.stateProvince == stateProvince) &&
            const DeepCollectionEquality().equals(other._webPages, _webPages) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      alphaTwoCode,
      const DeepCollectionEquality().hash(_domains),
      country,
      stateProvince,
      const DeepCollectionEquality().hash(_webPages),
      name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListUniversityDtoImplCopyWith<_$ListUniversityDtoImpl> get copyWith =>
      __$$ListUniversityDtoImplCopyWithImpl<_$ListUniversityDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListUniversityDtoImplToJson(
      this,
    );
  }
}

abstract class _ListUniversityDto implements ListUniversityDto {
  const factory _ListUniversityDto(
      {@JsonKey(name: 'alpha_two_code') required final String alphaTwoCode,
      required final List<String> domains,
      required final String country,
      @JsonKey(name: 'state-province') final String? stateProvince,
      @JsonKey(name: 'web_pages') required final List<String> webPages,
      required final String name}) = _$ListUniversityDtoImpl;

  factory _ListUniversityDto.fromJson(Map<String, dynamic> json) =
      _$ListUniversityDtoImpl.fromJson;

  @override
  @JsonKey(name: 'alpha_two_code')
  String get alphaTwoCode;
  @override
  List<String> get domains;
  @override
  String get country;
  @override
  @JsonKey(name: 'state-province')
  String? get stateProvince;
  @override
  @JsonKey(name: 'web_pages')
  List<String> get webPages;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ListUniversityDtoImplCopyWith<_$ListUniversityDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
