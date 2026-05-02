//
//  CustomizePlaylistView.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct CustomizePlaylistView: View {
    @ObservedObject var viewModel: PrototypeViewModel
    let onContinue: () -> Void
    var onBack: (() -> Void)?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: AlineaSpacing.xl) {
                ScreenHeader(
                    eyebrow: "Step 6 of 7",
                    title: "Customize playlist",
                    subtitle: "Pick a color mood before the playlist goes live.",
                    onBack: onBack
                )

                VStack(alignment: .leading, spacing: AlineaSpacing.md) {
                    Text("Playlist color")
                        .font(AlineaFonts.caption)
                        .foregroundStyle(AlineaColors.textTertiary)
                        .textCase(.uppercase)

                    HStack(spacing: AlineaSpacing.md) {
                        ForEach(PlaylistMockData.playlistColors) { option in
                            Button {
                                viewModel.selectedPlaylistColor = option
                            } label: {
                                Circle()
                                    .fill(AlineaGradients.playlistColor(option.color))
                                    .frame(width: 46, height: 46)
                                    .overlay {
                                        Circle()
                                            .stroke(
                                                viewModel.selectedPlaylistColor == option ? Color.white : AlineaColors.border,
                                                lineWidth: viewModel.selectedPlaylistColor == option ? 2 : 1
                                            )
                                    }
                                    .shadow(color: option.color.opacity(0.28), radius: 12, x: 0, y: 7)
                            }
                            .buttonStyle(.plain)
                            .accessibilityLabel(option.name)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: AlineaSpacing.lg) {
                    HStack(spacing: AlineaSpacing.md) {
                        AllieAvatar(size: 64)
                            .frame(width: 78, height: 78)

                        VStack(alignment: .leading, spacing: AlineaSpacing.xs) {
                            Text(PlaylistMockData.playlistName)
                                .font(AlineaFonts.title1)
                                .foregroundStyle(AlineaColors.textPrimary)

                            Text("\(viewModel.selectedStockTickers.count) mock stocks, \(viewModel.selectedRefinement)")
                                .font(AlineaFonts.callout)
                                .foregroundStyle(AlineaColors.textSecondary)
                        }
                    }

                    MockLineChart(tint: viewModel.selectedPlaylistColor.color)
                }
                .padding(AlineaSpacing.lg)
                .background {
                    RoundedRectangle(cornerRadius: 28, style: .continuous)
                        .fill(AlineaColors.card)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 28, style: .continuous)
                        .stroke(AlineaColors.border, lineWidth: 1)
                }
            }
            .padding(.horizontal, AlineaSpacing.screenHorizontal)
            .padding(.top, AlineaSpacing.lg)
            .padding(.bottom, 108)
        }
        .scrollIndicators(.hidden)
        .background(AlineaColors.background.ignoresSafeArea())
        .safeAreaInset(edge: .bottom) {
            BottomCTA(title: "Launch playlist", action: onContinue)
        }
    }
}
