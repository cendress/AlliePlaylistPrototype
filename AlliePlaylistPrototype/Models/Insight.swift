//
//  Insight.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct Insight: Identifiable {
    var id: String { title }

    let title: String
    let value: String
    let message: String
    let symbolName: String
    let tint: Color
}
