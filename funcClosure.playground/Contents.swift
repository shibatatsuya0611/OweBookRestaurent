import UIKit
// func co parameter la 1 closure
func CongViec1(hoanthanh: () -> Void){
    print("Cong viec 1")
    hoanthanh()
}
CongViec1 {
    print("day la cong viec 1")
}
