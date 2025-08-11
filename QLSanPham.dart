import 'dart:io';

class SanPham{
  String ten;

  double gia, soLuong;

  SanPham(this.ten, this.gia, this.soLuong);
  
}
void main(){
  List<SanPham> sp = [];
  String? chon;
  do {
    print("1. Thêm sản phẩm ");
    print("2. Hiển thị danh sách sản phẩm ");
    print("3. Tìm kiếm sản phẩm ");
    print("4. Bán sản phẩm:");
     print("5. Thoát");
    stdout.write("Chọn: ");
    chon = stdin.readLineSync();

    switch (chon) {
      case "1":
        stdout.write("Họ tên: ");
        String ten = stdin.readLineSync()!;
        stdout.write("Giá: ");
        double gia = double.parse(stdin.readLineSync()!);
        stdout.write("Số lượng: ");
        double soLuong = double.parse(stdin.readLineSync()!);
        sp.add(SanPham(ten, gia, soLuong));
        break;

      case "2": 
        if (sp.isEmpty) {
          print("Chưa có sản phẩm nào.");
        } else {
          for (var i in sp) {
            print(
                "${i.ten} | Giá: ${i.gia.toStringAsFixed(2)} | Số lượng: ${i.soLuong.toStringAsFixed(0)}");
          }
        }
        break;

      case "3":
        if (sp.isEmpty) { 
          print("Chưa có dữ liệu!");
        } else {
          stdout.write("Nhập tên sản phẩm cần tìm: ");
          String tenCanTim = stdin.readLineSync()!;
          var ketQua = sp.where((sp) => sp.ten.toLowerCase().contains(tenCanTim.toLowerCase()));
          if (ketQua.isEmpty) {
            print("Không tìm thấy sản phẩm nào.");
          } else {
            ketQua.forEach((sp) => print("${sp.ten} | Giá: ${sp.gia.toStringAsFixed(2)} | Số lượng: ${sp.soLuong.toStringAsFixed(0)}"));
          }
        }
        break;
        case "4":
        if (sp.isEmpty) {
          print("Chưa có sản phẩm nào để bán.");
        } else {
          stdout.write("Nhập tên sản phẩm cần bán: ");
          String tenCanBan = stdin.readLineSync()!;
          var sanPham = sp.firstWhere((sp) => sp.ten.toLowerCase() == tenCanBan.toLowerCase(), orElse: () => SanPham("", 0, 0));
          if (sanPham.ten.isEmpty) {
            print("Sản phẩm không tồn tại.");
          } else {
            stdout.write("Nhập số lượng bán: ");
            double soLuongBan = double.parse(stdin.readLineSync()!);
            if (soLuongBan > sanPham.soLuong) {
              print("Số lượng bán vượt quá số lượng hiện có.");
            } else {
              sanPham.soLuong -= soLuongBan;
              print("Đã bán $soLuongBan ${sanPham.ten}. Số lượng còn lại: ${sanPham.soLuong}");
            }
          }
        }
        break;
      case "5":
        print("Kết thúc chương trình!");
        break;

      default:
        print("Lại");
    }
  } while (chon != "4");
}
