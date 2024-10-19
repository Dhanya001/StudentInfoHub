import 'package:flutter/material.dart';
import 'package:studentinfohub/Models/Students_Model.dart';
import 'package:studentinfohub/auth/database_helper.dart';

class AddStudent extends StatefulWidget {
  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _bloodgroupController = TextEditingController();
  final _classController = TextEditingController();
  final _rollController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactController = TextEditingController();
  final DataBaseHelper _dbHelper = DataBaseHelper();

  void _saveStudent() async {
    if (_formKey.currentState!.validate()) {
      Students_Model newStudent = Students_Model(
        studentName: _nameController.text,
        studentAge: int.parse(_ageController.text),
        studentBloodGroup: _bloodgroupController.text,
        studentClass: _classController.text,
        studentRoll: _rollController.text,
        studentEmail: _emailController.text,
        studentContact: _contactController.text,
      );

      await _dbHelper.createStudent(newStudent);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Student registered successfully!')),
      );

      // Clear the form fields after saving
      _nameController.clear();
      _ageController.clear();
      _bloodgroupController.clear();
      _classController.clear();
      _rollController.clear();
      _emailController.clear();
      _contactController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Student'),
        backgroundColor: Colors.blue,
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
                onPressed: _saveStudent,
                child: Text('SUBMIT',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
