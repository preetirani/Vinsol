//: Playground - noun: a place where people can play

import UIKit

//Define a class Customer having three variables "name","accountNo" & "balance".
//
//It must initialise the class object with the name of the customer, auto-increment the account no and set balance to 1000.
//
//Define methods deposit() and withdraw() for this class.

class Customer {
    var name: String
    private static var currentAccountNo = 0
    let accountNo:Int
    private(set) var balance: Double
    
    init(name: String) {
        self.name = name
        Customer.currentAccountNo += 1
        self.accountNo = Customer.currentAccountNo
        balance = 1000
    }
    
    func deposit(amount: Double) {
        balance += amount
    }
    
    func withdraw(amount: Double) -> (status: Bool, balance: Double) {
        guard balance >= amount else {
            return (false, 0.0)
        }
        balance -= amount
        return (status: true, balance: balance)
    }
}

let customer1 = Customer(name: "Preeti")

let customer2 = Customer(name: "Ankit")
let customer3 = Customer(name: "Sumit")

customer1.accountNo
customer2.accountNo
customer3.accountNo

customer1.withdraw(amount: 900)
customer1.withdraw(amount: 200)
if customer1.withdraw(amount: 10000).status == false {
    print("Insufficient Balance")
}
customer1.deposit(amount: 100)
