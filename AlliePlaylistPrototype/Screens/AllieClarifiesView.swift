//
//  AllieClarifiesView.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct AllieClarifiesView: View {
    @ObservedObject var viewModel: PrototypeViewModel
    let onContinue: () -> Void
    var onBack: (() -> Void)?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: AlineaSpacing.lg) {
                ScreenHeader(
                    eyebrow: "Step 2 of 7",
                    title: "Shape your idea",
                    subtitle: "A thoughtful question before any stock suggestions.",
                    onBack: onBack
                )

                AllieMessageCard(
                    title: "Allie",
                    message: "Love this. AI in healthcare can mean a few different things. Which angle feels closest to your belief?"
                )

                VStack(spacing: AlineaSpacing.md) {
                    ForEach(PlaylistMockData.clarifyingAngles) { angle in
                        SelectableCard(
                            title: angle.title,
                            subtitle: angle.description,
                            systemImage: angle.title == "Balanced Mix" ? "scale.3d" : "sparkles",
                            isSelected: viewModel.selectedAngle == angle
                        ) {
                            viewModel.selectedAngle = angle
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
