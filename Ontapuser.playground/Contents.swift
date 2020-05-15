import UIKit
// struct
struct Sinhvien {
    var id: Int
    var MaSV: String
    var TenSV: String
    var DiaChi: String?
}

var ThongTin = Sinhvien(id: 1, MaSV: "SV01", TenSV: "Nguyen Van 1", DiaChi: "TN")
print("Thong Tin SV: \(ThongTin)")

class User {
    var  name = ""
    var tentruong: String?
    var thongtinsv = Sinhvien(id: 2, MaSV: "MA02", TenSV: "Nguyen Van B", DiaChi: "TN")
    
}
var  user1 = User()
var user2 = user1
var user3 = User()
if(user1 === user2){
    print(" user 2 giong user 1")
}
if (user3 === user1) {
    print("user 3 giong use 1")
}
else {
    print("user 3 khong nam trong vung nho voi user 1")
}
print("masv cua ban B la: \(user1.thongtinsv.MaSV)")

