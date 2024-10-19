import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:studentinfohub/Models/Students_Model.dart';


class DataBaseHelper{
  final databaseName="Student.db";

  String StudentsTable="CREATE TABLE students (studentId INTEGER PRIMARY KEY AUTOINCREMENT,"
      "studentName TEXT NOT NULL,"
      "studentAge INTEGER NOT NULL,"
      "studentBloodGroup TEXT NOT NULL,"
      "studentClass TEXT NOT NULL,"
      "studentRoll TEXT NOT NULL,"
      "studentEmail TEXT NOT NULL,"
      "studentContact TEXT NOT NULL,"
      "createdAt TEXT DEFAULT CURRENT_TIMESTAMP)";

  Future<Database>initDB() async{
    final databasepath= await getDatabasesPath();
    final path=join(databasepath,databaseName);
    return openDatabase(path,version: 1,onCreate: (db,version) async{
      await db.execute(StudentsTable);
    });
  }

  Future<List<Students_Model>> getStudents() async {
    final db = await initDB();
    final List<Map<String, dynamic>> maps = await db.query('students');

    return List.generate(maps.length, (i) {
      return Students_Model.fromMap(maps[i]);
    });
  }

  //Create Student
  Future<int> createStudent(Students_Model student) async{
    final Database db= await initDB();
      return db.insert('students', student.toMap());
  }

  //Update Student
  Future<int> updateStudent(int studentId, String name, int age,String bloodgroup, String studentClass, String roll,String email, String contact) async {
    final Database db = await initDB();
    return db.update(
      'students',
      {
        'studentName': name,
        'studentAge': age,
        'studentBloodGroup': bloodgroup,
        'studentClass': studentClass,
        'studentRoll': roll,
        'studentEmail': email,
        'studentContact': contact,
      },
      where: 'studentId = ?',
      whereArgs: [studentId],
    );
  }

  // Delete student
  Future<int> deleteStudent(int studentId) async {
    final Database db = await initDB();
    return db.delete('students', where: 'studentId = ?', whereArgs: [studentId]);
  }


}