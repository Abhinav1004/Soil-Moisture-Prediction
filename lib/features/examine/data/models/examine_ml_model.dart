import 'dart:convert';

class ExamineMlModel {
  final int index;
  final String label;
  final int confidence;
  ExamineMlModel({
    required this.index,
    required this.label,
    required this.confidence,
  });

  

  ExamineMlModel copyWith({
    int? index,
    String? label,
    int? confindence,
  }) {
    return ExamineMlModel(
      index: index ?? this.index,
      label: label ?? this.label,
      confidence: confindence ?? this.confidence,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'index': index});
    result.addAll({'label': label});
    result.addAll({'confidence': confidence});
  
    return result;
  }

  factory ExamineMlModel.fromMap(Map<String, dynamic> map) {
    return ExamineMlModel(
      index: map['index']?.toInt() ?? 0,
      label: map['label'] ?? '',
      confidence: ((map['confidence']?.toDouble() * 100 ?? 0)).floor(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExamineMlModel.fromJson(String source) => ExamineMlModel.fromMap(json.decode(source));

  @override
  String toString() => 'ExamineMlModel(index: $index, label: $label, confidence: $confidence)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ExamineMlModel &&
      other.index == index &&
      other.label == label &&
      other.confidence == confidence;
  }

  @override
  int get hashCode => index.hashCode ^ label.hashCode ^ confidence.hashCode;
}
