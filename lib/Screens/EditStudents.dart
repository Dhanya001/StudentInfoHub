import 'package:flutter/material.dart';
import 'package:studentinfohub/Models/Students_Model.dart';
import 'package:studentinfohub/auth/database_helper.dart';

class EditStudents extends StatefulWidget {
  final Students_Model student;

  EditStudents({required this.student});

  @override
  _EditStudentsState createState() => _EditStudentsState();
}

class _EditStudentsState extends State<EditStudents> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late TextEditingController _bloodgroupController;
  late TextEditingController _classController;
  late TextEditingController _rollController;
  late TextEditingController _emailController;
  late TextEditingController _contactController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.student.studentName);
    _ageController = TextEditingController(text: widget.student.studentAge.toString());
    _bloodgroupController = TextEditingController(text: widget.student.studentBloodGroup);
    _classController = TextEditingController(text: widget.student.studentClass);
    _rollController = TextEditingController(text: widget.student.studentRoll);
    _emailController = TextEditingController(text: widget.student.studentEmail);
    _contactController = TextEditingController(text: widget.student.studentContact);
  }

  void _updateStudent() async {
    if (_formKey.currentState!.validate()) {
      Students_Model updatedStudent = Students_Model(
        studentId: widget.student.studentId,
        studentName: _nameController.text,
        studentAge: int.parse(_ageController.text),
        studentBloodGroup: _bloodgroupController.text,
        studentClass: _classController.text,
        studentRoll: _rollController.text,
        studentEmail: _emailController.text,
        studentContact: _contactController.text,
      );

      await DataBaseHelper().updateStudent(
        updatedStudent.studentId!,
        updatedStudent.studentName,
        updatedStudent.studentAge,
        updatedStudent.studentBloodGroup,
        updatedStudent.studentClass,
        updatedStudent.studentRoll,
        updatedStudent.studentEmail,
        updatedStudent.studentContact,
      );

      Navigator.pop(context, true);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Student Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Student Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the student name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Student Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the student age';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _bloodgroupController,
                decoration: InputDecoration(labelText: 'Blood Group'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the student blood group';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _classController,
                decoration: InputDecoration(labelText: 'Class'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the student class';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _rollController,
                decoration: InputDecoration(labelText: 'Roll Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the student roll number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'E-mail Id'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the student E-mail Id';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contactController,
                decoration: InputDecoration(labelText: 'Contact Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the student contact number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _updateStudent,
                child: Text('UPDATE'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}