//
//  Item.swift
//  HelenaStore
//
//  Created by Mindy Douglas on 11/30/22.
//

import Foundation

struct Item: Hashable {
    let id = UUID()
    let title: String
    let subtitle: String
    let image: String
    
    init(title: String = "", subtitle: String = "", image: String = "") {
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }
}
