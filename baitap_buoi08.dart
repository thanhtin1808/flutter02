import 'dart:io';

void main(List<String> args) {
  // Bài tập quản lí hóa đơn
  quanLyHoaDon();
}

void quanLyHoaDon() {
  List<Map<String, dynamic>> gioHang = [];

  while (true) {
    print("\n===== MENU QUẢN LÝ HÓA ĐƠN =====");
    print("1. Thêm sản phẩm vào giỏ hàng");
    print("2. Sửa sản phẩm trong giỏ hàng");
    print("3. Xóa sản phẩm khỏi giỏ hàng");
    print("4. Hiển thị giỏ hàng");
    print("5. Tính tổng tiền hóa đơn");
    print("6. Thoát");
    stdout.write("Chọn chức năng (1-6): ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        themSanPham(gioHang);
        break;
      case '2':
        suaSanPham(gioHang);
        break;
      case '3':
        xoaSanPham(gioHang);
        break;
      case '4':
        hienThiGioHang(gioHang);
        break;
      case '5':
        tinhTongTien(gioHang);
        break;
      case '6':
        print("Đã thoát chương trình.");
        return;
      default:
        print("Lựa chọn không hợp lệ. Vui lòng thử lại.");
    }
  }
}

void themSanPham(List<Map<String, dynamic>> gioHang) {
  stdout.write("Nhập tên sản phẩm: ");
  String name = stdin.readLineSync()!;
  stdout.write("Nhập số lượng: ");
  int quantity = int.parse(stdin.readLineSync()!);
  stdout.write("Nhập giá tiền: ");
  double price = double.parse(stdin.readLineSync()!);

  gioHang.add({
    'name': name,
    'quantity': quantity,
    'price': price,
  });

  print("=> Đã thêm sản phẩm vào giỏ hàng.");
}

void suaSanPham(List<Map<String, dynamic>> gioHang) {
  stdout.write("Nhập tên sản phẩm cần sửa: ");
  String name = stdin.readLineSync()!;
  int index = gioHang.indexWhere(
    (sp) => sp['name'].toString().toLowerCase() == name.toLowerCase(),
  );

  if (index == -1) {
    print("Không tìm thấy sản phẩm.");
  } else {
    stdout.write("Nhập số lượng mới: ");
    int quantity = int.parse(stdin.readLineSync()!);
    stdout.write("Nhập giá tiền mới: ");
    double price = double.parse(stdin.readLineSync()!);

    gioHang[index]['quantity'] = quantity;
    gioHang[index]['price'] = price;

    print("=> Đã cập nhật sản phẩm.");
  }
}

void xoaSanPham(List<Map<String, dynamic>> gioHang) {
  stdout.write("Nhập tên sản phẩm cần xóa: ");
  String name = stdin.readLineSync()!;
  gioHang.removeWhere(
    (sp) => sp['name'].toString().toLowerCase() == name.toLowerCase(),
  );
  print("=> Đã xóa sản phẩm (nếu có).");
}

void hienThiGioHang(List<Map<String, dynamic>> gioHang) {
  if (gioHang.isEmpty) {
    print("Giỏ hàng trống.");
    return;
  }

  print("\n--- DANH SÁCH GIỎ HÀNG ---");
  for (var sp in gioHang) {
    print(
      "Tên: ${sp['name']} | Số lượng: ${sp['quantity']} | Giá: ${sp['price'].toStringAsFixed(2)} | "
      "Thành tiền: ${(sp['quantity'] * sp['price']).toStringAsFixed(2)}",
    );
  }
}

void tinhTongTien(List<Map<String, dynamic>> gioHang) {
  double tong = 0;
  for (var sp in gioHang) {
    tong += sp['quantity'] * sp['price'];
  }
  print("=> Tổng tiền hóa đơn: ${tong.toStringAsFixed(2)} VND");
}

