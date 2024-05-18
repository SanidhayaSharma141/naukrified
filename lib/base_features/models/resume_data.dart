import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naukrified/base_features/firebase/personal_details.dart';

Map<String, dynamic> convertTemplateDataToMap(TemplateData data) {
  return {
    'fullName': data.fullName,
    'currentPosition': data.currentPosition,
    'street': data.street,
    'address': data.address,
    'country': data.country,
    'email': data.email,
    'phoneNumber': data.phoneNumber,
    'bio': data.bio,
    'image': data.image,
    'backgroundImage': data.backgroundImage,
    'experience': convertExperiencetoMap(data.experience),
    'educationDetails': convertEducationToMap(data.educationDetails),
    'hobbies': data.hobbies,
    'languages': convertLanguageToMap(data.languages),
  };
}

List<Education> convertMapToEducation(List<dynamic> mappedEducations) {
  List<Education> educations = [];

  mappedEducations.forEach((map) {
    Education education = Education(
      map['schoolLevel'],
      map['schoolName'],
    );
    educations.add(education);
  });

  return educations;
}

List<Map<String, dynamic>>? convertEducationToMap(List<Education>? educations) {
  List<Map<String, dynamic>> mappedEducations = [];
  if (educations == null) {
    return null;
  }
  educations.forEach((education) {
    Map<String, dynamic> educationMap = {
      'schoolLevel': education.schoolLevel,
      'schoolName': education.schoolName,
    };
    mappedEducations.add(educationMap);
  });

  return mappedEducations;
}

List<Language> convertMapToLanguage(List<dynamic> mappedLanguages) {
  List<Language> languages = [];

  mappedLanguages.forEach((map) {
    Language language = Language(
      map['language'],
      map['level'],
    );
    languages.add(language);
  });

  return languages;
}

List<Map<String, dynamic>>? convertLanguageToMap(List<Language>? languages) {
  List<Map<String, dynamic>> mappedLanguages = [];
  if (languages == null) {
    return null;
  }
  languages.forEach((language) {
    Map<String, dynamic> languageMap = {
      'language': language.language,
      'level': language.level,
    };
    mappedLanguages.add(languageMap);
  });

  return mappedLanguages;
}

List<Map<String, dynamic>>? convertExperiencetoMap(
    List<ExperienceData>? experiences) {
  List<Map<String, dynamic>> mappedExperiences = [];
  if (experiences == null) {
    return null;
  }
  experiences.forEach((experience) {
    Map<String, dynamic> experienceMap = {
      'experienceTitle': experience.experienceTitle,
      'experiencePlace': experience.experiencePlace,
      'experiencePeriod': experience.experiencePeriod,
      'experienceLocation': experience.experienceLocation,
      'experienceDescription': experience.experienceDescription,
    };
    mappedExperiences.add(experienceMap);
  });

  return mappedExperiences;
}

List<ExperienceData> convertMapToExperience(List<dynamic> mappedExperiences) {
  List<ExperienceData> experiences = [];

  mappedExperiences.forEach((map) {
    ExperienceData experience = ExperienceData(
      experienceTitle: map['experienceTitle'],
      experiencePlace: map['experiencePlace'],
      experiencePeriod: map['experiencePeriod'],
      experienceLocation: map['experienceLocation'],
      experienceDescription: map['experienceDescription'],
    );
    experiences.add(experience);
  });

  return experiences;
}

TemplateData convertMapToTemplateData(Map<String, dynamic> map) {
  return TemplateData(
    fullName: map['fullName'],
    currentPosition: map['currentPosition'],
    street: map['street'],
    address: map['address'],
    country: map['country'],
    email: map['email'],
    phoneNumber: map['phoneNumber'],
    bio: map['bio'],
    image: map['image'],
    backgroundImage: map['backgroundImage'],
    experience: convertMapToExperience(map['experience']),
    educationDetails: convertMapToEducation(map['educationDetails']),
    hobbies: List<String>.from(map['hobbies']),
    languages: convertMapToLanguage(map['languages']),
  );
}

// // Provider for TemplateData
final templateDataProvider =
    StateNotifierProvider<TemplateDataNotifier, TemplateData>((ref) {
  return TemplateDataNotifier(TemplateData(
    fullName: '',
    currentPosition: '',
    street: '',
    address: '',
    country: '',
    email: '',
    phoneNumber: '',
    bio: '',
    image: '',
    backgroundImage: '',
    experience: [],
    educationDetails: [],
    hobbies: ["Cricket"],
    languages: [Language("English", 2)],
  ));
});

// final templateDataProvider = FutureProvider<TemplateData?>((ref) async {
//   final personalDetails = await getPersonalDetails();
//   if (personalDetails == null) {
//     return TemplateData(
//       fullName: '',
//       currentPosition: '',
//       street: '',
//       address: '',
//       country: '',
//       email: '',
//       phoneNumber: '',
//       bio: '',
//       image: '',
//       backgroundImage: '',
//       experience: [],
//       educationDetails: [],
//       hobbies: ["Cricket"],
//       languages: [Language("English", 2)],
//     );
//   }
//   return personalDetails;
// });

