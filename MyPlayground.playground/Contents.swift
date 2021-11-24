

// protocols = abstraction
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Bicycle: Vehicle {
    var name = "Bicycle"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

let car = Car()
commute(distance: 100, using: car)

var bike = Bicycle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car, bike], distance: 150)

print("---------------------------")

// Opaque return types
// idea here we need to return a protocol and equalaize the two retrun types from one func , so we return a public protocol Equatable, but as we know protocol can be adobted by a lot of children So we need just a `SOME` from them that mean not all of things but just its specifc return data type
func getRandomNum() -> some Equatable{
  //  Int.random(in: 1...6)
    Double.random(in: 1...6) // you could retrun anything here
}

func getRandomBool() -> some Equatable{
    Bool.random()
}

print(getRandomNum() == getRandomNum()) // false
print("---------------------------")

//extensions
struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    // If I put it in main struct it will throw an err because if we defined a custom init we've to define first the default init , so if we don't then extension can do it perfectly
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)
let swfitBook = Book(title: "Swift Book", pageCount: 600)


protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person { // protocol extension ..
// if I did not define the func sayHello here it will caught an exp in Employee class but If I defined it could be a default implementation to it
    func sayHello() {
           print("Hi, I'm \(name)")
       }
}

struct Employee: Person {
    let name: String
    // I could override it or not
//    func sayHello() {
//        <#code#>
//    }
}

let taylor = Employee(name: "Omar Bakry")
taylor.sayHello()
// --------------------------------
