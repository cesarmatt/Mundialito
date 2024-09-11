class Contender {
  Contender({required this.name});
  String name;

  Contender.fromJson(Map<String, Object?> json) : this(name: json['name']! as String);

  Map<String, Object?> toJson() {
    return {
      'name': name
    };
  }
}