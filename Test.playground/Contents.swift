import UIKit

class User {
    var id: Int , username: String, password: String
    init(id: Int, username: String, password: String) {
        self.id = id
        self.username = username
        self.password = password
    }
}
class Name: User {
    var name: String?
    init(id: Int,username: String, password: String, name: String) {
        self.name = name
        super.init(id: id, username: username, password: password)
    }
    
}
let user1 = Name(id: 1, username: "vananh", password: "1234", name: "Nguyen Van Anh")
print("ID user : \(user1.id)")
print("username la: \(user1.username)")
print("password la: \(user1.password)")
print("ten nguoi dung: \(user1.name)")
