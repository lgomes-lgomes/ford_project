import 'package:projeto_ford/api/common/dtos/baseDTO.dart';

class UsertDTO extends BaseDTO {
  final String name;
  final String email;
  final String password;

  UsertDTO({
    required this.name,
    required this.email,
    required this.password,
    super.id,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': super.id,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
