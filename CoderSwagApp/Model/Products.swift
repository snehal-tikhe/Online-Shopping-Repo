//
//  Products.swift
//  CoderSwagApp
//
//  Created by Snehal Tikhe on 2/5/19.
//  Copyright © 2019 Snehal Tikhe. All rights reserved.
//

import Foundation
struct Product{
    
    public var title: String
    public var price: String
    public var imageName: String
    
    init(title: String, price: String, imageName: String){
        self.title = title
        self.price = price
        self.imageName = imageName
    }
    
}
