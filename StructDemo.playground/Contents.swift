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
    var x
    var y
}

struct Rect {
    var origin: Point
    var height: Int
    var width: Int
    
    init(origin: Point, height: Int, width: Int) {
        self.origin = origin
        self.height = height
        self.width = width
    }
    
    init(center: Point, height: Int, width: Int) {
        
    }
}
