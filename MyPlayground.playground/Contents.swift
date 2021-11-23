
struct MyStrcut
{
    var name,age,phone:String
    
    func printData () -> Void {
       print("My name is \(name), My age is \(age) and My phone \(phone)")
    }
}
//let objOne = MyStrcut(name: "Omar", age: "23", phone: "01212121212")
//
//var objTwo = objOne;
//objTwo.name = "Ahmed"
//objTwo.printData()
//objOne.printData()

class MyClass {
    var name,age,phone:String
    init(name:String,age:String,phone:String) {
        self.age=age
        self.name=name
        self.phone=phone
    }
    
    func printData () -> Void {
       print("My name is \(name), My age is \(age) and My phone \(phone)")
    }
}

let objOneClass = MyClass(name: "Omar", age: "23", phone: "01212121212")

var objTwoClass = objOneClass;
objTwoClass.name = "Ahmed"
objTwoClass.printData()
objOneClass.printData()
