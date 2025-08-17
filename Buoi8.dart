import 'dart:io';

void main() {
  List<Map<String, dynamic>> gioHang = [];
  String? chon;

  do {
    print("\n===== MENU =====");
    print("1. Thêm sản phẩm vào giỏ hàng");
    print("2. Sửa và xóa sản phẩm trong giỏ hàng");
    print("3. Hiển thị giỏ hàng");
    print("4. Tính tổng tiền hóa đơn");
    print("5. Thoát");
    stdout.write("Chọn: ");
    chon = stdin.readLineSync();

    switch (chon) {
      case "1":
        themSanPham(gioHang);
        break;
      case "2":
        suaXoaSanPham(gioHang);
        break;
      case "3":
        hienThiGioHang(gioHang);
        break;
      case "4":
        tinhTongTien(gioHang);
        break;
      case "5":
        print("Kết thúc chương trình!");
        break;
      default:
        print("Chọn sai, vui lòng nhập lại!");
    }
  } while (chon != "5");
}

// 1. Thêm sản phẩm
void themSanPham(List<Map<String, dynamic>> gioHang) {
  stdout.write("Tên sản phẩm: ");
  String ten = stdin.readLineSync()!;
  stdout.write("Giá: ");
  double gia = double.parse(stdin.readLineSync()!);
  stdout.write("Số lượng: ");
  int soLuong = int.parse(stdin.readLineSync()!);

  gioHang.add({
    "ten": ten,
    "gia": gia,
    "soLuong": soLuong,
  });

  print("✅ Đã thêm $ten vào giỏ hàng.");
}

// 2. Sửa hoặc xóa sản phẩm
void suaXoaSanPham(List<Map<String, dynamic>> gioHang) {
  if (gioHang.isEmpty) {
    print("❌ Giỏ hàng trống.");
    return;
  }

  hienThiGioHang(gioHang);
  stdout.write("Nhập tên sản phẩm cần sửa/xóa: ");
  String ten = stdin.readLineSync()!;

  var sp = gioHang.firstWhere(
    (sp) => sp["ten"].toLowerCase() == ten.toLowerCase(),
    orElse: () => {},
  );

  if (sp.isEmpty) {
    print("Không tìm thấy sản phẩm.");
    return;
  }

  print("1. Sửa sản phẩm");
  print("2. Xóa sản phẩm");
  stdout.write("Chọn: ");
  String? chon = stdin.readLineSync();

  if (chon == "1") {
    stdout.write("Nhập số lượng mới: ");
    sp["soLuong"] = int.parse(stdin.readLineSync()!);
    stdout.write("Nhập giá mới: ");
    sp["gia"] = double.parse(stdin.readLineSync()!);
    print("Đã cập nhật sản phẩm.");
  } else if (chon == "2") {
    gioHang.remove(sp);
    print("Đã xóa sản phẩm.");
  } else {
    print("Lựa chọn không hợp lệ.");
  }
}

// 3. Hiển thị giỏ hàng
void hienThiGioHang(List<Map<String, dynamic>> gioHang) {
  if (gioHang.isEmpty) {
    print("🛒 Giỏ hàng trống.");
  } else {
    print("\n===== GIỎ HÀNG =====");
    for (var sp in gioHang) {
      print(
          "${sp["ten"]} | Giá: ${sp["gia"].toStringAsFixed(2)} | SL: ${sp["soLuong"]}");
    }
  }
}

// 4. Tính tổng tiền
void tinhTongTien(List<Map<String, dynamic>> gioHang) {
  if (gioHang.isEmpty) {
    print(" Giỏ hàng trống.");
    return;
  }

  double tong = 0;
  for (var sp in gioHang) {
    tong += sp["gia"] * sp["soLuong"];
  }

  print("ổng tiền hóa đơn: ${tong.toStringAsFixed(2)} VND");
}
