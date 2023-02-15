import 'package:flutter/material.dart';

class CollegeOrSchool {
final String id;
final String name;
String imageUrl;
int numberOfNotes;
List<String> courses;

CollegeOrSchool({
required this.id,
required this.name,
this.imageUrl='https://www.google.com/search?q=college&sxsrf=AJOqlzXCDeYy8NTHzM47_oZM34JNT-nt-A:1674772865516&source=lnms&tbm=isch&sa=X&ved=0ahUKEwit2umNp-b8AhVRBbcAHemVA2gQ_AUIBygC',
this.numberOfNotes = 0,
this.courses=const [],
});
}
List<CollegeOrSchool> dummyColleges = [
  CollegeOrSchool(
    id: '1',
    name: 'MIT',
    imageUrl: 'https://www.mit.edu/img/home/logo-mit.png',
    numberOfNotes: 12,
    courses: ['Computer Science', 'Mechanical Engineering', 'Physics'],
  ),
  CollegeOrSchool(
    id: '2',
    name: 'Harvard',
    imageUrl: 'https://www.harvard.edu/sites/default/files/content/harvard_logo_200.png',
    numberOfNotes: 8,
    courses: ['Law', 'Business', 'Economics'],
  ),
  CollegeOrSchool(
    id: '3',
    name: 'Stanford',
    imageUrl: 'https://www.stanford.edu/sites/default/files/styles/square/public/images/logo-stanford-white.png',
    numberOfNotes: 15,
    courses: ['Computer Science', 'Electrical Engineering', 'Biology'],
  ),
  CollegeOrSchool(
    id: '4',
    name: 'High School',
    imageUrl: 'https://www.example.com/high-school-logo.jpg',
    numberOfNotes: 5,
    courses: ['Math', 'Science', 'English'],
  ),
];


class CollegeOrSchoolList with ChangeNotifier {
final List<CollegeOrSchool> _collegesOrSchools = [...dummyColleges];

List<CollegeOrSchool> get collegesOrSchools {
return [..._collegesOrSchools];
}

CollegeOrSchool findById(String id) {
return _collegesOrSchools.firstWhere((element) => element.id == id);
}
}