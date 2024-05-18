class Trends {
  Map<String, double> jobSelected;
  Map<String, double> jobPosted;
  Map<String, double> jobApplied;
  Map<String, double> averageSalary;
  Trends(
      {required this.averageSalary,
      required this.jobApplied,
      required this.jobPosted,
      required this.jobSelected});

  factory Trends.fromJson(Map<String, dynamic> json) {
    return Trends(
      averageSalary: (json['averageSalary'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, value as double)),
      jobApplied: (json['jobApplied'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, value as double)),
      jobPosted: (json['jobPosted'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, value as double)),
      jobSelected: (json['jobSelected'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, value as double)),
    );
  }
}
