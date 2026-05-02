//
//  MetricComparison.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct MetricComparison: Identifiable {
    var id: String { title }

    let title: String
    let before: String
    let after: String
    let tint: Color
}
