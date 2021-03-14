//
//  Item.swift
//  GridCollectionView
//
//  Created by Shakhzod Ilkhomov on 15/03/21.
//

import Foundation

class Item {
    var image: String? = ""
    var title: String? = ""
    
    init(image: String, title: String) {
        self.image = image
        self.title = title
    }
}
