class Flight {
  final String id;
  final String airlineName;
  final String date;
  final String fromTime;
  final String toTime;
  final String duration;
  final String fromPlace;
  final String toPlace;

  Flight({
    required this.id,
    required this.airlineName,
    required this.date,
    required this.fromTime,
    required this.toTime,
    required this.duration,
    required this.fromPlace,
    required this.toPlace,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'airlineName': airlineName,
      'date': date,
      'fromTime': fromTime,
      'toTime': toTime,
      'duration': duration,
      'fromPlace': fromPlace,
      'toPlace': toPlace,
    };
  }

  factory Flight.fromMap(Map<String, dynamic> map) {
    return Flight(
      id: map['id'],
      airlineName: map['airlineName'],
      date: map['date'],
      fromTime: map['fromTime'],
      toTime: map['toTime'],
      duration: map['duration'],
      fromPlace: map['fromPlace'],
      toPlace: map['toPlace'],
    );
  }
}
