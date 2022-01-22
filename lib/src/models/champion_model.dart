import 'dart:convert';

class Champion {
  final String version;
  final String key;
  final String name;
  final String title;
  final String blurb;
  Champion({
    required this.version,
    required this.key,
    required this.name,
    required this.title,
    required this.blurb,
  });

  Champion copyWith({
    String? version,
    String? key,
    String? name,
    String? title,
    String? blurb,
  }) {
    return Champion(
      version: version ?? this.version,
      key: key ?? this.key,
      name: name ?? this.name,
      title: title ?? this.title,
      blurb: blurb ?? this.blurb,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'version': version,
      'key': key,
      'name': name,
      'title': title,
      'blurb': blurb,
    };
  }

  factory Champion.fromMap(Map<String, dynamic> map) {
    return Champion(
      version: map['version'] ?? '',
      key: map['key'] ?? '',
      name: map['name'] ?? '',
      title: map['title'] ?? '',
      blurb: map['blurb'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Champion.fromJson(String source) =>
      Champion.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Champion(version: $version, key: $key, name: $name, title: $title, blurb: $blurb)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Champion &&
        other.version == version &&
        other.key == key &&
        other.name == name &&
        other.title == title &&
        other.blurb == blurb;
  }

  @override
  int get hashCode {
    return version.hashCode ^
        key.hashCode ^
        name.hashCode ^
        title.hashCode ^
        blurb.hashCode;
  }
}
