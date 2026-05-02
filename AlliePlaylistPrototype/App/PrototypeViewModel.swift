//
//  PrototypeViewModel.swift
//  AlliePlaylistPrototype
//

import Combine
import SwiftUI

final class PrototypeViewModel: ObservableObject {
    @Published var selectedBelief: String
    @Published var selectedAngle: PlaylistAngle
    @Published var selectedRefinement: String
    @Published var selectedStockTickers: Set<String>
    @Published var selectedPlaylistColor: PlaylistColorOption

    init() {
        selectedBelief = PlaylistMockData.defaultBeliefChip
        selectedAngle = PlaylistMockData.defaultAngle
        selectedRefinement = PlaylistMockData.defaultRefinement
        selectedStockTickers = Set(PlaylistMockData.stockRecommendations.map(\.ticker))
        selectedPlaylistColor = PlaylistMockData.playlistColors[0]
    }

    func toggleStock(_ stock: StockRecommendation) {
        if selectedStockTickers.contains(stock.ticker) {
            selectedStockTickers.remove(stock.ticker)
        } else {
            selectedStockTickers.insert(stock.ticker)
        }
    }
}
