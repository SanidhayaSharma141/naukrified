import 'package:uuid/uuid.dart';
import 'package:naukrified/base_features/models/jobs.dart';

var uuid = Uuid();
List<JobModel> sampleData = [
  // // JobModel( benefits: [
  //     "Competitive salary",
  //     "Health insurance",
  //     "Flexible work hours",
  //     "Opportunities for professional development"
  //   ],
  // //   title: "General Physician",
  // //   location: "Mumbai, Maharashtra",
  // //   companyName: "City Medical Clinic",
  // //   description:
  // //       "City Medical Clinic is seeking a General Physician to provide primary care services to patients. The ideal candidate will have excellent diagnostic and communication skills.",
  // //   qualifications: [
  // //     "Doctor of Medicine (MD) or equivalent degree",
  // //     "Valid medical license",
  // //     "Experience in primary care practice preferred",
  // //     "Strong diagnostic skills",
  // //     "Excellent communication and interpersonal skills",
  // //     "Ability to work in a fast-paced environment"
  // //   ],
  // //   responsibilities: [
  // //     "Conduct regular patient examinations",
  // //     "Diagnose and treat various acute and chronic illnesses",
  // //     "Prescribe appropriate medications and treatments",
  // //     "Provide preventive care and health education to patients",
  // //     "Collaborate with specialists as needed"
  // //   ],
  // //   benefits: [
  // //     "Competitive salary",
  // //     "Health insurance",
  // //     "Flexible work hours",
  // //     "Opportunities for professional development"
  // //   ],
  // //   skills: [
  // //     "Medical Diagnosis",
  // //     "Patient Care",
  // //     "Prescription Writing",
  // //     "Health Education",
  // //     "Communication",
  // //     "Interpersonal Skills"
  // //   ],
  // //   thumbnail:
  // //       "https://www.pngkey.com/png/full/90-902708_doctor-icon-png-transparent-images-doctor-icon-png.png",
  // //   candidates: [],
  // //   extensions: ["Full-time", "On-site"],
  // //   salary: 1500000,
  // //   via: "LinkedIn",
  // //   jobType: "Full-time",
  // //   isRemote: false,
  // //   id: uuid.v4(),
  // //   url: "https://citymedicalclinic.com",
  // // ),
  // // JobModel( benefits: [
  //     "Competitive salary",
  //     "Health insurance",
  //     "Flexible work hours",
  //     "Opportunities for professional development"
  //   ],
  // //   title: "Data Scientist",
  // //   location: "Bengaluru, Karnataka",
  // //   companyName: "TechData Solutions",
  // //   description:
  // //       "TechData Solutions is seeking a Data Scientist to analyze large datasets, develop predictive models, and extract actionable insights. The ideal candidate should have strong analytical skills and programming expertise.",
  // //   qualifications: [
  // //     "Master's or Ph.D. in Computer Science, Statistics, Mathematics, or related field",
  // //     "Proficiency in programming languages like Python, R, or Scala",
  // //     "Experience with machine learning algorithms and libraries (e.g., scikit-learn, TensorFlow)",
  // //     "Strong statistical analysis skills",
  // //     "Ability to manipulate and analyze complex, high-volume data from various sources",
  // //     "Excellent problem-solving skills",
  // //     "Good communication and presentation skills"
  // //   ],
  // //   responsibilities: [
  // //     "Analyze large datasets to identify trends, patterns, and correlations",
  // //     "Develop machine learning models for predictive and prescriptive analytics",
  // //     "Design and implement experiments to test hypotheses and improve model accuracy",
  // //     "Collaborate with cross-functional teams to deploy models into production",
  // //     "Communicate findings and insights to stakeholders in a clear and actionable manner"
  // //   ],
  // //   benefits: [
  // //     "Competitive salary",
  // //     "Health insurance",
  // //     "Flexible work hours",
  // //     "Opportunities for professional development"
  // //   ],
  // //   skills: [
  // //     "Python",
  // //     "R",
  // //     "Machine Learning",
  // //     "Statistical Analysis",
  // //     "Data Manipulation",
  // //     "Problem-solving",
  // //     "Communication"
  // //   ],
  // //   thumbnail:
  // //       "https://www.pngkey.com/png/full/241-2412533_machine-learning-icon.png",
  // //   candidates: [],
  // //   extensions: ["Full-time", "On-site"],
  // //   salary: 1500000,
  // //   via: "LinkedIn",
  // //   jobType: "Full-time",
  // //   isRemote: false,
  // //   id: uuid.v4(),
  // //   url: "https://techdatasolutions.com",
  // // ),
  // // JobModel( benefits: [
  //     "Competitive salary",
  //     "Health insurance",
  //     "Flexible work hours",
  //     "Opportunities for professional development"
  //   ],
  // //   title: "Senior Data Scientist",
  // //   location: "Mumbai, Maharashtra",
  // //   companyName: "Insightful Insights",
  // //   description:
  // //       "Insightful Insights is looking for a Senior Data Scientist to lead our data science initiatives. The ideal candidate will have extensive experience in data analysis, machine learning, and team leadership.",
  // //   qualifications: [
  // //     "Ph.D. in Computer Science, Statistics, Mathematics, or related field",
  // //     "5+ years of experience in data science or a related field",
  // //     "Expertise in machine learning algorithms and techniques",
  // //     "Experience in leading data science projects from conception to deployment",
  // //     "Strong programming skills in Python, R, or Scala",
  // //     "Excellent communication and leadership skills"
  // //   ],
  // //   responsibilities: [
  // //     "Lead a team of data scientists to develop and deploy machine learning models",
  // //     "Define project goals, scope, and timelines",
  // //     "Work closely with stakeholders to understand business requirements",
  // //     "Provide technical guidance and mentorship to junior team members",
  // //     "Stay updated with the latest trends and advancements in data science"
  // //   ],
  // //   benefits: [
  // //     "Competitive salary",
  // //     "Health insurance",
  // //     "Flexible work hours",
  // //     "Opportunities for professional development"
  // //   ],
  // //   skills: [
  // //     "Machine Learning",
  // //     "Leadership",
  // //     "Project Management",
  // //     "Python",
  // //     "Data Analysis",
  // //     "Communication",
  // //     "Problem-solving"
  // //   ],
  // //   thumbnail:
  // //       "https://www.pngkey.com/png/full/107-1072876_big-data-analytics-icon-png.png",
  // //   candidates: [],
  // //   extensions: ["Full-time", "On-site"],
  // //   salary: 2000000,
  // //   via: "Indeed",
  // //   jobType: "Full-time",
  // //   isRemote: false,
  // //   id: uuid.v4(),
  // //   url: "https://insightfulinsights.com",
  // // ),
  // // JobModel( benefits: [
  //     "Competitive salary",
  //     "Health insurance",
  //     "Flexible work hours",
  //     "Opportunities for professional development"
  //   ],
  // //   title: "Data Scientist - Healthcare Analytics",
  // //   location: "New Delhi, Delhi",
  // //   companyName: "HealthTech Innovations",
  // //   description:
  // //       "HealthTech Innovations is seeking a Data Scientist with expertise in healthcare analytics. The candidate will work on projects related to patient outcomes, population health, and healthcare operations.",
  // //   qualifications: [
  // //     "Master's or Ph.D. in Computer Science, Statistics, Mathematics, or related field",
  // //     "Experience in healthcare analytics or a related domain",
  // //     "Strong understanding of healthcare data sources and regulations (e.g., HIPAA)",
  // //     "Proficiency in programming languages like Python or R",
  // //     "Experience with healthcare databases and analytics tools (e.g., Epic, Tableau)",
  // //     "Excellent analytical and problem-solving skills",
  // //     "Good communication and collaboration skills"
  // //   ],
  // //   responsibilities: [
  // //     "Analyze healthcare data to identify trends, patterns, and insights",
  // //     "Develop predictive models for patient outcomes and disease prediction",
  // //     "Work with cross-functional teams to integrate analytics solutions into healthcare workflows",
  // //     "Ensure compliance with healthcare data privacy and security regulations",
  // //     "Communicate findings and recommendations to healthcare stakeholders"
  // //   ],
  // //   benefits: [
  // //     "Competitive salary",
  // //     "Health insurance",
  // //     "Flexible work hours",
  // //     "Opportunities for professional development"
  // //   ],
  // //   skills: [
  // //     "Healthcare Analytics",
  // //     "Python",
  // //     "Data Analysis",
  // //     "Predictive Modeling",
  // //     "Healthcare Databases",
  // //     "Communication",
  // //     "Problem-solving"
  // //   ],
  // //   thumbnail:
  // //       "https://www.kindpng.com/picc/m/178-1781727_big-data-png-transparent-png.png",
  // //   candidates: [],
  // //   extensions: ["Full-time", "On-site"],
  // //   salary: 1800000,
  // //   via: "Glassdoor",
  // //   jobType: "Full-time",
  // //   isRemote: false,
  // //   id: uuid.v4(),
  // //   url: "https://healthtechinnovations.com",
  // // ),
  // // JobModel( benefits: [
  //     "Competitive salary",
  //     "Health insurance",
  //     "Flexible work hours",
  //     "Opportunities for professional development"
  //   ],
  // //   title: "Machine Learning Engineer",
  // //   location: "Bengaluru, Karnataka",
  // //   companyName: "DataWorks AI",
  // //   description:
  // //       "DataWorks AI is hiring a Machine Learning Engineer to develop and deploy machine learning models for various applications. The candidate will work on cutting-edge projects in natural language processing, computer vision, and more.",
  // //   qualifications: [
  // //     "Bachelor's or Master's degree in Computer Science, Engineering, or related field",
  // //     "Experience in machine learning and deep learning techniques",
  // //     "Proficiency in programming languages like Python and TensorFlow",
  // //     "Experience with data preprocessing, feature engineering, and model evaluation",
  // //     "Strong problem-solving and analytical skills",
  // //     "Good understanding of software engineering principles"
  // //   ],
  // //   responsibilities: [
  // //     "Design and implement machine learning algorithms and models",
  // //     "Preprocess and analyze large datasets",
  // //     "Optimize models for performance and scalability",
  // //     "Deploy models into production environments",
  // //     "Collaborate with software engineers to integrate ML solutions into applications"
  // //   ],
  // //   benefits: [
  // //     "Competitive salary",
  // //     "Health insurance",
  // //     "Flexible work hours",
  // //     "Opportunities for professional development"
  // //   ],
  // //   skills: [
  // //     "Machine Learning",
  // //     "Deep Learning",
  // //     "Python",
  // //     "TensorFlow",
  // //     "Data Preprocessing",
  // //     "Problem-solving",
  // //     "Software Engineering"
  // //   ],
  // //   thumbnail:
  // //       "https://www.pinclipart.com/picdir/middle/536-5368757_machine-learning-icon-png-clipart.png",
  // //   candidates: [],
  // //   extensions: ["Full-time", "On-site"],
  // //   salary: 1600000,
  // //   via: "LinkedIn",
  // //   jobType: "Full-time",
  // //   isRemote: false,
  // //   id: uuid.v4(),
  // //   url: "https://dataworksai.com",
  // // ),
  // // JobModel( benefits: [
  //     "Competitive salary",
  //     "Health insurance",
  //     "Flexible work hours",
  //     "Opportunities for professional development"
  //   ],
  // //   title: "Data Scientist - Financial Services",
  // //   location: "Mumbai, Maharashtra",
  // //   companyName: "FinTech Analytics",
  // //   description:
  // //       "FinTech Analytics is looking for a Data Scientist to work on projects related to financial risk analysis, fraud detection, and customer segmentation. The candidate will play a key role in developing data-driven solutions for financial services.",
  // //   qualifications: [
  // //     "Master's or Ph.D. in Computer Science, Statistics, Mathematics, or related field",
  // //     "Experience in data analysis and modeling in the financial services industry",
  // //     "Proficiency in programming languages like Python or R",
  // //     "Strong understanding of financial data sources and metrics",
  // //     "Experience with statistical analysis and predictive modeling",
  // //     "Good understanding of financial regulations and compliance",
  // //     "Excellent communication and collaboration skills"
  // //   ],
  // //   responsibilities: [
  // //     "Analyze financial data to identify trends, patterns, and anomalies",
  // //     "Develop predictive models for risk assessment and fraud detection",
  // //     "Work with cross-functional teams to implement and deploy models",
  // //     "Conduct ad-hoc analysis to support business decisions",
  // //     "Communicate findings and insights to stakeholders"
  // //   ],
  // //   benefits: [
  // //     "Competitive salary",
  // //     "Health insurance",
  // //     "Flexible work hours",
  // //     "Opportunities for professional development"
  // //   ],
  // //   skills: [
  // //     "Financial Data Analysis",
  // //     "Python",
  // //     "R",
  // //     "Predictive Modeling",
  // //     "Risk Assessment",
  // //     "Communication",
  // //     "Collaboration"
  // //   ],
  // //   thumbnail:
  // //       "https://www.seekpng.com/png/full/971-9716620_making-it-rain-png-transparent-stock-big-data.png",
  // //   candidates: [],
  // //   extensions: ["Full-time", "On-site"],
  // //   salary: 1700000,
  // //   via: "Indeed",
  // //   jobType: "Full-time",
  // //   isRemote: false,
  // //   id: uuid.v4(),
  // //   url: "https://fintechanalytics.com",
  // // ),
  // // JobModel( benefits: [
  //     "Competitive salary",
  //     "Health insurance",
  //     "Flexible work hours",
  //     "Opportunities for professional development"
  //   ],
  // //     title: "Assistant Professor - Computer Science",
  // //     location: "Mumbai, Maharashtra",
  // //     companyName: "XYZ University",
  // //     description:
  // //         "XYZ University invites applications for the position of Assistant Professor in the Department of Computer Science. The successful candidate will be responsible for teaching undergraduate and graduate courses, conducting research, and participating in departmental activities.",
  // //     qualifications: [
  // //       "Ph.D. in Computer Science or a related field",
  // //       "Strong academic record and research potential",
  // //       "Experience in teaching undergraduate and graduate courses",
  // //       "Ability to supervise student research projects",
  // //       "Active research agenda in areas such as artificial intelligence, data science, or cybersecurity",
  // //       "Excellent communication and interpersonal skills"
  // //     ],
  // //     responsibilities: [
  // //       "Teach undergraduate and graduate courses in computer science",
  // //       "Supervise student research projects and theses",
  // //       "Conduct research and publish scholarly articles",
  // //       "Participate in departmental and university committees",
  // //       "Mentor and advise students"
  // //     ],
  // //     benefits: [
  // //       "Competitive salary",
  // //       "Research grants",
  // //       "Health insurance",
  // //       "Professional development opportunities"
  // //     ],
  // //     skills: [
  // //       "Teaching",
  // //       "Research",
  // //       "Computer Science",
  // //       "Artificial Intelligence",
  // //       "Data Science",
  // //       "Cybersecurity",
  // //       "Communication"
  // //     ],
  // //     thumbnail:
  // //         "https://www.freepnglogos.com/uploads/education-png/education-png-transparent-images-pictures-education-clipart-2.png",
  // //     candidates: [],
  // //     extensions: ["Full-time", "On-site"],
  // //     salary: 800000,
  // //     via: "LinkedIn",
  // //     jobType: "Full-time",
  // //     isRemote: false,
  // //     id: uuid.v4(),
  // //     url: "https://xyzuniversity.com",
  // //   ),
  // //   JobModel( benefits: [
  //     "Competitive salary",
  //     "Health insurance",
  //     "Flexible work hours",
  //     "Opportunities for professional development"
  //   ],
  // //     title: "Assistant Professor - Economics",
  // //     location: "New Delhi, Delhi",
  // //     companyName: "ABC University",
  // //     description:
  // //         "ABC University is seeking applications for the position of Assistant Professor in the Department of Economics. The successful candidate will teach undergraduate and graduate courses, engage in research, and contribute to departmental initiatives.",
  // //     qualifications: [
  // //       "Ph.D. in Economics or a related field",
  // //       "Evidence of research productivity and potential for future research",
  // //       "Experience in teaching economics courses at the undergraduate and graduate levels",
  // //       "Ability to teach courses in microeconomics, macroeconomics, and econometrics",
  // //       "Strong analytical and quantitative skills",
  // //       "Excellent communication and presentation skills"
  // //     ],
  // //     responsibilities: [
  // //       "Teach undergraduate and graduate courses in economics",
  // //       "Conduct research and publish scholarly articles",
  // //       "Supervise student research projects and theses",
  // //       "Participate in departmental seminars and events",
  // //       "Provide academic advising to students"
  // //     ],
  // //     benefits: [
  // //       "Competitive salary",
  // //       "Research support",
  // //       "Health insurance",
  // //       "Professional development opportunities"
  // //     ],
  // //     skills: [
  // //       "Teaching",
  // //       "Research",
  // //       "Economics",
  // //       "Microeconomics",
  // //       "Macroeconomics",
  // //       "Econometrics",
  // //       "Communication"
  // //     ],
  // //     thumbnail:
  // //         "https://icon-library.com/images/economics-icon/economics-icon-1.jpg",
  // //     candidates: [],
  // //     extensions: ["Full-time", "On-site"],
  // //     salary: 750000,
  // //     via: "Glassdoor",
  // //     jobType: "Full-time",
  // //     isRemote: false,
  // //     id: uuid.v4(),
  // //     url: "https://abcuniversity.com",
  // //   ),
  // //   JobModel( benefits: [
  //     "Competitive salary",
  //     "Health insurance",
  //     "Flexible work hours",
  //     "Opportunities for professional development"
  //   ],
  // //     title: "Assistant Professor - Mechanical Engineering",
  // //     location: "Chennai, Tamil Nadu",
  // //     companyName: "PQR Institute of Technology",
  // //     description:
  // //         "PQR Institute of Technology invites applications for the position of Assistant Professor in the Department of Mechanical Engineering. The ideal candidate will have a passion for teaching, research, and innovation.",
  // //     qualifications: [
  // //       "Ph.D. in Mechanical Engineering or a related field",
  // //       "Demonstrated expertise in the candidate's research area",
  // //       "Experience in teaching undergraduate and graduate courses",
  // //       "Ability to supervise student projects and theses",
  // //       "Strong communication and interpersonal skills",
  // //       "Evidence of scholarly publications and research grants"
  // //     ],
  // //     responsibilities: [
  // //       "Teach undergraduate and graduate courses in mechanical engineering",
  // //       "Conduct research and publish scholarly articles",
  // //       "Supervise student research projects and dissertations",
  // //       "Participate in departmental and institutional activities",
  // //       "Provide academic advising to students"
  // //     ],
  // //     benefits: [
  // //       "Competitive salary",
  // //       "Research grants",
  // //       "Health insurance",
  // //       "Professional development opportunities"
  // //     ],
  // //     skills: [
  // //       "Teaching",
  // //       "Research",
  // //       "Mechanical Engineering",
  // //       "Innovation",
  // //       "Project Supervision",
  // //       "Communication",
  // //       "Interpersonal Skills"
  // //     ],
  // //     thumbnail:
  // //         "https://www.pngitem.com/pimgs/m/213-2131005_engineering-icon-png-png-download-black-engineering-icon.png",
  // //     candidates: [],
  // //     extensions: ["Full-time", "On-site"],
  // //     salary: 850000,
  // //     via: "Naukri",
  // //     jobType: "Full-time",
  // //     isRemote: false,
  // //     id: uuid.v4(),
  // //     url: "https://pqrit.edu",
  // //   ),
  // //   JobModel( benefits: [
  //     "Competitive salary",
  //     "Health insurance",
  //     "Flexible work hours",
  //     "Opportunities for professional development"
  //   ],
  // //     title: "Assistant Professor - Psychology",
  // //     location: "Hyderabad, Telangana",
  // //     companyName: "LMN University",
  // //     description:
  // //         "LMN University seeks applicants for the position of Assistant Professor in the Department of Psychology. The successful candidate will teach undergraduate and graduate courses, engage in research, and provide academic advising.",
  // //     qualifications: [
  // //       "Ph.D. in Psychology or a related field",
  // //       "Experience in teaching psychology courses at the college level",
  // //       "Demonstrated research productivity",
  // //       "Ability to supervise student research projects",
  // //       "Expertise in a specific area of psychology (e.g., clinical psychology, social psychology)",
  // //       "Excellent communication and interpersonal skills"
  // //     ],
  // //     responsibilities: [
  // //       "Teach undergraduate and graduate courses in psychology",
  // //       "Conduct research and publish scholarly articles",
  // //       "Supervise student research projects and theses",
  // //       "Provide academic advising and mentorship to students",
  // //       "Participate in departmental and university committees"
  // //     ],
  // //     benefits: [
  // //       "Competitive salary",
  // //       "Research support",
  // //       "Health insurance",
  // //       "Professional development opportunities"
  // //     ],
  // //     skills: [
  // //       "Teaching",
  // //       "Research",
  // //       "Psychology",
  // //       "Clinical Psychology",
  // //       "Social Psychology",
  // //       "Communication",
  // //       "Interpersonal Skills"
  // //     ],
  // //     thumbnail:
  // //         "https://icon-library.com/images/psychology-icon/psychology-icon-3.jpg",
  // //     candidates: [],
  // //     extensions: ["Full-time", "On-site"],
  // //     salary: 700000,
  // //     via: "Indeed",
  // //     jobType: "Full-time",
  // //     isRemote: false,
  // //     id: uuid.v4(),
  // //     url: "https://lmnuniversity.edu",
  // //   ),
  // //   JobModel( benefits: [
  //     "Competitive salary",
  //     "Health insurance",
  //     "Flexible work hours",
  //     "Opportunities for professional development"
  //   ],
  // //     title: "Assistant Professor - Civil Engineering",
  // //     location: "Bengaluru, Karnataka",
  // //     companyName: "RST University",
  // //     description:
  // //         "RST University is hiring an Assistant Professor in the Department of Civil Engineering. The successful candidate will have a strong commitment to teaching, research, and academic excellence.",
  // //     qualifications: [
  // //       "Ph.D. in Civil Engineering or a related field",
  // //       "Experience in teaching undergraduate and graduate courses",
  // //       "Active research agenda with publications in reputable journals",
  // //       "Expertise in a specific area of civil engineering (e.g., structural engineering, transportation engineering)",
  // //       "Ability to supervise student projects and theses",
  // //       "Excellent communication and interpersonal skills"
  // //     ],
  // //     responsibilities: [
  // //       "Teach undergraduate and graduate courses in civil engineering",
  // //       "Conduct research and publish scholarly articles",
  // //       "Supervise student research projects and dissertations",
  // //       "Participate in departmental and institutional activities",
  // //       "Provide academic advising to students"
  // //     ],
  // //     benefits: [
  // //       "Competitive salary",
  // //       "Research grants",
  // //       "Health insurance",
  // //       "Professional development opportunities"
  // //     ],
  // //     skills: [
  // //       "Teaching",
  // //       "Research",
  // //       "Civil Engineering",
  // //       "Structural Engineering",
  // //       "Transportation Engineering",
  // //       "Communication",
  // //       "Interpersonal Skills"
  // //     ],
  // //     thumbnail:
  // //         "https://www.kindpng.com/picc/m/166-1668620_civil-engineering-png-transparent-png.png",
  // //     candidates: [],
  // //     extensions: ["Full-time", "On-site"],
  // //     salary: 820000,
  // //     via: "Glassdoor",
  // //     jobType: "Full-time",
  // //     isRemote: false,
  // //     id: uuid.v4(),
  // //     url: "https://rstuniversity.edu",
  // //   ),
  // // JobModel( benefits: [
  //     "Competitive salary",
  //     "Health insurance",
  //     "Flexible work hours",
  //     "Opportunities for professional development"
  //   ],
  // //   title: "Registered Nurse",
  // //   location: "New Delhi, Delhi",
  // //   companyName: "Metro Hospital",
  // //   description:
  // //       "Metro Hospital is hiring Registered Nurses to provide patient care in various hospital units. The ideal candidates should be compassionate, detail-oriented, and possess strong clinical skills.",
  // //   qualifications: [
  // //     "Bachelor of Science in Nursing (BSN) or equivalent degree",
  // //     "Valid nursing license",
  // //     "Experience in a hospital setting preferred",
  // //     "Knowledge of medical equipment and procedures",
  // //     "Ability to multitask and work under pressure",
  // //     "Excellent communication and organizational skills"
  // //   ],
  // //   responsibilities: [
  // //     "Assess patients' health status",
  // //     "Administer medications and treatments",
  // //     "Monitor patients' conditions and vital signs",
  // //     "Assist doctors during medical procedures",
  // //     "Provide emotional support and education to patients and their families"
  // //   ],
  // //   benefits: [
  // //     "Competitive salary",
  // //     "Health insurance",
  // //     "Flexible work hours",
  // //     "Opportunities for professional development"
  // //   ],
  // //   skills: [
  // //     "Patient Care",
  // //     "Medication Administration",
  // //     "Vital Sign Monitoring",
  // //     "Medical Procedures",
  // //     "Emotional Support",
  // //     "Communication",
  // //     "Organization"
  // //   ],
  // //   thumbnail:
  // //       "https://icon-library.com/images/nurse-icon-png/nurse-icon-png-7.jpg",
  // //   candidates: [],
  // //   extensions: ["Full-time", "On-site"],
  // //   salary: 800000,
  // //   via: "Naukri",
  // //   jobType: "Full-time",
  // //   isRemote: false,
  // //   id: uuid.v4(),
  // //   url: "https://metrohospital.com",
  // // ),
  // // JobModel( benefits: [
  //     "Competitive salary",
  //     "Health insurance",
  //     "Flexible work hours",
  //     "Opportunities for professional development"
  //   ],
  // //   title: "Medical Laboratory Technician",
  // //   location: "Chennai, Tamil Nadu",
  // //   companyName: "LabGenix Diagnostics",
  // //   description:
  // //       "LabGenix Diagnostics is looking for a Medical Laboratory Technician to perform laboratory tests and analyses on patient samples. The ideal candidate will have strong technical skills and attention to detail.",
  // //   qualifications: [
  // //     "Bachelor's degree in Medical Laboratory Technology or related field",
  // //     "Certification as a Medical Laboratory Technician",
  // //     "Experience working in a medical laboratory preferred",
  // //     "Knowledge of laboratory equipment and procedures",
  // //     "Ability to follow strict safety and quality control protocols",
  // //     "Good analytical and problem-solving skills"
  // //   ],
  // //   responsibilities: [
  // //     "Collect and analyze samples such as blood, urine, and tissue",
  // //     "Perform tests and examinations on samples",
  // //     "Maintain laboratory equipment and instruments",
  // //     "Document and report test results accurately",
  // //     "Ensure compliance with safety and quality control standards"
  // //   ],
  // //   benefits: [
  // //     "Competitive salary",
  // //     "Health insurance",
  // //     "Flexible work hours",
  // //     "Opportunities for professional development"
  // //   ],
  // //   skills: [
  // //     "Laboratory Testing",
  // //     "Sample Collection",
  // //     "Instrument Maintenance",
  // //     "Quality Control",
  // //     "Analytical Skills",
  // //     "Problem-solving",
  // //     "Attention to Detail"
  // //   ],
  // //   thumbnail: "https://www.pngkit.com/png/full/281-2813741_lab-icon-png.png",
  // //   candidates: [],
  // //   extensions: ["Full-time", "On-site"],
  // //   salary: 600000,
  // //   via: "Indeed",
  // //   jobType: "Full-time",
  // //   isRemote: false,
  // //   id: uuid.v4(),
  // //   url: "https://labgenixdiagnostics.com",
  // // ),
  // // JobModel( benefits: [
  //     "Competitive salary",
  //     "Health insurance",
  //     "Flexible work hours",
  //     "Opportunities for professional development"
  //   ],
  // //   title: "Physiotherapist",
  // //   location: "Kolkata, West Bengal",
  // //   companyName: "HealthFit Physiotherapy Center",
  // //   description:
  // //       "HealthFit Physiotherapy Center is seeking a Physiotherapist to help patients recover from injuries, illnesses, and surgery. The ideal candidate will have strong clinical skills and empathy towards patients.",
  // //   qualifications: [
  // //     "Bachelor's degree in Physiotherapy",
  // //     "Valid physiotherapy license",
  // //     "Experience in a clinical setting preferred",
  // //     "Knowledge of therapeutic exercises and modalities",
  // //     "Ability to create personalized treatment plans",
  // //     "Excellent communication and interpersonal skills"
  // //   ],
  // //   responsibilities: [
  // //     "Assess patients' physical condition and needs",
  // //     "Develop and implement individualized treatment plans",
  // //     "Administer therapeutic exercises and modalities",
  // //     "Educate patients and their families on self-care techniques",
  // //     "Monitor patients' progress and adjust treatment plans as needed"
  // //   ],
  // //   benefits: [
  // //     "Competitive salary",
  // //     "Health insurance",
  // //     "Flexible work hours",
  // //     "Opportunities for professional development"
  // //   ],
  // //   skills: [
  // //     "Physical Assessment",
  // //     "Treatment Planning",
  // //     "Therapeutic Exercises",
  // //     "Modalities",
  // //     "Patient Education",
  // //     "Communication",
  // //     "Empathy"
  // //   ],
  // //   thumbnail:
  // //       "https://www.freepnglogos.com/uploads/physical-therapy-png/physical-therapy-vancouver-pros-4.png",
  // //   candidates: [],
  // //   extensions: ["Full-time", "On-site"],
  // //   salary: 700000,
  // //   via: "Glassdoor",
  // //   jobType: "Full-time",
  // //   isRemote: false,
  // //   id: uuid.v4(),
  // //   url: "https://healthfitphysio.com",
  // // ),
  // // JobModel( benefits: [
  //     "Competitive salary",
  //     "Health insurance",
  //     "Flexible work hours",
  //     "Opportunities for professional development"
  //   ],
  // //   title: "Medical Transcriptionist",
  // //   location: "Bengaluru, Karnataka",
  // //   companyName: "MediTranscribe Services",
  // //   description:
  // //       "MediTranscribe Services is hiring Medical Transcriptionists to convert voice-recorded medical reports into written documents. The ideal candidates should have excellent listening and typing skills.",
  // //   qualifications: [
  // //     "Certificate or diploma in Medical Transcription",
  // //     "Experience in medical transcription preferred",
  // //     "Knowledge of medical terminology and abbreviations",
  // //     "Excellent listening and typing skills",
  // //     "Familiarity with transcription software",
  // //     "Attention to detail and accuracy"
  // //   ],
  // //   responsibilities: [
  // //     "Listen to recorded medical reports and transcribe them accurately",
  // //     "Edit transcribed reports for grammar and clarity",
  // //     "Translate medical abbreviations and jargon into their expanded forms",
  // //     "Ensure compliance with HIPAA regulations and confidentiality standards",
  // //     "Meet productivity and quality targets"
  // //   ],
  // //   benefits: [
  // //     "Competitive salary",
  // //     "Health insurance",
  // //     "Flexible work hours",
  // //     "Opportunities for professional development"
  // //   ],
  // //   skills: [
  // //     "Medical Transcription",
  // //     "Listening",
  // //     "Typing",
  // //     "Medical Terminology",
  // //     "Transcription Software",
  // //     "Attention to Detail",
  // //     "Confidentiality"
  // //   ],
  // //   thumbnail:
  // //       "https://icons-for-free.com/iconfiles/png/512/doctor+icon+md+healthcare+medical+medicine+icon-1320184132109143681.png",
  // //   candidates: [],
  // //   extensions: ["Full-time", "On-site"],
  // //   salary: 500000,
  // //   via: "Naukri",
  // //   jobType: "Full-time",
  // //   isRemote: false,
  // //   id: uuid.v4(),
  // //   url: "https://meditranscribeservices.com",
  // // ),
  // // JobModel( benefits: [
  //     "Competitive salary",
  //     "Health insurance",
  //     "Flexible work hours",
  //     "Opportunities for professional development"
  //   ],
  // //   title: "Data Analyst",
  // //   location: "Bengaluru, Karnataka",
  // //   companyName: "DataTech Solutions",
  // //   description:
  // //       "DataTech Solutions is looking for a skilled Data Analyst to interpret data, analyze results, and provide insights to support business decisions.",
  // //   qualifications: [
  // //     "Bachelor's or Master's degree in Statistics, Mathematics, Economics, Computer Science, or related field",
  // //     "Proficiency in SQL and Excel",
  // //     "Experience with statistical analysis tools such as R or Python",
  // //     "Strong analytical skills with the ability to collect, organize, analyze, and disseminate significant amounts of information with attention to detail and accuracy",
  // //     "Familiarity with data visualization tools such as Tableau or Power BI",
  // //     "Good communication skills"
  // //   ],
  // //   responsibilities: [
  // //     "Interpret data, analyze results using statistical techniques, and provide ongoing reports",
  // //     "Develop and implement databases, data collection systems, data analytics, and other strategies that optimize statistical efficiency and quality",
  // //     "Acquire data from primary or secondary data sources and maintain databases/data systems",
  // //     "Identify, analyze, and interpret trends or patterns in complex data sets",
  // //     "Work closely with management to prioritize business and information needs"
  // //   ],
  // //   benefits: [
  // //     "Competitive salary",
  // //     "Health insurance",
  // //     "Flexible work hours",
  // //     "Opportunities for professional development"
  // //   ],
  // //   skills: [
  // //     "SQL",
  // //     "Excel",
  // //     "R",
  // //     "Python",
  // //     "Data Visualization",
  // //     "Statistical Analysis",
  // //     "Communication"
  // //   ],
  // //   thumbnail:
  // //       "https://www.pngkey.com/png/full/241-2412533_machine-learning-icon.png",
  // //   candidates: [],
  // //   extensions: ["Full-time", "On-site"],
  // //   salary: 800000,
  // //   via: "LinkedIn",
  // //   jobType: "Full-time",
  // //   isRemote: false,
  // //   id: uuid.v4(),
  // //   url: "https://datatechsolutions.com",
  // // ),
  // // JobModel( benefits: [
  //     "Competitive salary",
  //     "Health insurance",
  //     "Flexible work hours",
  //     "Opportunities for professional development"
  //   ],
  // //   title: "UI/UX Designer",
  // //   location: "Mumbai, Maharashtra",
  // //   companyName: "DesignHub Solutions",
  // //   description:
  // //       "DesignHub Solutions is seeking a talented UI/UX Designer to create amazing user experiences. The ideal candidate should have an eye for clean and artful design, possess superior UI/UX skills, and be able to translate high-level requirements into interaction flows and artifacts.",
  // //   qualifications: [
  // //     "Bachelor's or Master's degree in Design, Fine Arts, or related field",
  // //     "Proven UI/UX design experience with a strong portfolio",
  // //     "Proficiency in Adobe XD, Sketch, or other visual design and wire-framing tools",
  // //     "Up-to-date with the latest UI/UX trends, techniques, and technologies",
  // //     "Experience working in an Agile/Scrum development process",
  // //     "Excellent visual design skills with sensitivity to user-system interaction",
  // //     "Ability to solve problems creatively and effectively"
  // //   ],
  // //   responsibilities: [
  // //     "Gather and evaluate user requirements in collaboration with product managers and engineers",
  // //     "Illustrate design ideas using storyboards, process flows, and sitemaps",
  // //     "Design graphic user interface elements, like menus, tabs, and widgets",
  // //     "Develop UI mockups and prototypes that clearly illustrate how sites function and look",
  // //     "Create original graphic designs (e.g., images, sketches, and tables)"
  // //   ],
  // //   benefits: [
  // //     "Competitive salary",
  // //     "Health insurance",
  // //     "Flexible work hours",
  // //     "Opportunities for professional development"
  // //   ],
  // //   skills: [
  // //     "UI/UX Design",
  // //     "Adobe XD",
  // //     "Sketch",
  // //     "Wireframing",
  // //     "User Research",
  // //     "Agile/Scrum",
  // //     "Creativity"
  // //   ],
  // //   thumbnail:
  // //       "https://www.kindpng.com/picc/m/176-1766683_free-ux-ux-ui-icon-png-transparent-png.png",
  // //   candidates: [],
  // //   extensions: ["Full-time", "On-site"],
  // //   salary: 1000000,
  // //   via: "Indeed",
  // //   jobType: "Full-time",
  // //   isRemote: false,
  // //   id: uuid.v4(),
  // //   url: "https://designhubsolutions.com",
  // // ),
  // // JobModel( benefits: [
  //     "Competitive salary",
  //     "Health insurance",
  //     "Flexible work hours",
  //     "Opportunities for professional development"
  //   ],
  // //   title: "Network Engineer",
  // //   location: "New Delhi, Delhi",
  // //   companyName: "NetworkGenius Technologies",
  // //   description:
  // //       "NetworkGenius Technologies is looking for a Network Engineer to design, implement, maintain, and support our growing network infrastructure.",
  // //   qualifications: [
  // //     "Bachelor's or Master's degree in Computer Science, Information Technology, or related field",
  // //     "Proven hands-on network engineering experience",
  // //     "Deep understanding of networking protocols (e.g., IPSEC, HSRP, BGP, OSPF, 802.11, QoS)",
  // //     "Solid understanding of network operating systems (JUNOS, Cisco IOS)",
  // //     "Ability to implement, administer, and troubleshoot network infrastructure devices, including firewalls, switches, and routers",
  // //     "Experience with network diagnostic, monitoring, and analysis tools",
  // //     "Good communication and interpersonal skills"
  // //   ],
  // //   responsibilities: [
  // //     "Design and implement new network solutions and/or improve the efficiency of current networks",
  // //     "Monitor network performance and troubleshoot problems",
  // //     "Secure network systems by establishing and enforcing policies, and defining and monitoring access",
  // //     "Support and administer firewall environments in line with IT security policy",
  // //     "Upgrade data network equipment to the latest stable firmware releases"
  // //   ],
  // //   benefits: [
  // //     "Competitive salary",
  // //     "Health insurance",
  // //     "Flexible work hours",
  // //     "Opportunities for professional development"
  // //   ],
  // //   skills: [
  // //     "Network Engineering",
  // //     "Networking Protocols",
  // //     "Cisco IOS",
  // //     "Firewall Configuration",
  // //     "Network Monitoring",
  // //     "Troubleshooting",
  // //     "Interpersonal Skills"
  // //   ],
  // //   thumbnail:
  // //       "https://icon-library.com/images/network-icon-png/network-icon-png-2.jpg",
  // //   candidates: [],
  // //   extensions: ["Full-time", "On-site"],
  // //   salary: 900000,
  // //   via: "Naukri",
  // //   jobType: "Full-time",
  // //   isRemote: false,
  // //   id: uuid.v4(),
  // //   url: "https://networkgeniustech.com",
  // // ),
  // // JobModel( benefits: [
  //     "Competitive salary",
  //     "Health insurance",
  //     "Flexible work hours",
  //     "Opportunities for professional development"
  //   ],
  // //   title: "Content Writer",
  // //   location: "Chennai, Tamil Nadu",
  // //   companyName: "WordCraft Content Solutions",
  // //   description:
  // //       "WordCraft Content Solutions is looking for a talented Content Writer to create compelling blog posts, white papers, product descriptions, social media content, and web copy.",
  // //   qualifications: [
  // //     "Bachelor's or Master's degree in English, Journalism, Communications, or related field",
  // //     "Proven content writing or copywriting experience",
  // //     "Excellent writing and editing skills in English",
  // //     "Experience with SEO and keyword research",
  // //     "Familiarity with content management systems (WordPress, Joomla)",
  // //     "Ability to meet deadlines and work independently",
  // //     "Good communication and research skills"
  // //   ],
  // //   responsibilities: [
  // //     "Write clear, attractive copy with a distinct voice",
  // //     "Interpret copywriting briefs to understand project requirements",
  // //     "Conduct high-quality research and interviews",
  // //     "Edit and proofread copy as needed",
  // //     "Use SEO principles to maximize copy's reach"
  // //   ],
  // //   benefits: [
  // //     "Competitive salary",
  // //     "Health insurance",
  // //     "Flexible work hours",
  // //     "Opportunities for professional development"
  // //   ],
  // //   skills: [
  // //     "Content Writing",
  // //     "Copywriting",
  // //     "SEO",
  // //     "Editing",
  // //     "Research",
  // //     "WordPress",
  // //     "Communication"
  // //   ],
  // //   thumbnail:
  // //       "https://images.vexels.com/media/users/3/157517/isolated/lists/6d256716b26f0b415d16735f5dab19f1-gearwheel-settings-outline-icon.png",
  // //   candidates: [],
  // //   extensions: ["Full-time", "On-site"],
  // //   salary: 600000,
  // //   via: "Glassdoor",
  // //   jobType: "Full-time",
  // //   isRemote: false,
  // //   id: uuid.v4(),
  // //   url: "https://wordcraftcontents.com",
  // // ),
  // // JobModel( benefits: [
  //     "Competitive salary",
  //     "Health insurance",
  //     "Flexible work hours",
  //     "Opportunities for professional development"
  //   ],
  // //   title: "Mobile App Developer",
  // //   location: "Pune, Maharashtra",
  // //   companyName: "AppGenius Solutions",
  // //   description:
  // //       "AppGenius Solutions is seeking a skilled Mobile App Developer to design, develop, and maintain high-quality mobile applications for both iOS and Android platforms.",
  // //   qualifications: [
  // //     "Bachelor's or Master's degree in Computer Science, Engineering, or related field",
  // //     "Proven work experience as a Mobile App Developer",
  // //     "Experience with Flutter, React Native, or native Android/iOS development",
  // //     "Strong knowledge of UI/UX principles",
  // //     "Experience with third-party libraries and APIs",
  // //     "Understanding of Agile development methodologies",
  // //     "Excellent analytical skills and problem-solving abilities"
  // //   ],
  // //   responsibilities: [
  // //     "Design and build advanced applications for the iOS and Android platforms",
  // //     "Collaborate with cross-functional teams to define, design, and ship new features",
  // //     "Unit-test code for robustness, including edge cases, usability, and general reliability",
  // //     "Work on bug fixing and improving application performance",
  // //     "Continuously discover, evaluate, and implement new technologies to maximize development efficiency"
  // //   ],
  //   // benefits: [
  //   //   "Competitive salary",
  //   //   "Health insurance",
  //   //   "Flexible work hours",
  //   //   "Opportunities for professional development"
  //   // ],
  // //   skills: [
  // //     "Mobile App Development",
  // //     "Flutter",
  // //     "React Native",
  // //     "iOS Development",
  // //     "Android Development",
  // //     "UI/UX Design",
  // //     "Agile Methodologies"
  // //   ],
  // //   thumbnail:
  // //       "https://www.kindpng.com/picc/m/79-798812_mobile-application-development-mobile-app-development-icon-png.png",
  // //   candidates: [],
  // //   extensions: ["Full-time", "On-site"],
  // //   salary: 1100000,
  // //   via: "LinkedIn",
  // //   jobType: "Full-time",
  // //   isRemote: false,
  // //   id: uuid.v4(),
  // //   url: "https://appgeniussolutions.com",
  // ),
  //
  JobModel(
    title: "Registered Nurse",
    location: "Mumbai, Maharashtra, India",
    companyName: "Metro Hospital",
    description:
        "Metro Hospital is seeking a Registered Nurse to provide compassionate and high-quality patient care. The ideal candidate should have a strong background in nursing, excellent communication skills, and a passion for helping others.",
    qualifications: [
      "Bachelor's degree in Nursing",
      "Valid nursing license from the Indian Nursing Council",
      "Minimum 2 years of experience as a Registered Nurse",
      "Knowledge of medical terminology and procedures",
      "Strong interpersonal and communication skills",
      "Ability to work in a fast-paced environment",
      "Basic computer skills"
    ],
    responsibilities: [
      "Assess patient health problems and needs",
      "Develop and implement nursing care plans",
      "Provide direct patient care, including administering medications and treatments",
      "Monitor and record patient vital signs and medical information",
      "Educate patients and their families about health conditions and treatments",
      "Collaborate with healthcare professionals to ensure optimal patient care"
    ],
    benefits: [
      "Competitive salary",
      "Health insurance",
      "Paid time off",
      "Opportunities for career advancement",
      "Continuing education opportunities"
    ],
    skills: [
      "Patient Care",
      "Medical Terminology",
      "Nursing Care Planning",
      "Medication Administration",
      "Health Education",
      "Interpersonal Skills",
      "Teamwork"
    ],
    thumbnail:
        "https://www.pngkey.com/png/full/241-2412533_machine-learning-icon.png",
    candidates: [],
    extensions: ["Full-time", "On-site"],
    salary: 400000,
    via: "LinkedIn",
    jobType: "Full-time",
    isRemote: false,
    id: uuid.v4(),
    url: "https://metrohospital.com",
  ),
  JobModel(
    title: "Staff Nurse",
    location: "New Delhi, India",
    companyName: "Capital Care Hospital",
    description:
        "Capital Care Hospital is hiring Staff Nurses to provide nursing care to patients and support medical staff in delivering healthcare services. The ideal candidate should be empathetic, detail-oriented, and able to work in a dynamic healthcare environment.",
    qualifications: [
      "Diploma or Bachelor's degree in Nursing",
      "Registered Nurse license from the Indian Nursing Council",
      "Minimum 1 year of experience as a Staff Nurse",
      "Knowledge of medical equipment and procedures",
      "Excellent observation and critical thinking skills",
      "Ability to handle emergencies calmly and efficiently",
      "Good documentation and record-keeping skills"
    ],
    responsibilities: [
      "Assess and monitor patient conditions",
      "Administer medications and treatments as prescribed",
      "Assist doctors and medical staff during procedures",
      "Provide emotional support and comfort to patients and their families",
      "Maintain accurate patient records and charts",
      "Ensure compliance with hospital policies and protocols"
    ],
    benefits: [
      "Competitive salary",
      "Health insurance",
      "Paid sick leave",
      "Professional development opportunities",
      "Employee assistance program"
    ],
    skills: [
      "Patient Care",
      "Medical Procedures",
      "Medication Administration",
      "Critical Thinking",
      "Emotional Support",
      "Documentation",
      "Teamwork"
    ],
    thumbnail:
        "https://www.pngkey.com/png/full/241-2412533_machine-learning-icon.png",
    candidates: [],
    extensions: ["Full-time", "On-site"],
    salary: 350000,
    via: "LinkedIn",
    jobType: "Full-time",
    isRemote: false,
    id: uuid.v4(),
    url: "https://capitalcarehospital.com",
  ),
  JobModel(
    title: "ICU Nurse",
    location: "Bengaluru, Karnataka, India",
    companyName: "LifeLine Hospital",
    description:
        "LifeLine Hospital is looking for ICU Nurses to provide specialized care to critically ill patients in the Intensive Care Unit. The ideal candidate should have advanced nursing skills, experience in critical care, and the ability to work under pressure.",
    qualifications: [
      "Bachelor's or Master's degree in Nursing",
      "Registered Nurse license from the Indian Nursing Council",
      "Minimum 2 years of experience in ICU nursing",
      "Advanced Cardiac Life Support (ACLS) certification",
      "Basic Life Support (BLS) certification",
      "Strong understanding of ventilator management and hemodynamic monitoring",
      "Excellent decision-making and problem-solving skills"
    ],
    responsibilities: [
      "Monitor and assess critically ill patients in the ICU",
      "Administer medications and treatments as per physician orders",
      "Operate and monitor medical equipment, including ventilators and infusion pumps",
      "Collaborate with the multidisciplinary team to develop and implement care plans",
      "Provide emotional support and comfort to patients and their families",
      "Participate in emergency response and code blue situations"
    ],
    benefits: [
      "Competitive salary",
      "Health insurance",
      "Shift differentials",
      "Paid vacation and holidays",
      "Continuing education reimbursement"
    ],
    skills: [
      "Critical Care Nursing",
      "Ventilator Management",
      "Advanced Cardiac Life Support",
      "Hemodynamic Monitoring",
      "Emergency Response",
      "Decision-making",
      "Interpersonal Skills"
    ],
    thumbnail:
        "https://www.pngkey.com/png/full/241-2412533_machine-learning-icon.png",
    candidates: [],
    extensions: ["Full-time", "On-site"],
    salary: 450000,
    via: "LinkedIn",
    jobType: "Full-time",
    isRemote: false,
    id: uuid.v4(),
    url: "https://lifelinehospital.com",
  ),
  JobModel(
    title: "Home Health Nurse",
    location: "Chennai, Tamil Nadu, India",
    companyName: "CareWell Home Healthcare",
    description:
        "CareWell Home Healthcare is seeking Home Health Nurses to provide skilled nursing care to patients in their homes. The ideal candidate should have experience in home healthcare, strong assessment skills, and a compassionate demeanor.",
    qualifications: [
      "Diploma or Bachelor's degree in Nursing",
      "Registered Nurse license from the Indian Nursing Council",
      "Minimum 1 year of experience in home healthcare or community nursing",
      "Knowledge of home care procedures and techniques",
      "Excellent assessment and communication skills",
      "Ability to work independently and manage time effectively",
      "Compassionate and patient-centered approach"
    ],
    responsibilities: [
      "Conduct initial assessments and develop individualized care plans",
      "Administer medications and treatments as prescribed",
      "Provide wound care, IV therapy, and other skilled nursing services",
      "Educate patients and families on disease management and self-care",
      "Monitor patient progress and report changes to the healthcare team",
      "Coordinate with other healthcare professionals and community resources"
    ],
    benefits: [
      "Competitive salary",
      "Health insurance",
      "Flexible scheduling",
      "Mileage reimbursement",
      "Work-life balance"
    ],
    skills: [
      "Home Healthcare",
      "Assessment",
      "Medication Administration",
      "Wound Care",
      "Patient Education",
      "Interpersonal Skills",
      "Time Management"
    ],
    thumbnail:
        "https://www.pngkey.com/png/full/241-2412533_machine-learning-icon.png",
    candidates: [],
    extensions: ["Full-time", "On-site"],
    salary: 380000,
    via: "LinkedIn",
    jobType: "Full-time",
    isRemote: false,
    id: uuid.v4(),
    url: "https://carewellhomehealthcare.com",
  ),
  JobModel(
    title: "Pediatric Nurse",
    location: "Hyderabad, Telangana, India",
    companyName: "Tiny Tots Hospital",
    description:
        "Tiny Tots Hospital is hiring Pediatric Nurses to provide specialized care to children of all ages. The ideal candidate should have a strong background in pediatric nursing, excellent communication skills, and a nurturing attitude.",
    qualifications: [
      "Bachelor's or Master's degree in Nursing with a focus on Pediatrics",
      "Registered Nurse license from the Indian Nursing Council",
      "Minimum 2 years of experience in pediatric nursing",
      "Knowledge of growth and development milestones",
      "Ability to assess and manage pediatric emergencies",
      "Strong communication and interpersonal skills",
      "Compassionate and patient-centered approach"
    ],
    responsibilities: [
      "Provide nursing care to pediatric patients in various settings",
      "Assess and monitor children's health status and development",
      "Administer medications and treatments appropriate for children",
      "Educate parents and caregivers on child health and safety",
      "Collaborate with pediatricians and other healthcare professionals",
      "Comfort and reassure children during medical procedures"
    ],
    benefits: [
      "Competitive salary",
      "Health insurance",
      "Childcare benefits",
      "Paid parental leave",
      "Professional development opportunities"
    ],
    skills: [
      "Pediatric Nursing",
      "Child Health",
      "Assessment",
      "Medication Administration",
      "Parent Education",
      "Interpersonal Skills",
      "Empathy"
    ],
    thumbnail:
        "https://www.pngkey.com/png/full/241-2412533_machine-learning-icon.png",
    candidates: [],
    extensions: ["Full-time", "On-site"],
    salary: 420000,
    via: "LinkedIn",
    jobType: "Full-time",
    isRemote: false,
    id: uuid.v4(),
    url: "https://tinytotshospital.com",
  ),
];
