//: Playground - noun: a place where people can play

import UIKit

extension Array where Element: Equatable {
    mutating func remove(object: Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }
}

enum CategoryType {
    case book, food, medicine, choclate, stationary
}

class Category {
    private let taxableCategories: [CategoryType] = [.choclate, .stationary]
    private let name: CategoryType
    
    var isTaxable: Bool {
        return taxableCategories.contains(name)
    }
    
    init(name: CategoryType) {
        self.name = name
    }
    
    private static let all: [Category] = [
        Category(name: .book),
        Category(name: .food),
        Category(name: .medicine),
        Category(name: .choclate),
        Category(name: .stationary)
    ]
    
    static var book : Category {
        return Category.all.first(where: {$0.name == .book})!
    }
    
    static var food : Category {
        return Category.all.first(where: {$0.name == .food})!
    }
    
    static var medicine : Category {
        return Category.all.first(where: {$0.name == .medicine})!
    }
    
    static var choclate : Category {
        return Category.all.first(where: {$0.name == .choclate})!
    }
    
    static var stationary : Category {
        return Category.all.first(where: {$0.name == .stationary})!
    }
}

class Product {
    private static var currentProductId = 0
    let ID: Int
    var name: String
    var isImported: Bool
    private(set) var price: Double
    var category: Category
    
    init(name: String, isImported: Bool, price: Double, category: Category) {
        self.name = name
        self.isImported = isImported
        self.price = price
        self.category = category
        Product.currentProductId += 1
        self.ID = Product.currentProductId
    }
}

extension Product: Equatable {
    public static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.ID == rhs.ID
    }
}

class CartItem {
    let product: Product
    var quantity: Int = 0
    
    var perUnitTax: Double {
        var tax: Double = 0.0
        let price = product.price
        
        if product.category.isTaxable {
            tax = price * Constants.salesTax
        }
        
        if product.isImported {
            tax += price * Constants.additionalTax
        }
        return tax
    }
   
    var tax: Double {
        return perUnitTax * Double(quantity)
    }
    
    init(product: Product, quantity: Int = 1) {
        self.product = product
        self.quantity = quantity
    }
    
    func totalPrice(inclusiveOfTaxes: Bool) -> Double {
        var totalPrice: Double = product.price *  Double(quantity)
        if inclusiveOfTaxes {
            totalPrice = totalPrice + tax
        }
        return totalPrice
    }
}

extension CartItem: Equatable {
    public static func ==(lhs: CartItem, rhs: CartItem) -> Bool {
        return lhs.product.ID == rhs.product.ID
    }
}

extension CartItem {
    struct Constants {
        static let salesTax = 0.10
        static let additionalTax = 0.05
    }
}

class Cart {
    static let shared: Cart = Cart()
    var cartItems: [CartItem] = []
    
    private init() {}
    
    func add(product: Product) {
        if let cartItem = cartItems.first(where: {$0.product.ID == product.ID}) {
            cartItem.quantity += 1
        } else {
            cartItems.append(CartItem(product: product))
        }
    }
    
    func remove(product: Product) {
        if let cartItem = cartItems.first(where: {$0.product.ID == product.ID}) {
            cartItem.quantity -= 1
            if cartItem.quantity == 0 {
                cartItems.remove(object: cartItem)
            }
        }
    }
    
    var totalPrice: Int {
        let price = cartItems.reduce(0.0) { (result, cartItem) -> Double in
            result + cartItem.totalPrice(inclusiveOfTaxes: true)
        }
        return Int(round(price))
    }
    
    func generateBill() {
        for cartItem in cartItems {
            print("** \(cartItem.product.name) **")
            print("Price : \(cartItem.product.price)  Quantity : \(cartItem.quantity) Tax : \(cartItem.tax)")
            print("----------------------------------------------------------------------------------------")
        }
        print("************ Total Price : \(totalPrice) ************")
    }
}

let book1 = Product(name: "Ramayan", isImported: false, price: 100, category: Category.book)
let kitkat = Product(name: "Kitkat", isImported: true, price: 100, category: Category.choclate)
Cart.shared.add(product: book1)
Cart.shared.add(product: book1)
Cart.shared.add(product: kitkat)
Cart.shared.add(product: kitkat)
Cart.shared.add(product: book1)
Cart.shared.cartItems[0].product.name
Cart.shared.cartItems[0].quantity
Cart.shared.remove(product: book1)
Cart.shared.remove(product: book1)
Cart.shared.remove(product: kitkat)
Cart.shared.cartItems[0].quantity
Cart.shared.cartItems.count
Cart.shared.generateBill()
Category.book.isTaxable

