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
            VStack(alignment: .leading, spacing: AlineaSpacing.xl) {
                ScreenHeader(
                    eyebrow: "Step 2 of 7",
                    title: "Allie clarifies your angle",
                    subtitle: "A belief can become a few different playlists. Pick the version that feels closest.",
                    onBack: onBack
                )

                AllieMessageCard(
                    title: "I found three paths",
                    message: "For now, I will default to a balanced mix so the playlist feels diversified across the healthcare AI stack."
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
            BottomCTA(title: "Build thesis", action: onContinue)
        }
    }
}
