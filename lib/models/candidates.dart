import 'dart:convert';

class Candidate {
  final int id;
  final String name;
  final int age;
  final String mobile;
  final int experience;
  final String expectedSalaryRange;
  final String address;
  final String category;
  final String religion;
  final int hours;
  final String addedBy;

  Candidate({
    required this.id,
    required this.name,
    required this.age,
    required this.mobile,
    required this.experience,
    required this.expectedSalaryRange,
    required this.address,
    required this.category,
    required this.religion,
    required this.hours,
    required this.addedBy,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      mobile: json['mobile'],
      experience: json['experience'],
      expectedSalaryRange: json['expectedSalaryRange'],
      address: json['address'],
      category: json['category'],
      religion: json['religion'],
      hours: json['hours'],
      addedBy: json['addedBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "age": age,
      "mobile": mobile,
      "experience": experience,
      "expectedSalaryRange": expectedSalaryRange,
      "address": address,
      "category": category,
      "religion": religion,
      "hours": hours,
      "addedBy": addedBy,
    };
  }

  static List<Candidate> fromJsonList(String jsonStr) {
    final data = json.decode(jsonStr) as List;
    return data.map((e) => Candidate.fromJson(e)).toList();
  }
}


/*

Future<List<Candidate>> loadCandidates() async {
  final jsonStr = await rootBundle.loadString('assets/candidates.json');
  return Candidate.fromJsonList(jsonStr);
}

 */