
class User {
  final int id;
  final String name;
  final String email;
  final String phone;

  User({required this.id, required this.name, required this.email, required this.phone});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'], 
      name: json['name'], 
      email: json['email'],
      phone: json['phone']
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone
    };
  } 

  String get phoneFormatted {
    if (phone.length == 11) {
      return "(${phone.substring(0,2)}) ${phone.substring(2,7)}-${phone.substring(7)}";
    }
    return phone;
  }

}