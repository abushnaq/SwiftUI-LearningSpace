//
//  Item.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 8/22/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
