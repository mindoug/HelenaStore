//
//  Section.swift
//  HelenaStore
//
//  Created by Mindy Douglas on 11/30/22.
//

import Foundation

struct Section: Hashable {
    
    let id = UUID()
    let type: SectionType
    let title: String
    let subtitle: String
    let items: [Item]
    
    init(type: SectionType, title: String = "", subtitle: String = "", items: [Item] = []) {
        self.type = type
        self.title = title
        self.subtitle = subtitle
        self.items = items
    }
    
    enum ItemSectionType: String {
        case header
        case category
        case selection
        case image
        case detail
        case button
        case detailHeader
    }
    
    struct SectionType: RawRepresentable, Hashable {
        typealias RawValue = String
        var rawValue: String
        
        init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        static let header = SectionType(rawValue: Section.ItemSectionType.header.rawValue)
        static let category = SectionType(rawValue: Section.ItemSectionType.category.rawValue)
        static let selection = SectionType(rawValue: Section.ItemSectionType.selection.rawValue)
        static let image = SectionType(rawValue: Section.ItemSectionType.image.rawValue)
        static let detail = SectionType(rawValue: Section.ItemSectionType.detail.rawValue)
        static let button = SectionType(rawValue: Section.ItemSectionType.button
            .rawValue)
        static let detailHeader = SectionType(rawValue: Section.ItemSectionType.button.rawValue)
    }
}
