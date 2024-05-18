class JobRole {
  String description;
  String jobTitle;
  Map<String, double> jobsPosted = {};
  Map<String, double> jobSalary = {};
  Map<String, double> ratings = {};
  String? imageUrl;
  Map<String, int> jobNum = {};
  double averageSalary;
  List<String> skills;
  int ratingCount;
  String jobType;
  List<Review> reviews;
  List<String> keywords;

  JobRole(
      {required this.description,
      required this.jobTitle,
      required this.jobsPosted,
      required this.jobSalary,
      required this.averageSalary,
      required this.ratings,
      required this.ratingCount,
      required this.reviews,
      required this.skills,
      required this.jobType,
      required this.keywords,
      required this.jobNum,
      this.imageUrl});

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'jobTitle': jobTitle,
      'jobsPosted': jobsPosted,
      'jobSalary': jobSalary,
      'keywords': keywords,
      'jobNum': jobNum,
      'ratings': ratings,
      'imageUrl': imageUrl,
      'averageSalary': averageSalary,
      'skills': skills,
      'jobType': jobType,
      'ratingCount': ratingCount,
      'reviews': reviews.map((review) => review.toJson()).toList(),
    };
  }

  // factory JobRole.fromJson(Map<String, dynamic> json) {
  //   // Check if all required fields are present in the JSON
  //   if (json['description'] == null ||
  //       json['jobTitle'] == null ||
  //       json['jobsPosted'] == null ||
  //       json['jobSalary'] == null ||
  //       json['ratings'] == null ||
  //       json['averageSalary'] == null ||
  //       json['skills'] == null ||
  //       json['ratingCount'] == null ||
  //       json['jobType'] == null ||
  //       json['keywords'] == null) {
  //     throw FormatException("Invalid JSON format");
  //   }

  //   // Convert skills to a list of strings
  //   List<String> skills = [];
  //   if (json['skills'] is List) {
  //     skills = List<String>.from(json['skills']);
  //   }

  //   // Convert keywords to a list of strings
  //   List<String> keywords = [];
  //   if (json['keywords'] is List) {
  //     keywords = List<String>.from(json['keywords']);
  //   }

  //   // Convert jobsPosted, jobSalary, and ratings to maps and sort them based on keys
  //   Map<String, double> jobsPosted = {};
  //   Map<String, double> jobSalary = {};
  //   Map<String, double> ratings = {};
  //   Map<String, int> jobNum = {};

  //   if (json['jobsPosted'] is Map<String, dynamic>) {
  //     jobsPosted = Map<String, double>.from(json['jobsPosted'])
  //       ..addAll(jobsPosted);
  //     jobsPosted = Map<String, double>.fromEntries(
  //         jobsPosted.entries.toList()..sort((a, b) => a.key.compareTo(b.key)));
  //   }

  //   if (json['jobSalary'] is Map<String, dynamic>) {
  //     jobSalary = Map<String, double>.from(json['jobSalary'])
  //       ..addAll(jobSalary);
  //     jobSalary = Map<String, double>.fromEntries(
  //         jobSalary.entries.toList()..sort((a, b) => a.key.compareTo(b.key)));
  //   }

  //   if (json['ratings'] is Map<String, dynamic>) {
  //     ratings = Map<String, double>.from(json['ratings']);
  //   }

  //   if (json['jobNum'] is Map<String, dynamic>) {
  //     jobNum = Map<String, int>.from(json['jobNum'])..addAll(jobNum);
  //     jobNum = Map<String, int>.fromEntries(
  //         jobNum.entries.toList()..sort((a, b) => a.key.compareTo(b.key)));
  //   }

  //   // Convert reviews to a list of Review objects
  //   List<Review> reviews = [];
  //   if (json['reviews'] != null) {
  //     var reviewList = json['reviews'] as List;
  //     reviews =
  //         reviewList.map((reviewJson) => Review.fromJson(reviewJson)).toList();
  //   }

  //   // Create the JobRole object
  //   return JobRole(
  //     description: json['description'],
  //     jobTitle: json['jobTitle'],
  //     jobsPosted: jobsPosted,
  //     jobSalary: jobSalary,
  //     ratings: ratings,
  //     averageSalary: json['averageSalary'],
  //     imageUrl: json['imageUrl'],
  //     jobNum: jobNum,
  //     skills: skills,
  //     ratingCount: json['ratingCount'],
  //     jobType: json['jobType'],
  //     reviews: reviews,
  //     keywords: keywords,
  //   );
  // }
  factory JobRole.fromJson(Map<String, dynamic> json) {
    // Check if all required fields are present in the JSON
    if (json['description'] == null ||
        json['jobTitle'] == null ||
        json['jobsPosted'] == null ||
        json['jobSalary'] == null ||
        json['ratings'] == null ||
        json['averageSalary'] == null ||
        json['skills'] == null ||
        json['ratingCount'] == null ||
        json['jobType'] == null ||
        json['keywords'] == null) {
      throw FormatException("Invalid JSON format");
    }

    // Convert skills to a list of strings
    List<String> skills = [];
    if (json['skills'] is List) {
      skills = List<String>.from(json['skills']);
    }

    // Convert keywords to a list of strings
    List<String> keywords = [];
    if (json['keywords'] is List) {
      keywords = List<String>.from(json['keywords']);
    }

    // Convert jobsPosted, jobSalary, and ratings to maps
    Map<String, double> jobsPosted = {};
    if (json['jobsPosted'] is Map<String, dynamic>) {
      json['jobsPosted'].forEach((key, value) {
        jobsPosted[key] = value.toDouble();
      });
    }

    Map<String, double> jobSalary = {};
    if (json['jobSalary'] is Map<String, dynamic>) {
      json['jobSalary'].forEach((key, value) {
        jobSalary[key] = value.toDouble();
      });
    }

    Map<String, double> ratings = {};
    if (json['ratings'] is Map<String, dynamic>) {
      json['ratings'].forEach((key, value) {
        ratings[key] = value.toDouble();
      });
    }

    Map<String, int> jobNum = {};
    if (json['jobNum'] is Map<String, dynamic>) {
      json['jobNum'].forEach((key, value) {
        jobNum[key] = value as int;
      });
    }

    // Convert reviews to a list of Review objects
    List<Review> reviews = [];
    if (json['reviews'] != null) {
      var reviewList = json['reviews'] as List;
      reviews =
          reviewList.map((reviewJson) => Review.fromJson(reviewJson)).toList();
    }

    // Create the JobRole object
    return JobRole(
      description: json['description'],
      jobTitle: json['jobTitle'],
      jobsPosted: jobsPosted,
      jobSalary: jobSalary,
      ratings: ratings,
      averageSalary: json['averageSalary'].toDouble(),
      imageUrl: json['imageUrl'],
      jobNum: jobNum,
      skills: skills,
      ratingCount: json['ratingCount'],
      jobType: json['jobType'],
      reviews: reviews,
      keywords: keywords,
    );
  }
}

