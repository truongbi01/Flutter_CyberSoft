import 'dart:io';
 void main() {
  stdout.write(" Nhập tên:");
  String Ten = stdin.readLineSync()!;
  stdout.write(" Nhập số giờ làm việc:");
  double SoGioLamViec = double.parse(stdin.readLineSync()!);
  stdout.write(" Nhập lương theo giờ:");
  double LuongTheoGio = double.parse(stdin.readLineSync()!);

  double Luong = SoGioLamViec * LuongTheoGio;

  if(SoGioLamViec >40){
    Luong += Luong * 0.2; // Thưởng 20% nếu làm quá 40 giờ
  }
  double Thue = 0; 
  if (Luong> 10000000){
      Thue=Luong * 0.1; // Giả sử thuế là 10% của lương
    } else if( Luong > 7000000)
    {
      Thue = Luong * 0.05; // Giả sử thuế là 5% của lương
    } else {
      Thue = 0; // Không có thuế nếu lương dưới 7 triệu
    }// Giả sử thuế là 10% của lương
    double LuongThucLanh= Luong - Thue;
    print("Tên: $Ten");
    print("Tổng lương trước thuế: ${Luong.toStringAsFixed(0)} VND");
    print("Thuế: ${Thue.toStringAsFixed(0)} VND");
    print("Lương thực lãnh: ${LuongThucLanh.toStringAsFixed(0)} VND");
 }
