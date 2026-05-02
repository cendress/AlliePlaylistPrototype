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
            VStack(alignment: .leading, spacing: AlineaSpacing.lg) {
                ScreenHeader(
                    eyebrow: "Step 3 of 7",
                    title: "Allie's thesis",
                    subtitle: "More than stock picking: a clear reason this playlist exists.",
                    onBack: onBack
                )

                playlistDraftCard

                AllieMessageCard(
                    title: "Allie",
                    message: "Here's the thesis I'm seeing: AI could move healthcare from reactive and expensive to predictive, personalized, and faster."
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
            BottomCTA(title: "See Playlist", action: onContinue)
        }
    }

    private var playlistDraftCard: some View {
        HStack(spacing: AlineaSpacing.md) {
            AllieAvatar(size: 58)
                .frame(width: 72, height: 72)

            VStack(alignment: .leading, spacing: AlineaSpacing.xs) {
                Text("Playlist draft")
                    .font(AlineaFonts.caption)
                    .foregroundStyle(AlineaColors.textTertiary)
                    .textCase(.uppercase)

                Text(PlaylistMockData.playlistName)
                    .font(AlineaFonts.title1)
                    .foregroundStyle(AlineaColors.textPrimary)
            }

            Spacer(minLength: 0)
        }
        .padding(AlineaSpacing.lg)
        .background {
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .fill(AlineaColors.card)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .stroke(AlineaColors.border, lineWidth: 1)
        }
    }
}
