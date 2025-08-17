import 'dart:io';
class Person{
  int? id;
  String? name;
  int? age;
  String? gender;
  Person(this.id, this.name, this.age,this.gender);
  void showInfo() {
    print("ID: $id | Name: $name | Age: $age | Gender: $gender");
  }
}
class Student extends Person {
  String grade; 
  double score; 

  Student(int id, String name, int age, String gender, this.grade, this.score)
      : super(id, name, age, gender);
      @override
  void showInfo() {
    print(
        "Student -> ID: $id | Name: $name | Age: $age | Gender: $gender | Grade: $grade | Score: $score");
  }
}
class Teacher extends Person {
  String subject;
  String salary;
  Teacher(int id, String name, int age, String gender, this.subject, this.salary)
      : super(id, name, age, gender);
      @override
      void showInfo() {
    print(
        "Teacher -> ID: $id | Name: $name | Age: $age | Gender: $gender | Subject: $subject | Salary: $salary");
  }
}
class Classroom{
  int id;
  String name;
  List<Student> students= [];
  Teacher? teacher;
  Classroom(this.id, this.name);
  void addStudent(Student student) {
    students.add(student);
  }
  void assignTeacher(Teacher t) {
    teacher = t;
    print("Đã gán giáo viên ${t.name} cho lớp $name");
  }
  void showInfo() {
    print("Classroom ID: $id | Name: $name");
    if (teacher != null) {
      print("Teacher: ${teacher!.name}");
    } else {
      print("No teacher assigned.");
    }
    print("Students:");
    for (var student in students) {
      student.showInfo();
    }
  }
  double calculateAverageScore() {
    if (students.isEmpty) {
      return 0.0;
    }
    double totalScore = 0.0;
    for (var student in students) {
      totalScore += student.score;
    }
    return totalScore / students.length;
  }

}
class SchoolManager {
  List<Student> allStudents = [];
  List<Teacher> allTeachers = [];
  List<Classroom> allClasses = [];

  // Thêm học sinh
  void addStudent(Student s) => allStudents.add(s);

  // Thêm giáo viên
  void addTeacher(Teacher t) => allTeachers.add(t);

  // Thêm lớp học
  void addClass(Classroom c) => allClasses.add(c);

  // Hiển thị toàn bộ danh sách
  void showAllData() {
    print("\n=== Danh sách Sinh viên ===");
    for (var s in allStudents) {
      s.showInfo();
    }

    print("\n=== Danh sách Giáo viên ===");
    for (var t in allTeachers) {
      t.showInfo();
    }

    print("\n=== Danh sách Lớp học ===");
    for (var c in allClasses) {
      c.showInfo();
      print("Điểm trung bình lớp: ${c..calculateAverageScore().toStringAsFixed(2)}");
    }
  }
}
void main() {
  SchoolManager sm = SchoolManager();
  String? chon;

  do {
    print("\n===== MENU QUẢN LÝ TRƯỜNG HỌC =====");
    print("1. Thêm học sinh");
    print("2. Thêm giáo viên");
    print("3. Thêm lớp học");
    print("4. Gán giáo viên cho lớp");
    print("5. Thêm học sinh vào lớp");
    print("6. Hiển thị toàn bộ dữ liệu");
    print("7. Thoát");
    stdout.write("Chọn: ");
    chon = stdin.readLineSync();

    switch (chon) {
      case "1":
        stdout.write("ID: ");
        int id = int.parse(stdin.readLineSync()!);
        stdout.write("Tên: ");
        String name = stdin.readLineSync()!;
        stdout.write("Tuổi: ");
        int age = int.parse(stdin.readLineSync()!);
        stdout.write("Giới tính: ");
        String gender = stdin.readLineSync()!;
        stdout.write("Lớp: ");
        String grade = stdin.readLineSync()!;
        stdout.write("Điểm: ");
        double score = double.parse(stdin.readLineSync()!);

        sm.addStudent(Student(id, name, age, gender, grade, score));
        print("Thêm học sinh thành công!");
        break;

      case "2":
        stdout.write("ID: ");
        int id = int.parse(stdin.readLineSync()!);
        stdout.write("Tên: ");
        String name = stdin.readLineSync()!;
        stdout.write("Tuổi: ");
        int age = int.parse(stdin.readLineSync()!);
        stdout.write("Giới tính: ");
        String gender = stdin.readLineSync()!;
        stdout.write("Môn dạy: ");
        String subject = stdin.readLineSync()!;
        stdout.write("Lương: ");
        double salary = double.parse(stdin.readLineSync()!);

        sm.addTeacher(Teacher(id, name, age, gender, subject, salary.toString()));
        print("Thêm giáo viên thành công!");
        break;

      case "3":
        stdout.write("ID lớp: ");
        int id = int.parse(stdin.readLineSync()!);
        stdout.write("Tên lớp: ");
        String name = stdin.readLineSync()!;
        sm.addClass(Classroom(id, name));
        print("Thêm lớp học thành công!");
        break;

      case "4":
        if (sm.allClasses.isEmpty || sm.allTeachers.isEmpty) {
          print("Cần có lớp và giáo viên trước.");
          break;
        }
        stdout.write("Nhập tên lớp: ");
        String className = stdin.readLineSync()!;
        var c = sm.allClasses.firstWhere((c) => c.name == className, orElse: () => Classroom(0, ""));
        if (c.id == 0) {
          print("Không tìm thấy lớp.");
          break;
        }
        stdout.write("Nhập tên giáo viên: ");
        String teacherName = stdin.readLineSync()!;
        var t = sm.allTeachers.firstWhere((t) => t.name == teacherName, orElse: () => Teacher(0,"",0,"","",""));
        if (t.id == 0) {
          print("Không tìm thấy giáo viên.");
          break;
        }
        c.assignTeacher(t);
        break;

      case "5":
        if (sm.allClasses.isEmpty || sm.allStudents.isEmpty) {
          print("Cần có lớp và học sinh trước.");
          break;
        }
        stdout.write("Nhập tên lớp: ");
        String className = stdin.readLineSync()!;
        var c = sm.allClasses.firstWhere((c) => c.name == className, orElse: () => Classroom(0, ""));
        if (c.id == 0) {
          print("Không tìm thấy lớp.");
          break;
        }
        stdout.write("Nhập tên học sinh: ");
        String stuName = stdin.readLineSync()!;
        var s = sm.allStudents.firstWhere((s) => s.name == stuName, orElse: () => Student(0,"",0,"","",0));
        if (s.id == 0) {
          print("Không tìm thấy học sinh.");
          break;
        }
        c.addStudent(s);
        break;

      case "6":
        sm.showAllData();
        break;

      case "7":
        print("Kết thúc chương trình!");
        break;

      default:
        print("Lựa chọn không hợp lệ.");
    }
  } while (chon != "7");
}
