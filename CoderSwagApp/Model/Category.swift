//
//  Category.swift
//  CoderSwagApp
//
//  Created by Snehal Tikhe on 2/4/19.
//  Copyright © 2019 Snehal Tikhe. All rights reserved.
//

import Foundation
struct Category {
    private(set) public var title: String
    private(set) public var imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}
