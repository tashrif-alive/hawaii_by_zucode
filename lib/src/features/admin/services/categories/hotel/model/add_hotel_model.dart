class Hotel {
  final String id;
  final String hotelName;
  final String hotelType;
  final String location;
  final String hotelCost;

  //final String toPlace;

  Hotel({
    required this.id,
    required this.hotelName,
    required this.hotelType,
    required this.location,
    required this.hotelCost,
    //required this.toPlace,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hotelName': hotelName,
      'hotelType': hotelType,
      'location': location,
      'hotelCost': hotelCost,
      // 'toPlace': toPlace,
    };
  }

  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
      id: map['id'],
      hotelName: map['hotelName'],
      hotelType: map['hotelType'],
      location: map['location'],
      hotelCost: map['hotelCost'],
      //toPlace: map['toPlace'],
    );
  }
}