class Review {
  String email;
  String name;
  String companyName;
  String description;
  DateTime postDate;
  int usefulBy;

  Review(
      {required this.description,
      required this.email,
      required this.name,
      required this.postDate,
      required this.companyName,
      required this.usefulBy});
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      companyName: json['companyName'] ?? "",
      description: json['description'],
      email: json['email'],
      name: json['name'],
      postDate: DateTime.parse(json['postDate']),
      usefulBy: json['usefulBy'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'companyName': companyName ?? "",
      'email': email,
      'name': name,
      'description': description,
      'postDate': postDate.toIso8601String(),
      'usefulBy': usefulBy,
    };
  }
}

List<JobRole> jobList = [
  JobRole(
    description:
        "A Business Analyst is responsible for analyzing an organization's business domain, processes, and systems to identify opportunities for improvement. They gather and document requirements, analyze data, and recommend solutions to enhance business operations. Business Analysts collaborate with stakeholders to ensure project success and facilitate effective communication between technical and non-technical teams.",
    jobTitle: "Business Analyst",
    jobsPosted: {
      '2023-01-15': 5,
      '2023-02-20': 8,
      '2023-03-10': 3,
      '2023-04-05': 6,
      '2023-05-20': 9,
      '2023-06-10': 4,
      '2023-07-15': 7,
      '2023-08-20': 10,
      '2023-09-10': 2,
      '2023-10-05': 8,
      '2023-11-20': 4,
      '2023-12-10': 5,
      '2024-01-15': 6,
      '2024-02-20': 8,
      '2024-03-10': 7,
      '2024-04-05': 5,
      '2024-05-20': 9,
      '2024-06-10': 3,
      '2024-07-15': 6,
      '2024-08-20': 8,
      '2024-09-10': 4,
      '2024-10-05': 7,
      '2024-11-20': 5,
      '2024-12-10': 6,
      '2025-01-15': 7,
    },
    jobSalary: {
      '2023-01-15': 70000,
      '2023-02-20': 75000,
      '2023-03-10': 80000,
      '2023-04-05': 75000,
      '2023-05-20': 80000,
      '2023-06-10': 85000,
      '2023-07-15': 85000,
      '2023-08-20': 90000,
      '2023-09-10': 90000,
      '2023-10-05': 95000,
      '2023-11-20': 95000,
      '2023-12-10': 100000,
      '2024-01-15': 100000,
      '2024-02-20': 105000,
      '2024-03-10': 105000,
      '2024-04-05': 110000,
      '2024-05-20': 110000,
      '2024-06-10': 115000,
      '2024-07-15': 115000,
      '2024-08-20': 120000,
      '2024-09-10': 120000,
      '2024-10-05': 125000,
      '2024-11-20': 125000,
      '2024-12-10': 130000,
      '2025-01-15': 130000,
    },
    ratings: {
      'Work Life Balance': 4.5,
      'Career Growth': 4.0,
      'Job Satisfaction': 4.0,
      'Workload and Stress Level': 4.0,
    },
    averageSalary: 95000,
    skills: ['Business Analysis', 'Data Analysis', 'Requirements Gathering'],
    ratingCount: 20,
    jobType: 'Full-time',
    keywords: ['Business Analyst', 'Analysis', 'Requirements'],
    jobNum: {
      '2023-01-15': 2001,
      '2023-02-20': 2002,
      '2023-03-10': 2003,
      '2023-04-05': 2004,
      '2023-05-20': 2005,
      '2023-06-10': 2006,
      '2023-07-15': 2007,
      '2023-08-20': 2008,
      '2023-09-10': 2009,
      '2023-10-05': 2010,
      '2023-11-20': 2011,
      '2023-12-10': 2012,
      '2024-01-15': 2013,
      '2024-02-20': 2014,
      '2024-03-10': 2015,
      '2024-04-05': 2016,
      '2024-05-20': 2017,
      '2024-06-10': 2018,
      '2024-07-15': 2019,
      '2024-08-20': 2020,
      '2024-09-10': 2021,
      '2024-10-05': 2022,
      '2024-11-20': 2023,
      '2024-12-10': 2024,
      '2025-01-15': 2025,
    },
    reviews: [
      Review(
        email: "user1@example.com",
        name: "John Doe",
        companyName: "Company A",
        description: "Great company to work for.",
        postDate: DateTime(2023, 4, 5),
        usefulBy: 15,
      ),
      Review(
        email: "user2@example.com",
        name: "Jane Smith",
        companyName: "Company B",
        description: "Good work environment.",
        postDate: DateTime(2023, 5, 10),
        usefulBy: 10,
      ),
    ],
  ),
  JobRole(
    description:
        "An Assistant Professor works in academia, typically at colleges or universities, teaching undergraduate and graduate-level courses. They conduct research, publish academic papers, and contribute to their field's knowledge base. Assistant Professors also mentor students, advise on academic matters, and participate in departmental activities. They play a crucial role in shaping the next generation of professionals in their discipline.",
    jobTitle: "Assistant Professor",
    jobsPosted: {
      '2023-01-15': 10,
      '2023-02-20': 12,
      '2023-03-10': 8,
      '2023-04-05': 15,
      '2023-05-20': 18,
      '2023-06-10': 11,
      '2023-07-15': 20,
      '2023-08-20': 22,
      '2023-09-10': 13,
      '2023-10-05': 17,
      '2023-11-20': 10,
      '2023-12-10': 12,
      '2024-01-15': 14,
      '2024-02-20': 16,
      '2024-03-10': 18,
      '2024-04-05': 20,
      '2024-05-20': 22,
      '2024-06-10': 15,
      '2024-07-15': 18,
      '2024-08-20': 20,
      '2024-09-10': 22,
      '2024-10-05': 25,
      '2024-11-20': 20,
      '2024-12-10': 22,
      '2025-01-15': 25,
    },
    jobSalary: {
      '2023-01-15': 60000,
      '2023-02-20': 62000,
      '2023-03-10': 65000,
      '2023-04-05': 67000,
      '2023-05-20': 69000,
      '2023-06-10': 71000,
      '2023-07-15': 73000,
      '2023-08-20': 75000,
      '2023-09-10': 77000,
      '2023-10-05': 79000,
      '2023-11-20': 81000,
      '2023-12-10': 83000,
      '2024-01-15': 85000,
      '2024-02-20': 87000,
      '2024-03-10': 89000,
      '2024-04-05': 91000,
      '2024-05-20': 93000,
      '2024-06-10': 95000,
      '2024-07-15': 97000,
      '2024-08-20': 99000,
      '2024-09-10': 101000,
      '2024-10-05': 103000,
      '2024-11-20': 105000,
      '2024-12-10': 107000,
      '2025-01-15': 109000,
    },
    ratings: {
      'Work Life Balance': 4.5,
      'Career Growth': 4.0,
      'Job Satisfaction': 4.0,
      'Workload and Stress Level': 4.0,
    },
    averageSalary: 80000,
    skills: ['Teaching', 'Research', 'Academic Writing'],
    ratingCount: 20,
    jobType: 'Full-time',
    keywords: ['Assistant Professor', 'Teaching', 'Research'],
    jobNum: {
      '2023-01-15': 3001,
      '2023-02-20': 3002,
      '2023-03-10': 3003,
      '2023-04-05': 3004,
      '2023-05-20': 3005,
      '2023-06-10': 3006,
      '2023-07-15': 3007,
      '2023-08-20': 3008,
      '2023-09-10': 3009,
      '2023-10-05': 3010,
      '2023-11-20': 3011,
      '2023-12-10': 3012,
      '2024-01-15': 3013,
      '2024-02-20': 3014,
      '2024-03-10': 3015,
      '2024-04-05': 3016,
      '2024-05-20': 3017,
      '2024-06-10': 3018,
      '2024-07-15': 3019,
      '2024-08-20': 3020,
      '2024-09-10': 3021,
      '2024-10-05': 3022,
      '2024-11-20': 3023,
      '2024-12-10': 3024,
      '2025-01-15': 3025,
    },
    reviews: [
      Review(
        email: "user1@example.com",
        name: "John Doe",
        companyName: "University X",
        description: "Great environment for both teaching and research.",
        postDate: DateTime(2023, 4, 5),
        usefulBy: 15,
      ),
      Review(
        email: "user2@example.com",
        name: "Jane Smith",
        companyName: "University Y",
        description: "Supportive colleagues and opportunities for growth.",
        postDate: DateTime(2023, 5, 10),
        usefulBy: 10,
      ),
    ],
  ),
  JobRole(
    description:
        "A Software Developer is responsible for designing, coding, testing, and maintaining software applications. They work closely with other members of the development team to understand requirements and develop efficient solutions. Software Developers write clean, maintainable code using various programming languages and frameworks. They also troubleshoot issues, perform code reviews, and continuously improve software products.",
    jobTitle: "Software Developer",
    jobsPosted: {
      '2023-01-15': 15,
      '2023-02-20': 18,
      '2023-03-10': 12,
      '2023-04-05': 20,
      '2023-05-20': 22,
      '2023-06-10': 17,
      '2023-07-15': 25,
      '2023-08-20': 28,
      '2023-09-10': 20,
      '2023-10-05': 24,
      '2023-11-20': 16,
      '2023-12-10': 18,
      '2024-01-15': 22,
      '2024-02-20': 26,
      '2024-03-10': 28,
      '2024-04-05': 30,
      '2024-05-20': 32,
      '2024-06-10': 25,
      '2024-07-15': 28,
      '2024-08-20': 30,
      '2024-09-10': 32,
      '2024-10-05': 35,
      '2024-11-20': 30,
      '2024-12-10': 32,
      '2025-01-15': 35,
    },
    jobSalary: {
      '2023-01-15': 70000,
      '2023-02-20': 72000,
      '2023-03-10': 75000,
      '2023-04-05': 77000,
      '2023-05-20': 79000,
      '2023-06-10': 81000,
      '2023-07-15': 83000,
      '2023-08-20': 85000,
      '2023-09-10': 87000,
      '2023-10-05': 89000,
      '2023-11-20': 91000,
      '2023-12-10': 93000,
      '2024-01-15': 95000,
      '2024-02-20': 97000,
      '2024-03-10': 99000,
      '2024-04-05': 101000,
      '2024-05-20': 103000,
      '2024-06-10': 105000,
      '2024-07-15': 107000,
      '2024-08-20': 109000,
      '2024-09-10': 111000,
      '2024-10-05': 113000,
      '2024-11-20': 115000,
      '2024-12-10': 117000,
      '2025-01-15': 119000,
    },
    ratings: {
      'Work Life Balance': 4.5,
      'Career Growth': 4.0,
      'Job Satisfaction': 4.0,
      'Workload and Stress Level': 4.0,
    },
    averageSalary: 85000,
    skills: ['Programming', 'Software Development', 'Problem Solving'],
    ratingCount: 20,
    jobType: 'Full-time',
    keywords: ['Software Developer', 'Programming', 'Development'],
    jobNum: {
      '2023-01-15': 4001,
      '2023-02-20': 4002,
      '2023-03-10': 4003,
      '2023-04-05': 4004,
      '2023-05-20': 4005,
      '2023-06-10': 4006,
      '2023-07-15': 4007,
      '2023-08-20': 4008,
      '2023-09-10': 4009,
      '2023-10-05': 4010,
      '2023-11-20': 4011,
      '2023-12-10': 4012,
      '2024-01-15': 4013,
      '2024-02-20': 4014,
      '2024-03-10': 4015,
      '2024-04-05': 4016,
      '2024-05-20': 4017,
      '2024-06-10': 4018,
      '2024-07-15': 4019,
      '2024-08-20': 4020,
      '2024-09-10': 4021,
      '2024-10-05': 4022,
      '2024-11-20': 4023,
      '2024-12-10': 4024,
      '2025-01-15': 4025,
    },
    reviews: [
      Review(
        email: "user1@example.com",
        name: "John Doe",
        companyName: "Tech Company X",
        description: "Exciting projects and great team collaboration.",
        postDate: DateTime(2023, 4, 5),
        usefulBy: 15,
      ),
      Review(
        email: "user2@example.com",
        name: "Jane Smith",
        companyName: "Tech Company Y",
        description: "Good work-life balance and opportunities for growth.",
        postDate: DateTime(2023, 5, 10),
        usefulBy: 10,
      ),
    ],
  ),
  JobRole(
    description:
        "A Flutter Developer specializes in creating cross-platform mobile applications using the Flutter framework. They design, develop, and deploy mobile apps for both iOS and Android platforms, ensuring a consistent user experience across devices. Flutter Developers collaborate with UI/UX designers to implement engaging interfaces and integrate third-party APIs. They also perform testing, debugging, and maintenance tasks to ensure app functionality and performance.",
    jobTitle: "Flutter Developer",
    jobsPosted: {
      '2023-01-15': 8,
      '2023-02-20': 10,
      '2023-03-10': 6,
      '2023-04-05': 12,
      '2023-05-20': 15,
      '2023-06-10': 10,
      '2023-07-15': 18,
      '2023-08-20': 20,
      '2023-09-10': 14,
      '2023-10-05': 16,
      '2023-11-20': 10,
      '2023-12-10': 12,
      '2024-01-15': 14,
      '2024-02-20': 18,
      '2024-03-10': 20,
      '2024-04-05': 22,
      '2024-05-20': 25,
      '2024-06-10': 18,
      '2024-07-15': 20,
      '2024-08-20': 22,
      '2024-09-10': 24,
      '2024-10-05': 26,
      '2024-11-20': 22,
      '2024-12-10': 24,
      '2025-01-15': 26,
    },
    jobSalary: {
      '2023-01-15': 75000,
      '2023-02-20': 78000,
      '2023-03-10': 80000,
      '2023-04-05': 82000,
      '2023-05-20': 85000,
      '2023-06-10': 87000,
      '2023-07-15': 89000,
      '2023-08-20': 91000,
      '2023-09-10': 93000,
      '2023-10-05': 95000,
      '2023-11-20': 97000,
      '2023-12-10': 99000,
      '2024-01-15': 101000,
      '2024-02-20': 103000,
      '2024-03-10': 105000,
      '2024-04-05': 107000,
      '2024-05-20': 109000,
      '2024-06-10': 111000,
      '2024-07-15': 113000,
      '2024-08-20': 115000,
      '2024-09-10': 117000,
      '2024-10-05': 119000,
      '2024-11-20': 121000,
      '2024-12-10': 123000,
      '2025-01-15': 125000,
    },
    ratings: {
      'Work Life Balance': 4.5,
      'Career Growth': 4.0,
      'Job Satisfaction': 4.0,
      'Workload and Stress Level': 4.0,
    },
    averageSalary: 95000,
    skills: ['Flutter', 'Dart', 'Mobile App Development'],
    ratingCount: 20,
    jobType: 'Full-time',
    keywords: ['Flutter Developer', 'Mobile App Development', 'Cross-platform'],
    jobNum: {
      '2023-01-15': 5001,
      '2023-02-20': 5002,
      '2023-03-10': 5003,
      '2023-04-05': 5004,
      '2023-05-20': 5005,
      '2023-06-10': 5006,
      '2023-07-15': 5007,
      '2023-08-20': 5008,
      '2023-09-10': 5009,
      '2023-10-05': 5010,
      '2023-11-20': 5011,
      '2023-12-10': 5012,
      '2024-01-15': 5013,
      '2024-02-20': 5014,
      '2024-03-10': 5015,
      '2024-04-05': 5016,
      '2024-05-20': 5017,
      '2024-06-10': 5018,
      '2024-07-15': 5019,
      '2024-08-20': 5020,
      '2024-09-10': 5021,
      '2024-10-05': 5022,
      '2024-11-20': 5023,
      '2024-12-10': 5024,
      '2025-01-15': 5025,
    },
    reviews: [
      Review(
        email: "user1@example.com",
        name: "John Doe",
        companyName: "Tech Startup A",
        description: "Exciting projects and great team collaboration.",
        postDate: DateTime(2023, 4, 5),
        usefulBy: 15,
      ),
      Review(
        email: "user2@example.com",
        name: "Jane Smith",
        companyName: "Tech Startup B",
        description: "Good work-life balance and opportunities for growth.",
        postDate: DateTime(2023, 5, 10),
        usefulBy: 10,
      ),
    ],
  ),
  JobRole(
    description:
        "A Critical Care Nurse is a highly skilled healthcare professional who specializes in providing care for critically ill patients. They work in intensive care units (ICUs) and other critical care settings, monitoring patients' conditions, administering medications, and performing advanced medical procedures. Critical Care Nurses collaborate with other healthcare team members to develop and implement patient care plans, and they provide emotional support to patients and their families during challenging times.",
    jobTitle: "Critical Care Nurse",
    jobsPosted: {
      '2023-01-15': 10,
      '2023-02-20': 12,
      '2023-03-10': 8,
      '2023-04-05': 15,
      '2023-05-20': 18,
      '2023-06-10': 11,
      '2023-07-15': 20,
      '2023-08-20': 22,
      '2023-09-10': 13,
      '2023-10-05': 17,
      '2023-11-20': 10,
      '2023-12-10': 12,
      '2024-01-15': 14,
      '2024-02-20': 16,
      '2024-03-10': 18,
      '2024-04-05': 20,
      '2024-05-20': 22,
      '2024-06-10': 15,
      '2024-07-15': 18,
      '2024-08-20': 20,
      '2024-09-10': 22,
      '2024-10-05': 25,
      '2024-11-20': 20,
      '2024-12-10': 22,
      '2025-01-15': 25,
    },
    jobSalary: {
      '2023-01-15': 65000,
      '2023-02-20': 67000,
      '2023-03-10': 69000,
      '2023-04-05': 71000,
      '2023-05-20': 73000,
      '2023-06-10': 75000,
      '2023-07-15': 77000,
      '2023-08-20': 79000,
      '2023-09-10': 81000,
      '2023-10-05': 83000,
      '2023-11-20': 85000,
      '2023-12-10': 87000,
      '2024-01-15': 89000,
      '2024-02-20': 91000,
      '2024-03-10': 93000,
      '2024-04-05': 95000,
      '2024-05-20': 97000,
      '2024-06-10': 99000,
      '2024-07-15': 101000,
      '2024-08-20': 103000,
      '2024-09-10': 105000,
      '2024-10-05': 107000,
      '2024-11-20': 109000,
      '2024-12-10': 111000,
      '2025-01-15': 113000,
    },
    ratings: {
      'Work Life Balance': 4.5,
      'Career Growth': 4.0,
      'Job Satisfaction': 4.0,
      'Workload and Stress Level': 4.0,
    },
    averageSalary: 85000,
    skills: ['Critical Care', 'Patient Monitoring', 'Emergency Response'],
    ratingCount: 20,
    jobType: 'Full-time',
    keywords: ['Critical Care Nurse', 'Intensive Care', 'Healthcare'],
    jobNum: {
      '2023-01-15': 6001,
      '2023-02-20': 6002,
      '2023-03-10': 6003,
      '2023-04-05': 6004,
      '2023-05-20': 6005,
      '2023-06-10': 6006,
      '2023-07-15': 6007,
      '2023-08-20': 6008,
      '2023-09-10': 6009,
      '2023-10-05': 6010,
      '2023-11-20': 6011,
      '2023-12-10': 6012,
      '2024-01-15': 6013,
      '2024-02-20': 6014,
      '2024-03-10': 6015,
      '2024-04-05': 6016,
      '2024-05-20': 6017,
      '2024-06-10': 6018,
      '2024-07-15': 6019,
      '2024-08-20': 6020,
      '2024-09-10': 6021,
      '2024-10-05': 6022,
      '2024-11-20': 6023,
      '2024-12-10': 6024,
      '2025-01-15': 6025,
    },
    reviews: [
      Review(
        email: "user1@example.com",
        name: "John Doe",
        companyName: "Hospital X",
        description: "Great team and supportive work environment.",
        postDate: DateTime(2023, 4, 5),
        usefulBy: 15,
      ),
      Review(
        email: "user2@example.com",
        name: "Jane Smith",
        companyName: "Hospital Y",
        description: "Challenging but rewarding work.",
        postDate: DateTime(2023, 5, 10),
        usefulBy: 10,
      ),
    ],
  ),
];
