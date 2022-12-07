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
        case description
        case button
        case detailHeader
        case color
        case size
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
        static let description = SectionType(rawValue: Section.ItemSectionType.description.rawValue)
        static let detailHeader = SectionType(rawValue: Section.ItemSectionType.detailHeader.rawValue)
        static let button = SectionType(rawValue: Section.ItemSectionType.button
            .rawValue)
        static let color = SectionType(rawValue: Section.ItemSectionType.color.rawValue)
        static let size = SectionType(rawValue: Section.ItemSectionType.size.rawValue)
    }
}
