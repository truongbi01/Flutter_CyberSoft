import 'dart:io';
 void main() {
  stdout.write(" Nhập tên sản phẩm:");
  String Ten = stdin.readLineSync()!;
  stdout.write(" Nhập số lượng mua:");
  double SoLuong = double.parse(stdin.readLineSync()!);
  stdout.write(" Nhập đơn giá:");
  double Gia = double.parse(stdin.readLineSync()!);

  double ThanhTien = SoLuong * Gia;
  double GiamGia = 0;
  if (ThanhTien >= 1000000) {
    GiamGia = ThanhTien * 0.10;
  } else if (ThanhTien >= 500000) {
    GiamGia = ThanhTien * 0.05;
  }
  double GiaSauGiam = ThanhTien - GiamGia;
  double thueVAT = GiaSauGiam * 0.08; 
  double TongTienFinal = GiaSauGiam + thueVAT;
  print("Tên sản phẩm: $Ten");
  print("Số lượng mua: ${SoLuong.toStringAsFixed(0)}");
  print("Đơn giá: ${Gia.toStringAsFixed(0)} VND");
  print("Thành tiền: ${ThanhTien.toStringAsFixed(0)} VND");
  print("Giá sau giảm: ${GiaSauGiam.toStringAsFixed(0)} VND");
  print("Thuế VAT: ${thueVAT.toStringAsFixed(0)} VND");
  print("Tổng tiền thanh toán: ${TongTienFinal.toStringAsFixed(0)} VND");
 }
