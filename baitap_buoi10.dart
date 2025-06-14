import 'dart:io';

List<Student> allStudents = [];
List<Teacher> allTeachers = [];
List<Classroom> allClasses = [];

void main(List<String> args) {
  while (true) {
    print("\n===== HỆ THỐNG QUẢN LÝ TRƯỜNG HỌC =====");
    print("1. Thêm học sinh");
    print("2. Thêm giáo viên");
    print("3. Tạo lớp học");
    print("4. Thêm học sinh vào lớp");
    print("5. Gán giáo viên cho lớp");
    print("6. Hiển thị danh sách lớp");
    print("7. Hiển thị báo cáo điểm");
    print("8. Thoát");
    stdout.write("Chọn chức năng (1-8): ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        themHocSinh();
        break;
      case '2':
        themGiaoVien();
        break;
      case '3':
        taoLopHoc();
        break;
      case '4':
        themHocSinhVaoLop();
        break;
      case '5':
        ganGiaoVienChoLop();
        break;
      case '6':
        hienThiDanhSachLop();
        break;
      case '7':
        hienThiBaoCaoDiem();
        break;
      case '8':
        print("Đã thoát chương trình.");
        return;
      default:
        print("\nLựa chọn không hợp lệ.");
    }
  }
}

class Person {
  String id;
  String name;
  int age;
  String gender;

  Person(this.id, this.name, this.age, this.gender);
}

class Student extends Person {
  String grade;
  double score;

  Student(
    String id,
    String name,
    int age,
    String gender,
    this.grade,
    this.score,
  ) : super(id, name, age, gender);

  void displayInfo() {
    print("Sinh viên: $name | ID: $id | Tuổi: $age | Giới tính: $gender | Lớp: $grade | Điểm: $score");
  }
}

class Teacher extends Person {
  String subject;
  double salary;

  Teacher(
    String id,
    String name,
    int age,
    String gender,
    this.subject,
    this.salary,
  ) : super(id, name, age, gender);

  void displayInfo() {
    print("Giáo viên: $name | ID: $id | Tuổi: $age | Giới tính: $gender | Môn: $subject | Lương: $salary");
  }
}

class Classroom {
  String id;
  String name;
  List<Student> students = [];
  Teacher? teacher;

  Classroom(this.id, this.name);

  void addStudent(Student student) {
    students.add(student);
    print("=> Đã thêm sinh viên ${student.name} vào lớp $name.");
  }

  void assignTeacher(Teacher t) {
    teacher = t;
    print("=> Giáo viên ${t.name} đã được gán vào lớp $name.");
  }

  void displayClassInfo() {
    print("\n=== LỚP HỌC: $name (ID: $id) ===");
    if (teacher != null) {
      print("Giáo viên phụ trách: ${teacher!.name} (${teacher!.subject})");
    } else {
      print("Chưa có giáo viên phụ trách.");
    }

    if (students.isEmpty) {
      print("Không có học sinh trong lớp.");
    } else {
      print("Danh sách học sinh:");
      for (var s in students) {
        s.displayInfo();
      }
    }
  }

  void displayScores() {
    print("\n=== BÁO CÁO ĐIỂM LỚP $name ===");
    for (var s in students) {
      print("${s.name} - Điểm: ${s.score}");
    }
  }
}

void themHocSinh() {
  String id = _nhapId();
  stdout.write("Nhập tên: ");
  String name = stdin.readLineSync()!;
  int age = _nhapSoNguyen("Nhập tuổi: ");
  stdout.write("Nhập giới tính: ");
  String gender = stdin.readLineSync()!;
  stdout.write("Nhập lớp học (grade): ");
  String grade = stdin.readLineSync()!;
  double score = _nhapSoThuc("Nhập điểm: ");

  allStudents.add(Student(id, name, age, gender, grade, score));
  print("=> Đã thêm học sinh $name.");
}

void themGiaoVien() {
  String id = _nhapId();
  stdout.write("Nhập tên: ");
  String name = stdin.readLineSync()!;
  int age = _nhapSoNguyen("Nhập tuổi: ");
  stdout.write("Nhập giới tính: ");
  String gender = stdin.readLineSync()!;
  stdout.write("Nhập môn dạy: ");
  String subject = stdin.readLineSync()!;
  double salary = _nhapSoThuc("Nhập lương: ");

  allTeachers.add(Teacher(id, name, age, gender, subject, salary));
  print("=> Đã thêm giáo viên $name.");
}

void taoLopHoc() {
  String id = _nhapId();
  stdout.write("Nhập tên lớp học: ");
  String name = stdin.readLineSync()!;
  allClasses.add(Classroom(id, name));
  print("=> Đã tạo lớp học $name.");
}

void themHocSinhVaoLop() {
  if (allClasses.isEmpty || allStudents.isEmpty) {
    print("=> Chưa có lớp học hoặc học sinh.");
    return;
  }

  print("Chọn lớp học:");
  for (int i = 0; i < allClasses.length; i++) {
    print("${i + 1}. ${allClasses[i].name}");
  }
  int classIndex = int.parse(stdin.readLineSync()!) - 1;

  print("Chọn học sinh:");
  for (int i = 0; i < allStudents.length; i++) {
    print("${i + 1}. ${allStudents[i].name}");
  }
  int studentIndex = int.parse(stdin.readLineSync()!) - 1;

  allClasses[classIndex].addStudent(allStudents[studentIndex]);
}

void ganGiaoVienChoLop() {
  if (allClasses.isEmpty || allTeachers.isEmpty) {
    print("=> Chưa có lớp học hoặc giáo viên.");
    return;
  }

  print("Chọn lớp học:");
  for (int i = 0; i < allClasses.length; i++) {
    print("${i + 1}. ${allClasses[i].name}");
  }
  int classIndex = int.parse(stdin.readLineSync()!) - 1;

  print("Chọn giáo viên:");
  for (int i = 0; i < allTeachers.length; i++) {
    print("${i + 1}. ${allTeachers[i].name}");
  }
  int teacherIndex = int.parse(stdin.readLineSync()!) - 1;

  allClasses[classIndex].assignTeacher(allTeachers[teacherIndex]);
}

void hienThiDanhSachLop() {
  for (var c in allClasses) {
    c.displayClassInfo();
  }
}

void hienThiBaoCaoDiem() {
  for (var c in allClasses) {
    c.displayScores();
  }
}

String _nhapId() {
  while (true) {
    stdout.write("Nhập ID: ");
    String input = stdin.readLineSync()!;
    if (int.tryParse(input) != null && int.parse(input) >= 0) return input;
    print("=> ID không hợp lệ. Vui lòng nhập lại.");
  }
}

int _nhapSoNguyen(String label) {
  while (true) {
    stdout.write(label);
    String input = stdin.readLineSync()!;
    int? value = int.tryParse(input);
    if (value != null && value >= 0) return value;
    print("=> Vui lòng nhập số nguyên không âm.");
  }
}

double _nhapSoThuc(String label) {
  while (true) {
    stdout.write(label);
    String input = stdin.readLineSync()!;
    double? value = double.tryParse(input);
    if (value != null && value >= 0) return value;
    print("=> Vui lòng nhập số thực không âm.");
  }
}
