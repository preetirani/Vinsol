//: Playground - noun: a place where people can play

import UIKit

/* Define a class in Swift and include how to specify instance variables and methods
 *  Please provide an example that includes:
 *  Stored properties (editable and non-editable)
 *  Computed properties
 *  Initializers, custom Initializers
 *  Functions
 *  Object Initialization, call to variables and functions
 */
extension Date {
    var age: Int {
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year!
    }
}

enum Gender { case male, female, unknown }
class Person { //class definition
    var name: String  // stored property (instance variable)
    let gender: Gender // stored property (instance constant)
    let dob: String
    var greeted: Bool = false
   
    //computed property
    var age: Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "mmddyyyy"
        if let dobDate = formatter.date(from: dob) {
            return dobDate.age
        }
        return 0
    }

    init(name: String, gender: Gender, dob: String) {
        self.name = name
        self.gender = gender
        self.dob = dob
    }
    
    func greet() -> String {
        if greeted {
            return "Welcome back \(name)!!"
        } else {
            greeted = true
            return "Hello \(name)"
        }
    }
    
    var about: String {
        return "Name: \(name), Gender : \(gender), DOB: \(dob)"
    }
}


//Note: Assuming user will always provide a valid dob in ddmmyyyy
let preeti = Person(name: "Preeti", gender: .female, dob: "23011993")
preeti.age  // call to computed property
preeti.about
preeti.greet() //call to function
preeti.greet()
preeti.name = "Seema" // changing variables
//preeti.gender = .male  // can't change gender because it defined as constant
preeti.greet()
