class Organization {
  final String id;
  final String name;
  final String email;
  final String aboutUs;
  final String howToVolunteer;
  final String imageUrl;
  final double longitude;
  final double latitude;
  final String liveStreamingId;

  Organization({
    required this.id,
    required this.name,
    required this.email,
    required this.aboutUs,
    required this.howToVolunteer,
    required this.imageUrl,
    required this.longitude,
    required this.latitude,
    required this.liveStreamingId,
  });

  // fromJson method
  factory Organization.fromJson(Map<String, dynamic> json) {
    double parseCoordinate(dynamic value) {
      if (value is int) {
        return value.toDouble();
      } else if (value is double) {
        return value;
      } else {
        throw FormatException('Coordinate value must be an int or double');
      }
    }

    return Organization(
      id: json['_id'] ,
      name: json['firstName'] ,
      email: json['email'] ,
      aboutUs: json['organizationDetail']['aboutUs'] ,
      howToVolunteer: json['organizationDetail']['howToVolunteer'] ,
      imageUrl: json['organizationDetail']['imageUrl'] ,
      longitude: parseCoordinate(json['organizationDetail']['location']['longitude']),
      latitude: parseCoordinate(json['organizationDetail']['location']['latitude']),
      liveStreamingId: json['organizationDetail']['liveStreamingL']['_id'] ,
    );
  }
}
