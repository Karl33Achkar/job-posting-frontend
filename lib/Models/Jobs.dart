class Jobs {
  final String? jobName;
  final String? salary;
  final String? companyName;
  final String? countryName;
  final String? url;

  Jobs({
    this.jobName,
    this.companyName,
    this.salary,
    this.countryName,
    this.url
  });

  factory Jobs.fromJson(Map<String, dynamic> json) {
    return Jobs(
      jobName: json['Job Name'] as String?,
      salary: json['Salary'] as String?,
      countryName: json['Country Name'] as String?,
      url: json['url'] as String?,
        companyName: json['Company Name'] as String?
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Job Name': jobName,
      'Salary': salary,
      'Country Name': countryName,
      'url': url,
      'Company Name': companyName,
    };
  }
}