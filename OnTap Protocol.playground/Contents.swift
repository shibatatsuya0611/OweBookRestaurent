import UIKit

 protocol Delegatedautien: class
 {
    func passDat(data: String)
    func Motbien( _ a: Int,_  b: Int) ->Int
}


class  FirstDL
{

   weak var delegate: Delegatedautien?
    
    func sakjdbs() {
        print("here")
        self.delegate?.passDat(data: "a,sndlas")
    }
    
}
class FirstrerL {
    
    var dataFromSecretry: String? {
        willSet {
            print("new value \(newValue)")
            print("data \(dataFromSecretry)")
        }
    }
    
}

extension FirstrerL: Delegatedautien
{
    func passDat(data: String) {
        dataFromSecretry = data
        print("data \(data)")
    }
    
   func Motbien( _ a: Int, _ b: Int) -> Int
   {
    return a + b
   }
}
let fistVC = FirstDL()
fistVC.sakjdbs()
let seconCV = FirstrerL()
print("data to \(seconCV.dataFromSecretry)")
