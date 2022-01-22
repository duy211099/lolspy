import 'dart:convert';

class Image {
  final String full;
  final String sprite;
  final String group;
  const Image({
    required this.full,
    required this.sprite,
    required this.group,
  });

  Image copyWith({
    String? full,
    String? sprite,
    String? group,
  }) {
    return Image(
      full: full ?? this.full,
      sprite: sprite ?? this.sprite,
      group: group ?? this.group,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'full': full,
      'sprite': sprite,
      'group': group,
    };
  }

  factory Image.fromMap(Map<String, dynamic> map) {
    return Image(
      full: map['full'] ?? '',
      sprite: map['sprite'] ?? '',
      group: map['group'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Image.fromJson(String source) => Image.fromMap(json.decode(source));

  @override
  String toString() => 'Image(full: $full, sprite: $sprite, group: $group)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Image &&
        other.full == full &&
        other.sprite == sprite &&
        other.group == group;
  }

  @override
  int get hashCode => full.hashCode ^ sprite.hashCode ^ group.hashCode;
}
