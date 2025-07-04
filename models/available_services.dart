class AvailableServices {
  final int id;
  final String serviceName;
  final String fee;
  final String time;
  final String email;
  final String category;
  final String description;

  AvailableServices({
    required this.id,
    required this.serviceName,
    required this.fee,
    required this.time,
    required this.email,
    required this.category,
    required this.description,
  });

  factory AvailableServices.fromJason(jsonData) {
    return AvailableServices(
      id: jsonData['id'],
      serviceName: jsonData['serviceName'],
      fee: jsonData['fee'].toString(),
      time: jsonData['processingTime'],
      email: jsonData['contactInfo'],
      category: jsonData['category'],
      description: jsonData['serviceDescription'],
    );
  }
}
