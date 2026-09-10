import 'package:e_store/core/enums/reaction_type.dart';
import 'package:e_store/core/enums/user_rols.dart';
import 'package:e_store/features/auth/domain/entities/user_entity.dart';
import 'package:e_store/features/community/domain/entities/post_entity.dart';
import 'package:e_store/features/community/domain/entities/user_reaction_entity.dart';
import 'package:e_store/features/course/domain/entities/course_entity.dart';
import 'package:e_store/features/details_course/domain/entities/course_lesson_entity.dart';
import 'package:e_store/features/details_course/domain/entities/course_section_entity.dart';
import 'package:e_store/features/details_course/domain/entities/review_entity.dart';
import 'package:e_store/features/profile/domain/entities/instructor_entity.dart';
import 'package:e_store/features/settings/data/model/language_item.dart';

final coursesFake = [
  CourseEntity(
    id: '1',
    title: 'Flutter for Beginners',
    image: '',
    instructor: instructor1,
    price: 100,
    students: 1500,
    duration: '20 Hours',
    description:
        'Learn Flutter from scratch and build beautiful mobile applications.',
    language: 'English',
    level: 'Beginner',
    rating: 4.5,
    sections: flutterSections,
    reviews: flutterReviews,
    isEnrolled: false,
    isFavorite: true,
    discountPrice: 50,
  ),

  CourseEntity(
    id: '2',
    title: 'Advanced Flutter & Clean Architecture',
    image: '',
    instructor: instructor2,
    price: 150,
    students: 3200,
    duration: '35 Hours',
    description:
        'Master Clean Architecture, Bloc, Dependency Injection, and scalable Flutter applications.',
    language: 'English',
    level: 'Advanced',
    rating: 4.9,
    sections: flutterSections,
    reviews: flutterReviews,

    isEnrolled: true,
    isFavorite: false,
  ),

  CourseEntity(
    id: '3',
    title: 'UI/UX Design Masterclass',
    image: '',
    instructor: instructor3,
    price: 80,
    students: 2100,
    duration: '18 Hours',
    description:
        'Become a professional UI/UX Designer using Figma and modern design principles.',
    language: 'English',
    level: 'Intermediate',
    rating: 4.7,
    sections: flutterSections,
    reviews: flutterReviews,
    isEnrolled: false,
    isFavorite: false,
  ),
];

const instructor1 = InstructorEntity(
  id: '1',
  name: 'Ali Ahmed',
  image: '',
  bio:
      'Flutter Developer with 6 years of experience building production mobile applications.',
  specialization: 'Flutter Development',
  totalStudents: 5000,
  totalCourses: 10,
  rating: 4.7,
);

const instructor2 = InstructorEntity(
  id: '2',
  name: 'Mohamed Ibrahim',
  image: '',
  bio:
      'Senior Software Engineer specializing in scalable Flutter architecture.',
  specialization: 'Mobile Architecture',
  totalStudents: 8500,
  totalCourses: 14,
  rating: 4.9,
);

const instructor3 = InstructorEntity(
  id: '3',
  name: 'Sara Mostafa',
  image: '',
  bio:
      'UI/UX Designer passionate about creating intuitive digital experiences.',
  specialization: 'UI/UX Design',
  totalStudents: 7200,
  totalCourses: 8,
  rating: 4.8,
);

const flutterReviews = [
  ReviewEntity(
    id: '1',
    userName: 'Ahmed Hassan',
    userImage: '',
    comment:
        'Excellent course with clear explanations and practical examples. Highly recommended! . it helped me a lot to understand flutter and build my first app',
    rating: 3,
    time: '15-5-2025',
  ),
  ReviewEntity(
    id: '2',
    userName: 'Mohamed Ali',
    userImage: '',
    comment: 'Very helpful and well explained topics ',
    rating: 4.5,
    time: '10-5-2025',
  ),
];
const flutterLessons = [
  // Section 1
  CourseLessonEntity(
    id: '1',
    sectionId: '1',
    title: 'Introduction to Flutter',
    duration: '10 min',
    isPreview: true,
  ),

  CourseLessonEntity(
    id: '2',
    sectionId: '1',
    title: 'Flutter Installation',
    duration: '15 min',
    isPreview: true,
  ),

  CourseLessonEntity(
    id: '3',
    sectionId: '1',
    title: 'Widgets Basics',
    duration: '25 min',
    isPreview: false,
  ),

  // Section 2
  CourseLessonEntity(
    id: '4',
    sectionId: '2',
    title: 'Stateless Widget',
    duration: '20 min',
    isPreview: true,
  ),

  CourseLessonEntity(
    id: '5',
    sectionId: '2',
    title: 'Stateful Widget',
    duration: '30 min',
    isPreview: false,
  ),

  CourseLessonEntity(
    id: '6',
    sectionId: '2',
    title: 'Build Method',
    duration: '18 min',
    isPreview: false,
  ),

  CourseLessonEntity(
    id: '11',
    sectionId: '2',
    title: 'Flutter Layouts',
    duration: '22 min',
    isPreview: false,
  ),

  // Section 3
  CourseLessonEntity(
    id: '7',
    sectionId: '3',
    title: 'Cubit Basics',
    duration: '22 min',
    isPreview: true,
  ),

  CourseLessonEntity(
    id: '8',
    sectionId: '3',
    title: 'Bloc Pattern',
    duration: '35 min',
    isPreview: false,
  ),

  CourseLessonEntity(
    id: '9',
    sectionId: '3',
    title: 'Dependency Injection',
    duration: '28 min',
    isPreview: false,
  ),

  CourseLessonEntity(
    id: '10',
    sectionId: '3',
    title: 'Testing Bloc',
    duration: '30 min',
    isPreview: false,
  ),
];

