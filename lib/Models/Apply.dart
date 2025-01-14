class Apply {
  final String fullName;
  final String email;
  final String resumePath;

  Apply({
    required this.fullName,
    required this.email,
    required this.resumePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'full_name': fullName,
      'email': email,
      'resume': resumePath,
    };
  }
}