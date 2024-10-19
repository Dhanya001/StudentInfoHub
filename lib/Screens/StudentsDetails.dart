import 'package:flutter/material.dart';
import 'package:studentinfohub/Models/Students_Model.dart';
import 'package:studentinfohub/Screens/EditStudents.dart';
import 'package:studentinfohub/auth/database_helper.dart';

class StudentDetails extends StatelessWidget {
  final Students_Model student;

  StudentDetails({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Student Details',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: 'Name :  ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                ),
                TextSpan(
                  text: '${student.studentName}',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),),
            SizedBox(height: 10),
            RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: 'Age :  ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                ),
                TextSpan(
                  text: '${student.studentAge}',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),),
            SizedBox(height: 10),
            RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: 'Blood Group :  ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                ),
                TextSpan(
                  text: '${student.studentBloodGroup}',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),),
            SizedBox(height: 10),
            RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: 'Class :  ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                ),
                TextSpan(
                  text: '${student.studentClass}',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),),
            SizedBox(height: 10),
            RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: 'Roll Number :  ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                ),
                TextSpan(
                  text: '${student.studentRoll}',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),),
            SizedBox(height: 10),
            RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: 'Email :  ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                ),
                TextSpan(
                  text: '${student.studentEmail}',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),),
            SizedBox(height: 10),
            RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: 'Contact :  ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                ),
                TextSpan(
                  text: '${student.studentContact}',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),),
            SizedBox(height: 20.0),

            Center(
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditStudents(student: student)),
                      );
                    },
                    child: Text('Edit',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () async {
                      await DataBaseHelper().deleteStudent(student.studentId!);
                      Navigator.pop(context, true); // Return to the previous screen
                    },
                    child: Text('Delete',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}