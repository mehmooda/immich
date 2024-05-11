//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PeopleWithFacesResponseDto {
  /// Returns a new [PeopleWithFacesResponseDto] instance.
  PeopleWithFacesResponseDto({
    this.faces = const [],
    required this.numberOfFaces,
  });

  List<PersonWithFacesResponseDto> faces;

  int numberOfFaces;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PeopleWithFacesResponseDto &&
    _deepEquality.equals(other.faces, faces) &&
    other.numberOfFaces == numberOfFaces;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (faces.hashCode) +
    (numberOfFaces.hashCode);

  @override
  String toString() => 'PeopleWithFacesResponseDto[faces=$faces, numberOfFaces=$numberOfFaces]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'faces'] = this.faces;
      json[r'numberOfFaces'] = this.numberOfFaces;
    return json;
  }

  /// Returns a new [PeopleWithFacesResponseDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PeopleWithFacesResponseDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      return PeopleWithFacesResponseDto(
        faces: PersonWithFacesResponseDto.listFromJson(json[r'faces']),
        numberOfFaces: mapValueOfType<int>(json, r'numberOfFaces')!,
      );
    }
    return null;
  }

  static List<PeopleWithFacesResponseDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PeopleWithFacesResponseDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PeopleWithFacesResponseDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PeopleWithFacesResponseDto> mapFromJson(dynamic json) {
    final map = <String, PeopleWithFacesResponseDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PeopleWithFacesResponseDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PeopleWithFacesResponseDto-objects as value to a dart map
  static Map<String, List<PeopleWithFacesResponseDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PeopleWithFacesResponseDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PeopleWithFacesResponseDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'faces',
    'numberOfFaces',
  };
}

