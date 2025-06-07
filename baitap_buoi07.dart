import 'dart:io';

void main(List<String> args) {
  // Bài tập quản lý sinh viên
  quanLiSinhVien();
  print("----------------------");
  // Bài Tập Lớn: Quản Lý Sản Phẩm
  quanLiSanPham();
}

class Student {
  String name;
  double math;
  double physics;
  double chemistry;

  Student(this.name, this.math, this.physics, this.chemistry);

  double get average => (math + physics + chemistry) / 3;

  String get grade {
    double avg = average;
    if (avg < 5) return "Kém";
    if (avg < 7) return "Khá";
    if (avg < 9) return "Giỏi";
    return "Xuất sắc";
  }

  void display() {
    print(
      "Họ tên: $name | Toán: $math | Lý: $physics | Hóa: $chemistry | "
      "ĐTB: ${average.toStringAsFixed(2)} | Xếp loại: $grade",
    );
  }
}

void quanLiSinhVien() {
  List<Student> students = [];

  while (true) {
    print("==== MENU ====");
    print("1. Thêm sinh viên");
    print("2. Hiển thị danh sách sinh viên");
    print("3. Tìm sinh viên có ĐTB cao nhất");
    print("4. Thoát");
    stdout.write("Chọn chức năng (1-4): ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write("Nhập họ tên: ");
        String name = stdin.readLineSync()!;
        stdout.write("Nhập điểm Toán: ");
        double math = double.parse(stdin.readLineSync()!);
        stdout.write("Nhập điểm Lý: ");
        double physics = double.parse(stdin.readLineSync()!);
        stdout.write("Nhập điểm Hóa: ");
        double chemistry = double.parse(stdin.readLineSync()!);
        students.add(Student(name, math, physics, chemistry));
        print("=> Đã thêm sinh viên thành công!\n");
        break;

      case '2':
        if (students.isEmpty) {
          print("Danh sách sinh viên trống.\n");
        } else {
          print("\n--- DANH SÁCH SINH VIÊN ---");
          for (var student in students) {
            student.display();
          }
          print("");
        }
        break;

      case '3':
        if (students.isEmpty) {
          print("Danh sách sinh viên trống.\n");
        } else {
          students.sort((a, b) => b.average.compareTo(a.average));
          print("\n=> Sinh viên có ĐTB cao nhất:");
          students.first.display();
          print("");
        }
        break;

      case '4':
        print("Thoát chương trình.");
        return;

      default:
        print("Lựa chọn không hợp lệ.\n");
    }
  }
}

class Product {
  String name;
  double price;
  int stock;

  Product(this.name, this.price, this.stock);

  void display() {
    print("Tên: $name | Giá: ${price.toStringAsFixed(2)} | Tồn kho: $stock");
  }
}

void quanLiSanPham() {
  List<Product> products = [];

  while (true) {
    print("\n===== MENU QUẢN LÝ SẢN PHẨM =====");
    print("1. Thêm sản phẩm");
    print("2. Hiển thị danh sách sản phẩm");
    print("3. Tìm kiếm sản phẩm theo tên");
    print("4. Bán sản phẩm");
    print("5. Thoát");
    stdout.write("Chọn chức năng (1-5): ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write("Nhập tên sản phẩm: ");
        String name = stdin.readLineSync()!;
        stdout.write("Nhập giá tiền: ");
        double price = double.parse(stdin.readLineSync()!);
        stdout.write("Nhập số lượng trong kho: ");
        int stock = int.parse(stdin.readLineSync()!);
        products.add(Product(name, price, stock));
        print("=> Đã thêm sản phẩm.\n");
        break;

      case '2':
        if (products.isEmpty) {
          print("Danh sách sản phẩm trống.\n");
        } else {
          print("\n--- DANH SÁCH SẢN PHẨM ---");
          for (var p in products) {
            p.display();
          }
        }
        break;

      case '3':
        stdout.write("Nhập tên sản phẩm cần tìm: ");
        String search = stdin.readLineSync()!.toLowerCase();
        var found = products.where(
          (p) => p.name.toLowerCase().contains(search),
        );
        if (found.isEmpty) {
          print("Không tìm thấy sản phẩm nào.");
        } else {
          print("\n=> Kết quả tìm kiếm:");
          for (var p in found) {
            p.display();
          }
        }
        break;

      case '4':
        stdout.write("Nhập tên sản phẩm cần bán: ");
        String name = stdin.readLineSync()!;
        Product? product;
        try {
          product = products.firstWhere(
            (p) => p.name.toLowerCase() == name.toLowerCase(),
          );
        } catch (e) {
          product = null;
        }
        if (product == null) {
          print("Không tìm thấy sản phẩm.");
        } else {
          stdout.write("Nhập số lượng cần bán: ");
          int quantity = int.parse(stdin.readLineSync()!);
          if (quantity <= product.stock) {
            product.stock -= quantity;
            print(
              "=> Đã bán $quantity sản phẩm '${product.name}'. Tồn kho còn lại: ${product.stock}.",
            );
          } else {
            print(
              "Không đủ hàng trong kho! Chỉ còn ${product.stock} sản phẩm.",
            );
          }
        }
        break;

      case '5':
        print("Đã thoát chương trình.");
        return;

      default:
        print("Lựa chọn không hợp lệ. Vui lòng thử lại.\n");
    }
  }
}
