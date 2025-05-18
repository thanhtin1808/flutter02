import 'dart:io';

void main(List<String> args) {
  // Bài tập quản lý sinh viên
  // quanLiSinhVien();
  print("----------------------");
  // Bài tập quản lý đơn bán hàng
  // quanLiDonHang();
  var a = 3.16;
  print(a.toStringAsFixed(2));
}

void quanLiSinhVien() {
  // Nhập thông tin nhân viên
  stdout.write('Nhập họ tên: ');
  String? name = stdin.readLineSync();

  stdout.write('Nhập số giờ làm việc: ');
  double hoursWorked = double.parse(stdin.readLineSync()!);

  stdout.write('Nhập lương mỗi giờ: ');
  double hourlyRate = double.parse(stdin.readLineSync()!);

  // Tính tổng lương trước phụ cấp
  double baseSalary = hoursWorked * hourlyRate;

  // Tính phụ cấp (20% nếu làm trên 40 giờ)
  double allowance = hoursWorked > 40 ? baseSalary * 0.2 : 0;
  double totalSalaryBeforeTax = baseSalary + allowance;

  // Tính thuế thu nhập
  double tax = 0;
  if (totalSalaryBeforeTax > 10000000) {
    tax = totalSalaryBeforeTax * 0.1;
  } else if (totalSalaryBeforeTax >= 7000000) {
    tax = totalSalaryBeforeTax * 0.05;
  }

  // Tính lương thực lãnh
  double netSalary = totalSalaryBeforeTax - tax;

  // In kết quả
  print('\n=== Thông tin lương nhân viên ===');
  print('Họ tên: $name');
  print(
    'Tổng lương trước thuế: ${totalSalaryBeforeTax.toStringAsFixed(0)} VND',
  );
  print('Thuế thu nhập: ${tax.toStringAsFixed(0)} VND');
  print('Lương thực lãnh: ${netSalary.toStringAsFixed(0)} VND');
}

void quanLiDonHang() {
  // Nhập thông tin hóa đơn
  stdout.write('Nhập tên sản phẩm: ');
  String? productName = stdin.readLineSync();

  stdout.write('Nhập số lượng mua: ');
  int quantity = int.parse(stdin.readLineSync()!);

  stdout.write('Nhập đơn giá: ');
  double unitPrice = double.parse(stdin.readLineSync()!);

  // Tính thành tiền
  double subtotal = quantity * unitPrice;

  // Tính giảm giá
  double discount = 0;
  if (subtotal >= 1000000) {
    discount = subtotal * 0.1; // Giảm 10%
  } else if (subtotal >= 500000) {
    discount = subtotal * 0.05; // Giảm 5%
  }

  // Tính tiền sau giảm giá
  double amountAfterDiscount = subtotal - discount;

  // Tính thuế VAT 8%
  double vat = amountAfterDiscount * 0.08;

  // Tính tổng thanh toán
  double totalPayment = amountAfterDiscount + vat;

  // In hóa đơn
  print('\n=== HÓA ĐƠN BÁN HÀNG ===');
  print('Tên sản phẩm: $productName');
  print('Số lượng: $quantity');
  print('Đơn giá: ${unitPrice.toStringAsFixed(0)} VND');
  print('Thành tiền: ${subtotal.toStringAsFixed(0)} VND');
  print('Giảm giá: ${discount.toStringAsFixed(0)} VND');
  print('Thuế VAT (8%): ${vat.toStringAsFixed(0)} VND');
  print('Tổng thanh toán: ${totalPayment.toStringAsFixed(0)} VND');
}
