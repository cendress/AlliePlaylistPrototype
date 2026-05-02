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
            VStack(alignment: .leading, spacing: AlineaSpacing.xl) {
                ScreenHeader(
                    eyebrow: "Step 1 of 7",
                    title: "What do you believe?",
                    subtitle: "Start with a simple market belief. Allie will turn it into a focused investing playlist.",
                    onBack: onBack
                )

                VStack(spacing: AlineaSpacing.lg) {
                    AllieAvatar(size: 118)

                    Text(PlaylistMockData.userBelief)
                        .font(AlineaFonts.title1)
                        .foregroundStyle(AlineaColors.textPrimary)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                }
                .padding(.vertical, AlineaSpacing.xxl)
                .padding(.horizontal, AlineaSpacing.lg)
                .background {
                    RoundedRectangle(cornerRadius: 28, style: .continuous)
                        .fill(AlineaColors.card)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 28, style: .continuous)
                        .stroke(AlineaColors.border, lineWidth: 1)
                }

                VStack(alignment: .leading, spacing: AlineaSpacing.md) {
                    Text("Suggested beliefs")
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
        .background(AlineaColors.background.ignoresSafeArea())
        .safeAreaInset(edge: .bottom) {
            BottomCTA(title: "Continue", action: onContinue)
        }
    }
}
