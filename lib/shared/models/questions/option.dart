class Option {
  dynamic id;
  dynamic uniqueId;
  String option;

  Option({
    this.id,
    this.uniqueId,
    required this.option,
  });

  Option copyWith({dynamic id, dynamic uniqueId, String? option}) {
    return Option(
      option: option ?? this.option,
      id: this.id,
      uniqueId: this.uniqueId,
    );
  }

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      option: json['option'],
      id: json['id'],
      uniqueId: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": uniqueId, "option": option};
  }

  @override
  String toString() {
    return 'Option(option: $option, id: $id)';
  }
}
