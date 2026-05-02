//
//  StockRecommendation.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct StockRecommendation: Identifiable {
    var id: String { ticker }

    let companyName: String
    let ticker: String
    let category: String
    let rationale: String
    let accentColor: Color
}
