// classes called by reference look for game example
// let objs can modifiy it's property, look for carDev obj and its class

class Game {
    var score : Int = 0
    func  printScore()  {
     print(score)
    }
}

var newGame = Game()
var mainGame = newGame
newGame.score = 10
mainGame.score = 30
newGame.printScore() //30
mainGame.printScore()//30
// You shared same data from the class and if one change the rest of objs that share same data should be change.
print("----------------------------------")
// Inhertience without init
class Emp {
    let hours:Int
    init(hours : Int) {
        self.hours = hours
    }
    func printSummary(_ workType:String){
        print("I'm a \(workType), I work \(hours) hours per day")
    }
}

class Developer : Emp {}

class Worker : Emp {}

let dev = Developer(hours: 8)
let worker = Worker(hours: 5)
dev.printSummary("dev")
worker.printSummary("worker")

print("----------------------------------")

// Inhertience with init

class Vehicle{
    let isElectric : Bool
    init(isElectric : Bool) {
        self.isElectric = isElectric
    }
}
class CarForDev : Vehicle {
    var isConvertible : Bool // let objs can modifiy it's property
    init(isConvertible: Bool, isElectric:Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}
class CarForWorker : Vehicle {
    let isConvertible : Bool = false
}

let carDev = CarForDev(isConvertible: true, isElectric: true)
carDev.isConvertible = false //let objs can modifiy it's property
let carWorker = CarForWorker(isElectric: true)

//---------------------------

// Copy Classes

class User {
    var username:String = "Omar"
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1.copy()
user2.username = "Bakry"
print(user1.username)
print(user2.username)

print("----------------------------------")

// deinit

class DeInitTest{
    let id : Int
    init(id:Int) {
        self.id = id
        print("User \(id) : I'm alive")
    }
    
    deinit {
        print("User \(id) : I'm dead")
    }
}

for i in 1...3 {
    let user = DeInitTest(id: i)
    print("User \(user.id) : I'm in control")
//    User 1 : I'm alive
//    User 1 : I'm in control
//    User 1 : I'm dead
//    User 2 : I'm alive
//    User 2 : I'm in control
//    User 2 : I'm dead
//    User 3 : I'm alive
//    User 3 : I'm in control
//    User 3 : I'm dead
}
print("----------------------------------")
var users :[DeInitTest] = [DeInitTest]()
for i in 1...3{
   
    let user = DeInitTest(id: i)
    print("User \(user.id) : I'm in control")
    users.append(user)
}

users.removeAll()
//User 1 : I'm alive
//User 1 : I'm in control
//User 2 : I'm alive
//User 2 : I'm in control
//User 3 : I'm alive
//User 3 : I'm in control
//User 1 : I'm dead
//User 2 : I'm dead
//User 3 : I'm dead
print("Array cleared !")
//Users don't destroy immediatly because they're stored in array
print("----------------------------------")
