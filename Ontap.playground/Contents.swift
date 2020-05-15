import UIKit

//Vi du Closure
let NhanVien = ["Thien","Tu","Phuong","Phong","Thanh","Huy","Clousre"]
func sapxepNV(s1: String, s2: String) ->Bool {
    return s1 < s2
}
// sapxep co the su dung nhieu lan.
var ketqua = NhanVien.sorted(by: sapxepNV)
print("Sau khi sap xep: \(ketqua)")

//binh phuong su dung map
let mangsoInt = [1,2,3,4,5,6]
var binhphuong = mangsoInt.map{(mangsoInt) -> Int in
    return mangsoInt * mangsoInt
}
print("binh phuong len: \(binhphuong)")
// closures su dung ham rong~
func CV1(hoanthanh: @escaping(_ responString: String,_ erroCode: Int) -> Void){
    print("CV 1...")
    hoanthanh("thanh cong",200)
}
CV1 {(responString, erroCode) in
    print("day la CV 1....., respons = \(responString), erro code = \(erroCode)")
}
// tu dong tao closure
func lamnhieuviec(viecnang: @autoclosure() -> Void){
    print("truoc khi autoclosure")
    viecnang()
}
lamnhieuviec(viecnang: print(" dang  lam viec nang, toi o ben trong autoclosure"))
