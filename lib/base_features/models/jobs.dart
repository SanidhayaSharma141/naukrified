class JobModel {
  dynamic title;
  dynamic location;
  dynamic companyName;
  dynamic description;
  dynamic qualifications;
  dynamic responsibilities;
  dynamic benefits;
  dynamic skills;
  dynamic thumbnail;
  dynamic candidates;
  dynamic extensions;
  dynamic salary;
  dynamic via;
  dynamic jobType; //internship, parttime, fulltime, job
  dynamic isRemote;
  dynamic id;
  dynamic url;

  JobModel({
    required this.title,
    required this.location,
    required this.salary,
    required this.benefits,
    required this.candidates,
    required this.companyName,
    required this.skills,
    required this.description,
    required this.isRemote,
    required this.jobType,
    required this.qualifications,
    required this.responsibilities,
    required this.via,
    required this.extensions,
    required this.thumbnail,
    required this.id,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'location': location,
      'companyName': companyName,
      'description': description,
      'qualifications': qualifications,
      'responsibilities': responsibilities,
      'benefits': benefits,
      'skills': skills,
      'jobType': jobType,
      'thumbnail': thumbnail,
      'candidates': candidates,
      'extensions': extensions,
      'via': via,
      'id': id,
      'url': url,
      'salary': salary,
    };
  }

  factory JobModel.mapToJobModel(Map<String, dynamic> map) {
    // print(map);
    return JobModel(
      title: map['title'] ?? "",
      jobType: map['jobType'] ?? "",
      candidates: map['candidates'] ?? [],
      isRemote: map['isRemote'] ?? true,
      location: map['location'] ?? "",
      companyName: map['companyName'] ?? "",
      salary: map['salary'] ?? 0,
      skills: map['skills'] ?? [],
      description: map['description'] ?? "",
      qualifications: map['qualifications'] ?? [],
      responsibilities: map['responsibilities'] ?? [],
      benefits: map['benefits'] ?? [],
      thumbnail: map['thumbnail'] ?? "",
      extensions: map['extensions'] ?? [],
      via: map['via'] ?? "",
      id: map['id'] ?? "",
      url: map['url'] ?? "",
    );
  }

  factory JobModel.fromJson(dynamic response) {
    final data = response;
    final List<dynamic> highlights =
        response["job_highlights"] as List<dynamic>;

    return JobModel(
      jobType: data["jobType"],
      isRemote: data["isRemote"],
      title: data["title"],
      salary: data["salary"],
      skills: data["skills"],
      candidates: data['candidates'],
      location: data["location"],
      benefits: highlights.length > 2
          ? highlights[2]["items"]
          : ['Good work life balance'],
      companyName: data["company_name"],
      description: data["description"],
      qualifications: highlights.isNotEmpty ? highlights[0]["items"] : '',
      responsibilities: highlights.length > 1
          ? highlights[1]["items"]
          : ['Lead a team of developers'],
      via: data["via"],
      extensions: data["extensions"],
      id: data["job_id"],
      url: data["related_links"][0]["link"],
      thumbnail: data["thumbnail"] ??
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYbC-cHTjuJ9UaREYgxWnkQSaJLfyY3PPK9Zl3A1Q&s',
    );
  }

  JobModel.empty();
}