// State notifier class for TemplateData
class TemplateDataNotifier extends StateNotifier<TemplateData> {
  TemplateDataNotifier(TemplateData state) : super(state);
  void updateData(TemplateData data) {
    state = data;
  }

  void updateFullName(String newFullName) {
    state = TemplateData(
      fullName: newFullName,
      currentPosition: state.currentPosition,
      street: state.street,
      address: state.address,
      country: state.country,
      email: state.email,
      phoneNumber: state.phoneNumber,
      bio: state.bio,
      image: state.image,
      backgroundImage: state.backgroundImage,
      experience: state.experience,
      educationDetails: state.educationDetails,
      hobbies: state.hobbies,
      languages: state.languages,
    );
  }

  void updateCurrentPosition(String newPosition) {
    state = TemplateData(
      fullName: state.fullName,
      currentPosition: newPosition,
      street: state.street,
      address: state.address,
      country: state.country,
      email: state.email,
      phoneNumber: state.phoneNumber,
      bio: state.bio,
      image: state.image,
      backgroundImage: state.backgroundImage,
      experience: state.experience,
      educationDetails: state.educationDetails,
      hobbies: state.hobbies,
      languages: state.languages,
    );
  }

  void updateStreet(String newStreet) {
    state = TemplateData(
      fullName: state.fullName,
      currentPosition: state.currentPosition,
      street: newStreet,
      address: state.address,
      country: state.country,
      email: state.email,
      phoneNumber: state.phoneNumber,
      bio: state.bio,
      image: state.image,
      backgroundImage: state.backgroundImage,
      experience: state.experience,
      educationDetails: state.educationDetails,
      hobbies: state.hobbies,
      languages: state.languages,
    );
  }

  void updateAddress(String newAddress) {
    state = TemplateData(
      fullName: state.fullName,
      currentPosition: state.currentPosition,
      street: state.street,
      address: newAddress,
      country: state.country,
      email: state.email,
      phoneNumber: state.phoneNumber,
      bio: state.bio,
      image: state.image,
      backgroundImage: state.backgroundImage,
      experience: state.experience,
      educationDetails: state.educationDetails,
      hobbies: state.hobbies,
      languages: state.languages,
    );
  }

  void updateCountry(String newCountry) {
    state = TemplateData(
      fullName: state.fullName,
      currentPosition: state.currentPosition,
      street: state.street,
      address: state.address,
      country: newCountry,
      email: state.email,
      phoneNumber: state.phoneNumber,
      bio: state.bio,
      image: state.image,
      backgroundImage: state.backgroundImage,
      experience: state.experience,
      educationDetails: state.educationDetails,
      hobbies: state.hobbies,
      languages: state.languages,
    );
  }

  void updateEmail(String newEmail) {
    state = TemplateData(
      fullName: state.fullName,
      currentPosition: state.currentPosition,
      street: state.street,
      address: state.address,
      country: state.country,
      email: newEmail,
      phoneNumber: state.phoneNumber,
      bio: state.bio,
      image: state.image,
      backgroundImage: state.backgroundImage,
      experience: state.experience,
      educationDetails: state.educationDetails,
      hobbies: state.hobbies,
      languages: state.languages,
    );
  }

  void updatePhoneNumber(String newPhoneNumber) {
    state = TemplateData(
      fullName: state.fullName,
      currentPosition: state.currentPosition,
      street: state.street,
      address: state.address,
      country: state.country,
      email: state.email,
      phoneNumber: newPhoneNumber,
      bio: state.bio,
      image: state.image,
      backgroundImage: state.backgroundImage,
      experience: state.experience,
      educationDetails: state.educationDetails,
      hobbies: state.hobbies,
      languages: state.languages,
    );
  }

  void updateBio(String newBio) {
    state = TemplateData(
      fullName: state.fullName,
      currentPosition: state.currentPosition,
      street: state.street,
      address: state.address,
      country: state.country,
      email: state.email,
      phoneNumber: state.phoneNumber,
      bio: newBio,
      image: state.image,
      backgroundImage: state.backgroundImage,
      experience: state.experience,
      educationDetails: state.educationDetails,
      hobbies: state.hobbies,
      languages: state.languages,
    );
  }

  void updateImage(String newImage) {
    state = TemplateData(
      fullName: state.fullName,
      currentPosition: state.currentPosition,
      street: state.street,
      address: state.address,
      country: state.country,
      email: state.email,
      phoneNumber: state.phoneNumber,
      bio: state.bio,
      image: newImage,
      backgroundImage: state.backgroundImage,
      experience: state.experience,
      educationDetails: state.educationDetails,
      hobbies: state.hobbies,
      languages: state.languages,
    );
  }

