
// Model Class
class Worker {
  int? id;
  String name;
  int mobile;
  int age;
  String dateOfJoining;

  Worker({this.id, required this.name, required this.mobile, required this.age, required this.dateOfJoining});

  // Convert Worker object to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'mobile': mobile,
      'age': age,
      'dateOfJoining' : dateOfJoining
    };
  }

  // Convert Map to Worker object
  factory Worker.fromMap(Map<String, dynamic> map) {
    return Worker(
      id: map['id'],
      name: map['name'],
      mobile: map['mobile'],
      age: map['age'],
      dateOfJoining: map['dateOfJoining']
    );
  }
}