//
//  SuggestedStocksView.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct SuggestedStocksView: View {
    @ObservedObject var viewModel: PrototypeViewModel
    let onContinue: () -> Void
    var onBack: (() -> Void)?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: AlineaSpacing.xl) {
                ScreenHeader(
                    eyebrow: "Step 4 of 7",
                    title: "Suggested stocks",
                    subtitle: "Mock recommendations only. These cards are placeholders for the prototype flow.",
                    onBack: onBack
                )

                VStack(spacing: AlineaSpacing.md) {
                    ForEach(PlaylistMockData.stockRecommendations) { stock in
                        StockRecommendationCard(
                            stock: stock,
                            isSelected: viewModel.selectedStockTickers.contains(stock.ticker)
                        ) {
                            viewModel.toggleStock(stock)
                        }
                    }
                }
            }
            .padding(.horizontal, AlineaSpacing.screenHorizontal)
            .padding(.top, AlineaSpacing.lg)
            .padding(.bottom, 108)
        }
        .scrollIndicators(.hidden)
        .background(AlineaColors.background.ignoresSafeArea())
        .safeAreaInset(edge: .bottom) {
            BottomCTA(title: "Tune playlist", action: onContinue)
        }
    }
}
