class ImageModel {
  final String imageUrl;

  ImageModel({required this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      imageUrl: map['imageUrl'],
    );
  }
}
