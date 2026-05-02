//
//  InvestmentThesisView.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct InvestmentThesisView: View {
    @ObservedObject var viewModel: PrototypeViewModel
    let onContinue: () -> Void
    var onBack: (() -> Void)?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: AlineaSpacing.xl) {
                ScreenHeader(
                    eyebrow: "Step 3 of 7",
                    title: "Investment thesis",
                    subtitle: "Allie turns the theme into a concise thesis with momentum, risk, and coherence signals.",
                    onBack: onBack
                )

                AllieMessageCard(
                    title: PlaylistMockData.playlistName,
                    message: "\(viewModel.selectedAngle.title) connects infrastructure, diagnostics, drug discovery, and care delivery."
                )

                VStack(spacing: AlineaSpacing.md) {
                    ForEach(PlaylistMockData.insights) { insight in
                        InsightCard(insight: insight)
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
            BottomCTA(title: "See suggested stocks", action: onContinue)
        }
    }
}
