class Students_Model{
  final int? studentId;
  final String studentName;
  final int studentAge;
  final String studentBloodGroup;
  final String studentClass;
  final String studentRoll;
  final String studentEmail;
  final String studentContact;

  Students_Model({
    this.studentId,
    required this.studentName,
    required this.studentAge,
    required this.studentBloodGroup,
    required this.studentClass,
    required this.studentRoll,
    required this.studentEmail,
    required this.studentContact,
});

  factory Students_Model.fromMap(Map<String,dynamic>map)=>Students_Model(
      studentId: map['studentId'],
      studentName: map['studentName'],
      studentAge: map['studentAge'],
      studentBloodGroup: map['studentBloodGroup'],
      studentClass: map['studentClass'],
      studentRoll: map['studentRoll'],
      studentEmail: map['studentEmail'],
      studentContact: map['studentContact'],
  );

  Map<String,dynamic> toMap()=>{
      'studentId': studentId,
      'studentName': studentName,
      'studentAge': studentAge,
      'studentBloodGroup': studentBloodGroup,
      'studentClass': studentClass,
      'studentRoll': studentRoll,
      'studentEmail': studentEmail,
      'studentContact': studentContact,
  };

}