class ModelPlaces {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  ModelPlaces({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  // Factory method to create a Comment from a JSON object
  factory ModelPlaces.fromJson(Map<String, dynamic> json) {
    return ModelPlaces(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}
