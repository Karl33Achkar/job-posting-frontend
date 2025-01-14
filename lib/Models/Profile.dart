import 'package:job_posting_application/Models/User.dart';

class Profile extends User {
  final String newPass;
  final String confirmPass;

  Profile({
    required super.name,
    required super.email,
    required super.password,
    required this.newPass,
    required this.confirmPass
  });

}