  void updateBackgroundImage(String newBackgroundImage) {
    state = TemplateData(
      fullName: state.fullName,
      currentPosition: state.currentPosition,
      street: state.street,
      address: state.address,
      country: state.country,
      email: state.email,
      phoneNumber: state.phoneNumber,
      bio: state.bio,
      image: state.image,
      backgroundImage: newBackgroundImage,
      experience: state.experience,
      educationDetails: state.educationDetails,
      hobbies: state.hobbies,
      languages: state.languages,
    );
  }

  void updateExperience(List<ExperienceData> newExperience) {
    state = TemplateData(
      fullName: state.fullName,
      currentPosition: state.currentPosition,
      street: state.street,
      address: state.address,
      country: state.country,
      email: state.email,
      phoneNumber: state.phoneNumber,
      bio: state.bio,
      image: state.image,
      backgroundImage: state.backgroundImage,
      experience: newExperience,
      educationDetails: state.educationDetails,
      hobbies: state.hobbies,
      languages: state.languages,
    );
  }

  void updateEducationDetails(List<Education>? newEducationDetails) {
    state = TemplateData(
      fullName: state.fullName,
      currentPosition: state.currentPosition,
      street: state.street,
      address: state.address,
      country: state.country,
      email: state.email,
      phoneNumber: state.phoneNumber,
      bio: state.bio,
      image: state.image,
      backgroundImage: state.backgroundImage,
      experience: state.experience,
      educationDetails: newEducationDetails,
      hobbies: state.hobbies,
      languages: state.languages,
    );
  }

  void updateHobbies(List<String>? newHobbies) {
    state = TemplateData(
      fullName: state.fullName,
      currentPosition: state.currentPosition,
      street: state.street,
      address: state.address,
      country: state.country,
      email: state.email,
      phoneNumber: state.phoneNumber,
      bio: state.bio,
      image: state.image,
      backgroundImage: state.backgroundImage,
      experience: state.experience,
      educationDetails: state.educationDetails,
      hobbies: newHobbies,
      languages: state.languages,
    );
  }

  void updateLanguages(List<Language>? newLanguages) {
    state = TemplateData(
      fullName: state.fullName,
      currentPosition: state.currentPosition,
      street: state.street,
      address: state.address,
      country: state.country,
      email: state.email,
      phoneNumber: state.phoneNumber,
      bio: state.bio,
      image: state.image,
      backgroundImage: state.backgroundImage,
      experience: state.experience,
      educationDetails: state.educationDetails,
      hobbies: state.hobbies,
      languages: newLanguages,
    );
  }
}

// State notifier class for ExperienceData
class ExperienceDataNotifier extends StateNotifier<ExperienceData> {
  ExperienceDataNotifier(ExperienceData state) : super(state);

  void updateExperienceTitle(String newTitle) {
    state = ExperienceData(
      experienceTitle: newTitle,
      experiencePlace: state.experiencePlace,
      experiencePeriod: state.experiencePeriod,
      experienceLocation: state.experienceLocation,
      experienceDescription: state.experienceDescription,
    );
  }

  void updateExperiencePlace(String newPlace) {
    state = ExperienceData(
      experienceTitle: state.experienceTitle,
      experiencePlace: newPlace,
      experiencePeriod: state.experiencePeriod,
      experienceLocation: state.experienceLocation,
      experienceDescription: state.experienceDescription,
    );
  }

  void updateExperiencePeriod(String newPeriod) {
    state = ExperienceData(
      experienceTitle: state.experienceTitle,
      experiencePlace: state.experiencePlace,
      experiencePeriod: newPeriod,
      experienceLocation: state.experienceLocation,
      experienceDescription: state.experienceDescription,
    );
  }

  void updateExperienceLocation(String newLocation) {
    state = ExperienceData(
      experienceTitle: state.experienceTitle,
      experiencePlace: state.experiencePlace,
      experiencePeriod: state.experiencePeriod,
      experienceLocation: newLocation,
      experienceDescription: state.experienceDescription,
    );
  }

  void updateExperienceDescription(String newDescription) {
    state = ExperienceData(
      experienceTitle: state.experienceTitle,
      experiencePlace: state.experiencePlace,
      experiencePeriod: state.experiencePeriod,
      experienceLocation: state.experienceLocation,
      experienceDescription: newDescription,
    );
  }
}

// State notifier class for Education
class EducationNotifier extends StateNotifier<Education> {
  EducationNotifier(Education state) : super(state);

  void updateSchoolLevel(String newLevel) {
    state = Education(
      newLevel,
      state.schoolName,
    );
  }

  void updateSchoolName(String newName) {
    state = Education(
      state.schoolLevel,
      newName,
    );
  }
}

// State notifier class for Language
class LanguageNotifier extends StateNotifier<Language> {
  LanguageNotifier(Language state) : super(state);

  void updateLanguage(String newLanguage) {
    state = Language(
      newLanguage,
      state.level,
    );
  }

  void updateLevel(int newLevel) {
    state = Language(
      state.language,
      newLevel,
    );
  }
}
