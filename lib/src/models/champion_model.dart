import 'dart:convert';

import 'package:lolspy/src/models/image_model.dart';

class Champion {
  final String version;
  final String key;
  final String name;
  final String title;
  final String blurb;
  final Image image;

  const Champion({
    required this.version,
    required this.key,
    required this.name,
    required this.title,
    required this.blurb,
    required this.image,
  });

  Champion copyWith({
    String? version,
    String? key,
    String? name,
    String? title,
    String? blurb,
    Image? image,
  }) {
    return Champion(
      version: version ?? this.version,
      key: key ?? this.key,
      name: name ?? this.name,
      title: title ?? this.title,
      blurb: blurb ?? this.blurb,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'version': version,
      'key': key,
      'name': name,
      'title': title,
      'blurb': blurb,
      'image': image.toMap(),
    };
  }

  factory Champion.fromMap(Map<String, dynamic> map) {
    return Champion(
      version: map['version'] ?? '',
      key: map['key'] ?? '',
      name: map['name'] ?? '',
      title: map['title'] ?? '',
      blurb: map['blurb'] ?? '',
      image: Image.fromMap(map['image']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Champion.fromJson(String source) =>
      Champion.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Champion(version: $version, key: $key, name: $name, title: $title, blurb: $blurb, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Champion &&
        other.version == version &&
        other.key == key &&
        other.name == name &&
        other.title == title &&
        other.blurb == blurb &&
        other.image == image;
  }

  @override
  int get hashCode {
    return version.hashCode ^
        key.hashCode ^
        name.hashCode ^
        title.hashCode ^
        blurb.hashCode ^
        image.hashCode;
  }
}
