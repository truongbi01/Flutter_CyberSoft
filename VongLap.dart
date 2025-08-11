import 'dart:io';

class SinhVien{
  String ten;

  double toan, ly, hoa;

  SinhVien(this.ten, this.toan, this.ly, this.hoa);
  double get diemTrungBinh {
    return (toan + ly + hoa) / 3;
  }

   String get xepLoai {
    if (diemTrungBinh < 5) return "Kém";
    else if (diemTrungBinh < 7) return "Khá";
    else if (diemTrungBinh <= 9) return "Giỏi";
    else return "Xuất sắc";
  }
}
void main(){
  List<SinhVien> ds = [];
  String? chon;
  do {
    print("1. Thêm sinh viên");
    print("2. Hiển thị danh sách");
    print("3. Tìm SV có ĐTB cao nhất");
    print("4. Thoát");
    stdout.write("Chọn: ");
    chon = stdin.readLineSync();

    switch (chon) {
      case "1":
        stdout.write("Họ tên: ");
        String ten = stdin.readLineSync()!;
        stdout.write("Điểm Toán: ");
        double toan = double.parse(stdin.readLineSync()!);
        stdout.write("Điểm Lý: ");
        double ly = double.parse(stdin.readLineSync()!);
        stdout.write("Điểm Hóa: ");
        double hoa = double.parse(stdin.readLineSync()!);
        ds.add( SinhVien(ten, toan, ly, hoa));
        break;

      case "2": 
        if (ds.isEmpty) {
          print("Chưa có sinh viên nào.");
        } else {
          for (var sv in ds) {
            print(
                "${sv.ten} | Điểm trung bình: ${sv.diemTrungBinh.toStringAsFixed(2)} | Xếp loại: ${sv.xepLoai}");
          }
        }
        break;

      case "3":
        if (ds.isEmpty) { 
          print("Chưa có dữ liệu!");
        } else {
          var svMax = ds.reduce((a, b) => a.diemTrungBinh > b.diemTrungBinh ? a : b);
          print(
              "SV cao nhất: ${svMax.ten} | ${svMax.diemTrungBinh.toStringAsFixed(2)} ");
        }
        break;

      case "4":
        print("Kết thúc chương trình!");
        break;

      default:
        print("Lại");
    }
  } while (chon != "4");
}
