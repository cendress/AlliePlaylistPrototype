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
            VStack(alignment: .leading, spacing: AlineaSpacing.lg) {
                ScreenHeader(
                    eyebrow: "Step 4 of 7",
                    title: "Allie's suggested playlist",
                    subtitle: "A curated starting point for your AI healthcare thesis.",
                    onBack: onBack
                )

                searchBar

                AllieMessageCard(
                    title: "Allie",
                    message: "I built a balanced mix for your AI healthcare thesis."
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
        .background(AlineaGradients.appBackground.ignoresSafeArea())
        .safeAreaInset(edge: .bottom) {
            BottomCTA(title: "Tune Playlist", action: onContinue)
        }
    }

    private var searchBar: some View {
        HStack(spacing: AlineaSpacing.sm) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(AlineaColors.textTertiary)

            Text("Search or ask Allie to add a company...")
                .font(AlineaFonts.callout)
                .foregroundStyle(AlineaColors.textTertiary)
                .lineLimit(1)

            Spacer(minLength: 0)
        }
        .padding(.horizontal, AlineaSpacing.lg)
        .frame(height: 48)
        .background {
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(AlineaGradients.cardSurface)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(AlineaColors.border, lineWidth: 1)
        }
        .polishedEntrance()
    }
}
