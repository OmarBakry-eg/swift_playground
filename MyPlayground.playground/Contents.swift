
// In struct you don't need to create an init constructor at all
// but if you need to create a custom init and keep the origin init as it you may have to create them both.
// Sructs are called by value. ( See objThree and objFour )

struct MyStruct
{
    var name,age,phone:String
     
    private var isAvailabe :Bool = false // private field
    
    var computedStaute : String { //computed
        if age == "23" {
            return "Good Age"
        }else{
            return "Maybe Higher or less than normal age"
        }
    }
    
    var getBoolStatue : String { // getter and setter
        get{
            isAvailabe ? "YASS Bool is true" : "Noop its false"
        }
        
        set{
            isAvailabe = Bool.random()
        }
    }
    
    init(name:String,age:String,phone:String) { // Origin iniit
        self.name = name;
        self.age=age
        self.phone=phone
    }
    init(namePlusOmar name:String,age:String,phone:String) { // Custom init
        self.name = "\(name) plus omar";
        self.age=age
        self.phone=phone
    }
    
    func printData () -> Void {
       print("My name is \(name), My age is \(age) and My phone \(phone)")
    }
    
    mutating func changeAge(age:String){
        //if you wanna change any struct property in method you've to mutate it to be mutable because struct members always immutable
        self.age = age
    }
    
}
let objOne = MyStruct(name: "Omar", age: "23", phone: "01212121212")
var objTwo = MyStruct.init(namePlusOmar: "Ahemd", age: "23", phone:"010101010")
//objTwo must be a var not let like age, as long as you use mutating func your obj must be mutable also.
objOne.printData()
print(objOne.computedStaute)
objTwo.changeAge(age: "12")
objTwo.printData()
print(objTwo.computedStaute)

var objThree = MyStruct(name: "ObjThree", age: "23", phone: "01212121212")
//objThree must be a var not let like name, as long as you wanna set new value to any attrbuite you've to define your obj as var .
let objFour = objThree
//When you equalizing two obj from ( STRUCT ) you actually create new obj that holds the same data from the equalizing one, so if you change any property of any one it will change on it just. see below .

objThree.name = "BAKRY"
objThree.printData() // name is BAKRY
objFour.printData() // name is ObjThree


struct App {
    // property observer
    var contacts = [String]() {
        willSet{
            print("Current val is : \(contacts)")
            print("New val is : \(newValue)") // newValue supported by willSet Observer
        }
        
        didSet{
            print("There're now \(contacts.count) contacts")
            print("Old val was : \(oldValue)") // oldValue supported by didSet Observer
        }
        
    }
}

var app = App()

app.contacts.append("Omar") 
app.contacts.append("Ali")
app.contacts.append("Ahmed")
//Current val is : []
//New val is : ["Omar"]
//There're now 1 contacts
//Old val was : []
//Current val is : ["Omar"]
//New val is : ["Omar", "Ali"]
//There're now 2 contacts
//Old val was : ["Omar"]
//Current val is : ["Omar", "Ali"]
//New val is : ["Omar", "Ali", "Ahmed"]
//There're now 3 contacts
//Old val was : ["Omar", "Ali"]

