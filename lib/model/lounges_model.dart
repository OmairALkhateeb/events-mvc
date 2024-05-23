class Lounges {
  String? nameOfHall;
  int? capacity;
  String? hallLocation;
  String? rentalCost;
  String? hallDescription;
  String? category;
  String? image;

  Lounges({
    this.nameOfHall,
    this.capacity,
    this.hallLocation,
    this.rentalCost,
    this.hallDescription,
    this.category,
    this.image,
  });

  factory Lounges.fromJson(Map<String, dynamic> jsonData) {
    return Lounges(
      nameOfHall: jsonData['Name Of Hall'],
      capacity: jsonData['Capacity'],
      hallLocation: jsonData['Hall Location'],
      rentalCost: jsonData['Rental Cost'],
      hallDescription: jsonData['Hall Description'],
      category: jsonData['category'],
      image: jsonData['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Name Of Hall'] = nameOfHall;
    data['Capacity'] = capacity;
    data['Hall Location'] = hallLocation;
    data['Rental Cost'] = rentalCost;
    data['Hall Description'] = hallDescription;
    data['category'] = category;
    data['image'] = image;
    return data;
  }
}
