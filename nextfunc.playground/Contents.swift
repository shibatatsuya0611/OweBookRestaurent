import UIKit

// func variadic Parameter mutating
func sumDoule( _ number: Double...) -> Double {
    var  total: Double = 0
    for number in number {
        total += number
    }
    return total
}

print(sumDoule(5,6,7,2.1))

// func inout

var a: Int = 4
var b: Int = 54

func swapSo( _ a: inout Int, _ b: inout Int){
    let trunggian = a
    a = b
    b = trunggian
    
}
   swapSo(&a,&b)

    print("\(a)")
    print("\(b)")

//func chua defaut value

func defautvalue(apm: Int, bpm: Int = 30) -> Int {
    return apm + bpm
}
print(" tong 2 so =: \(defautvalue(apm: 10))")

// nested function --- ham` trong ham`
func skipSay()
{
    func SayYouDo()
    {
        print("Say you do ! say you do !!!!")
    }
    func SaySky()
    {
        print("Sky oi ! Sky oi !!!!")
    }
    SayYouDo()
    SaySky()
}
skipSay()

