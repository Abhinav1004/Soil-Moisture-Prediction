import 'dart:convert';

class ReadingModel {
  final String title;
  final String subtitle;
  final String desc;
  final String imageUrl;
  ReadingModel({
    required this.title,
    required this.subtitle,
    required this.desc,
    required this.imageUrl,
  });

  ReadingModel copyWith({
    String? title,
    String? subtitle,
    String? desc,
    String? imageUrl,
  }) {
    return ReadingModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      desc: desc ?? this.desc,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'title': title});
    result.addAll({'subtitle': subtitle});
    result.addAll({'desc': desc});
    result.addAll({'imageUrl': imageUrl});
  
    return result;
  }

  factory ReadingModel.fromMap(Map<String, dynamic> map) {
    return ReadingModel(
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      desc: map['desc'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ReadingModel.fromJson(String source) => ReadingModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ReadingModel(title: $title, subtitle: $subtitle, desc: $desc, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ReadingModel &&
      other.title == title &&
      other.subtitle == subtitle &&
      other.desc == desc &&
      other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      subtitle.hashCode ^
      desc.hashCode ^
      imageUrl.hashCode;
  }
}
