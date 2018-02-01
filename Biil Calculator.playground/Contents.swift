//: Playground - noun: a place where people can play

import UIKit

/* There are pre-defined categories say book, food, medicine, chocolate, stationary etc..
Category has the following attributes:
- Name
- Exempted from Sales tax: (Y/N)

A product belongs to a category.
Product would comprise of following attributes:
- Name
- Imported (Y/N)
- Price
- Category

Following are the rules to calculate tax:
a. Flat 10% sales tax is applicable on all items except for books, food and medicines
b. Additional Import Duty of 5% is applicable on all imported items

Store the customers choice of products & quantity in his shopping cart.
Add following functions to the cart class:
cart.add(product: p1) would increase the product quantity in the cart by 1
similarly cart.remove() will do the opposite.

Note: Cart would be a singleton class.

Shopping cart should have a method to calculate the total inclusive of taxes.
This method should print the itemised bill with each Product in the cart listed along with its name, price, qty & tax.
Print the total in the last line rounded to the nearest integer. */

enum CategoryType {
    case book, food, medicine, choclate, stationary
}

struct Category {
    var name: CategoryType
    var includeSalesTax: Bool
    
    init(name: CategoryType) {
        self.name = name
        
        switch name {
        case .choclate, .stationary:
            self.includeSalesTax = true
        default:
            self.includeSalesTax = false
        }
    }
}

class Product {
    var name: String
    var isImported: Bool
    var price: Double
    var category: Category
    
    init(name: String, isImported: Bool, price: Double, categoryType: CategoryType) {
        self.name = name
        self.isImported = isImported
        self.price = price
        self.category = Category(name: categoryType)
    }
}

class CartItem {
    let product: Product
    var quantity: Int = 0
    var tax: Double = 0.0
    
    init(product: Product, quantity: Int = 1) {
        self.product = product
        self.quantity = quantity
    }
}

class Cart {
    static let shared: Cart = Cart()
    var cartItems: [CartItem] = []
    
    private init() {}
    
    func add(product: Product) {
        if let cartItem = cartItems.first(where: {$0.product.category.name == product.category.name && $0.product.name == product.name}) {
            cartItem.quantity += 1
        } else {
            cartItems.append(cartItem(withProduct: product))
        }
    }
    
    func remove(product: Product) {
        for (index, cartItem) in cartItems.enumerated() {
            if cartItem.product.category.name == product.category.name && cartItem.product.name == product.name {
                cartItem.quantity -= 1
                if cartItem.quantity == 0 {
                    cartItems.remove(at: index)
                }
                break
            }
        }
    }
   
    /* this method should print the itemised bill with each Product in the cart listed along with its name, price, qty & tax.
     * Print the total in the last line rounded to the nearest integer. */
    
    func generateBill() {
        var totalCartPrice: Double = 0.0
        for cartItem in cartItems {
            print("** \(cartItem.product.name) **")
            print("Price : \(cartItem.product.price)  Quantity : \(cartItem.quantity) Tax : \(cartItem.tax)")
            print("----------------------------------------------------------------------------------------")
            totalCartPrice += totalPrice(ofCartItem: cartItem, inclusiveOfTaxes: true)
        }
        let totalPriceInInt = Int(round(totalCartPrice))
        print("************ Total Price : \(totalPriceInInt) ************")
    }
    
    
    
    private func cartItem(withProduct product: Product) -> CartItem {
        let cartItem = CartItem(product: product)
        var tax: Double = 0.0
        if product.category.includeSalesTax {
            tax = Constants.salesTax
        }
        
        if product.isImported {
            tax += Constants.additionalTax
        }
        cartItem.tax = tax
        
        return cartItem
    }
    
    private func totalPrice(ofCartItem cartItem: CartItem, inclusiveOfTaxes: Bool) -> Double {
        var totalPrice: Double = cartItem.product.price *  Double(cartItem.quantity)
        if inclusiveOfTaxes {
            totalPrice = totalPrice + (totalPrice * cartItem.tax)
        }
        return totalPrice
    }
  
    struct Constants {
        static let salesTax = 0.10
        static let additionalTax = 0.05
    }
}

let book1 = Product(name: "Ramayan", isImported: false, price: 100, categoryType: .book)
let kitkat = Product(name: "Kitkat", isImported: true, price: 100, categoryType: .choclate)
Cart.shared.add(product: book1)
Cart.shared.add(product: book1)
Cart.shared.add(product: kitkat)
Cart.shared.add(product: kitkat)
Cart.shared.add(product: book1)
Cart.shared.cartItems[0].product.name
Cart.shared.cartItems[0].quantity
Cart.shared.remove(product: book1)
Cart.shared.remove(product: book1)
Cart.shared.remove(product: book1)
Cart.shared.cartItems[0].quantity
Cart.shared.cartItems.count
Cart.shared.generateBill()
