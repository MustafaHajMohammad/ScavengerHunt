//
//  HuntItem.swift
//  ScavengerHunt
//
//  Created by Satoof Haj  on 2025-10-06.
//

import Foundation

// Represents each item in the scavenger hunt
struct HuntItem: Identifiable, Codable {
    var id = UUID()
    var name: String
    var clue: String
    var isFound: Bool = false
}

