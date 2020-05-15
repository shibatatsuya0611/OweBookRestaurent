import UIKit
// kieu du lieu liet ke
enum Capbac {
    case easy, medium, high, veryhigh
}
var capbaccuatoi:Capbac = .veryhigh
switch capbaccuatoi {
case .high:
    print("day la cap do cuc nhanh")
case .easy:
    print(" cap bac de dang")
case .medium:
    print("cap bac binh thuong")
case .veryhigh:
    print("cap bac cuc ky nhanh")
default:
    print("khong co cap bac")
}
