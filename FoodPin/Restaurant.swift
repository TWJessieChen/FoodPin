//
//  Restaurant.swift
//  FoodPin
//
//  Created by PO-CHUN CHEN on 2016/3/30.
//  Copyright © 2016年 PO-CHUN CHEN. All rights reserved.
//

import Foundation

class Restaurant {
    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var isVisited = false
    
    init(name:String, type:String, location:String, image:String, isVisited:Bool){
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
        
    }
    
}