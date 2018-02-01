//: Playground - noun: a place where people can play

import UIKit
/*  Define a structure in Swift and include how to specify instance variables and methods
 *  Please provide an example that includes:
 *  Stored properties (editable and non-editable)
 *  Computed properties
 *  Initializers, custom Initializers
 *  Functions
 *  Object Initialization, call to variables and functions */

struct Point {
    var x: Int //stored variable property
    var y: Int
    
    //Function
    func isToTheRightOf(x: Int) -> Bool {
        return self.x > x
    }
}

struct Rect {
    var origin: Point
    let height: Int // constant stored property
    let width: Int
    
    var area: Int {
        return height * width
    }
    
    init(origin: Point, height: Int, width: Int) {
        self.origin = origin
        self.height = height
        self.width = width
    }
    
    init(center: Point, height: Int, width: Int) {
        let x = center.x - (width/2)
        let y = center.y - (height/2)
        self.init(origin: Point(x: x, y: y), height: height, width: width)
    }
}

//Note: Assuming we don't want the rect to be of variable height and width

let point = Point(x: 0, y: 0) // Initialisation of struct
point.isToTheRightOf(x: 20) // calling function

var rect1 = Rect(origin: Point(x: 0, y: 0), height: 10, width: 10)
//rect1.height = 10  // cannot change let property
rect1.area //computed property

let rect2 = Rect(origin: Point(x: 5, y: 5), height: 20, width: 20)
//rect2.origin = point //cannot change property if struct object is defined as let constant
rect1.origin.x
rect2.origin.y
rect2.origin.y