final flutterSections = [
  CourseSectionEntity(
    id: '1',
    title: 'Getting Started',
    lessons: flutterLessons,
  ),
  CourseSectionEntity(
    id: '2',
    title: 'Flutter Basics',
    lessons: flutterLessons,
  ),
  CourseSectionEntity(
    id: '3',
    title: 'State Management',
    lessons: flutterLessons,
  ),
];

//User Data

final users = [
  UserEntity(
    id: 'u1',
    name: 'Layla Ahmed',
    email: 'layla@example.com',
    avatar: 'https://i.pravatar.cc/150?img=1',
    role: UserRole.student,
    bio: 'Computer Science Student',
  ),

  UserEntity(
    id: 'u2',
    name: 'Ahmed Hassan',
    email: 'ahmed@example.com',
    avatar: 'https://i.pravatar.cc/150?img=2',
    role: UserRole.student,
    bio: 'Flutter Developer',
  ),

  UserEntity(
    id: 'u3',
    name: 'Sarah Mohamed',
    email: 'sarah@example.com',
    avatar: 'https://i.pravatar.cc/150?img=3',
    role: UserRole.student,
    bio: 'AI Enthusiast',
  ),

  UserEntity(
    id: 'u4',
    name: 'Dr. Mahmoud Ali',
    email: 'mahmoud@example.com',
    avatar: 'https://i.pravatar.cc/150?img=4',
    role: UserRole.instructor,
    bio: 'Software Engineering Instructor',
  ),
];
//Reactions Data
final reactions = [
  UserReactionEntity(
    user: users[1],
    reactionType: ReactionType.like,
    reactedAt: DateTime.now().subtract(const Duration(minutes: 15)),
  ),

  UserReactionEntity(
    user: users[2],
    reactionType: ReactionType.love,
    reactedAt: DateTime.now().subtract(const Duration(minutes: 10)),
  ),

  UserReactionEntity(
    user: users[3],
    reactionType: ReactionType.wow,
    reactedAt: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
];
//Posts Data
final posts = [
  PostEntity(
    id: 'p1',
    author: users[0],
    groupName: 'Computer Science',
    post:
        'Hey guys, does anyone have any tips on how to understand graph search algorithms? I feel like BFS and DFS are confusing. Any recommended resources?',
    likesCount: 54,
    commentsCount: 18,
    sharesCount: 3,
    isLikedByMe: true,
    createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    recentReactions: reactions,
  ),

  PostEntity(
    id: 'p2',
    author: users[3],
    groupName: 'Software Engineering',
    post:
        'I have just uploaded a new lesson about Clean Architecture in Flutter. Make sure to watch it before next week’s live session.',
    likesCount: 127,
    commentsCount: 42,
    sharesCount: 15,
    isLikedByMe: false,
    createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    recentReactions: reactions,
  ),

  PostEntity(
    id: 'p3',
    author: users[2],
    groupName: 'Artificial Intelligence',
    post:
        'Can anyone recommend a good roadmap for learning Machine Learning from scratch? I know Python basics already.',
    likesCount: 89,
    commentsCount: 27,
    sharesCount: 6,
    isLikedByMe: true,
    createdAt: DateTime.now().subtract(const Duration(days: 1)),
    recentReactions: reactions,
  ),

  PostEntity(
    id: 'p4',
    author: users[1],
    groupName: 'Flutter Development',
    post:
        'Today I completed my first project using Bloc and Clean Architecture. It was challenging but worth it!',
    likesCount: 215,
    commentsCount: 58,
    sharesCount: 11,
    isLikedByMe: false,
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
    recentReactions: reactions,
  ),
];
const languagesList = [
  LanguageItem(code: 'en', name: 'English', flag: '🇺🇸'),

  LanguageItem(code: 'ar', name: 'العربية', flag: '🇪🇬'),
];
