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
    private var accountNo:Int = 0
    private var balance: Double
    
    init(name: String) {
        self.name = name
        Customer.currentAccountNo += 1
        accountNo = Customer.currentAccountNo
        balance = 1000
    }
    
    func deposit(amount: Double) {
        balance += amount
    }
    
    func withdraw(amount: Double) -> Double {
        let availableAmount = min(amount, balance)
        balance -= availableAmount
        return availableAmount
    }
    
    func checkAvailableBalance() -> Double {
        return balance
    }
    
    func getAccountNo() -> Int {
        return accountNo
    }
}

let customer1 = Customer(name: "Preeti")

let customer2 = Customer(name: "Ankit")
let customer3 = Customer(name: "Sumit")


customer1.getAccountNo()
customer2.getAccountNo()
customer3.getAccountNo()

customer1.withdraw(amount: 10000)
customer1.checkAvailableBalance()
customer1.deposit(amount: 100)
customer1.checkAvailableBalance()
customer2.checkAvailableBalance()
