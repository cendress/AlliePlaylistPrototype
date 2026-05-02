//
//  BeliefPromptView.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct BeliefPromptView: View {
    @ObservedObject var viewModel: PrototypeViewModel
    let onContinue: () -> Void
    var onBack: (() -> Void)?

    private let chipColumns = [
        GridItem(.adaptive(minimum: 142), spacing: AlineaSpacing.sm, alignment: .leading)
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: AlineaSpacing.lg) {
                ScreenHeader(
                    eyebrow: "Step 1 of 7",
                    title: "Build a playlist",
                    subtitle: "Start with what you believe in.",
                    onBack: onBack
                )

                Text("What do you believe is changing?")
                    .font(AlineaFonts.headline)
                    .foregroundStyle(AlineaColors.textPrimary)
                    .lineLimit(3)
                    .minimumScaleFactor(0.86)

                AllieMessageCard(
                    title: "Allie",
                    message: "Tell me what you're noticing in the world - a trend, feeling, cultural moment, or conviction. I'll help turn it into an investable playlist."
                )

                beliefInputField

                VStack(alignment: .leading, spacing: AlineaSpacing.md) {
                    Text("Try a belief")
                        .font(AlineaFonts.caption)
                        .foregroundStyle(AlineaColors.textTertiary)
                        .textCase(.uppercase)

                    LazyVGrid(columns: chipColumns, alignment: .leading, spacing: AlineaSpacing.sm) {
                        ForEach(PlaylistMockData.beliefChips, id: \.self) { chip in
                            ChoiceChip(chip, isSelected: viewModel.selectedBelief == chip) {
                                viewModel.selectedBelief = chip
                            }
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
            BottomCTA(title: "Build with Allie", systemImage: "sparkles", action: onContinue)
        }
    }

    private var beliefInputField: some View {
        HStack(spacing: AlineaSpacing.sm) {
            Image(systemName: "quote.bubble.fill")
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(AlineaColors.primaryPurple)

            Text(PlaylistMockData.beliefInputValue)
                .font(AlineaFonts.bodyMedium)
                .foregroundStyle(AlineaColors.textPrimary)
                .lineLimit(1)

            Spacer()
        }
        .padding(.horizontal, AlineaSpacing.lg)
        .frame(height: 58)
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(AlineaColors.elevatedCard)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(AlineaColors.primaryPurple.opacity(0.32), lineWidth: 1)
        }
        .shadow(color: AlineaColors.primaryPurple.opacity(0.16), radius: 18, x: 0, y: 8)
        .polishedEntrance()
    }
}
