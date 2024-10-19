import 'package:flutter/material.dart';
import 'package:studentinfohub/Models/Students_Model.dart';
import 'package:studentinfohub/Screens/StudentsDetails.dart';
import 'package:studentinfohub/auth/database_helper.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  List<Students_Model> _students = [];

  @override
  void initState() {
    super.initState();
    _fetchStudents();
  }

  void _fetchStudents() async {
    final students = await DataBaseHelper().getStudents();
    setState(() {
      _students = students;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _students.isEmpty
        ? Center(child: Text('No students found!'))
        : ListView.builder(
      itemCount: _students.length,
      itemBuilder: (context, index) {
        final student = _students[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StudentDetails(student: student)),
            );
          },
          child: ListTile(
            leading: CircleAvatar(
              child: Text(student.studentName[0]),  // Show the first letter of the name
            ),
            title: Text(student.studentName),
            subtitle: Text('Contact: ${student.studentContact}'),
          ),
        );
      },
    );
  }
}
