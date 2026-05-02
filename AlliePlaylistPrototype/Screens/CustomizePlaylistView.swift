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
            VStack(alignment: .leading, spacing: AlineaSpacing.lg) {
                ScreenHeader(
                    eyebrow: "Step 6 of 7",
                    title: "Make it yours",
                    subtitle: "The playlist has a thesis. Now give it a little personality.",
                    onBack: onBack
                )

                playlistIdentityCard

                VStack(alignment: .leading, spacing: AlineaSpacing.md) {
                    Text("Color")
                        .font(AlineaFonts.caption)
                        .foregroundStyle(AlineaColors.textTertiary)
                        .textCase(.uppercase)

                    HStack(spacing: AlineaSpacing.sm) {
                        ForEach(PlaylistMockData.playlistColors) { option in
                            Button {
                                viewModel.selectedPlaylistColor = option
                            } label: {
                                Circle()
                                    .fill(AlineaGradients.playlistColor(option.color))
                                    .frame(width: 40, height: 40)
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
                .padding(AlineaSpacing.lg)
                .background {
                    RoundedRectangle(cornerRadius: AlineaSpacing.cardRadius, style: .continuous)
                        .fill(AlineaGradients.cardSurface)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: AlineaSpacing.cardRadius, style: .continuous)
                        .stroke(AlineaColors.border, lineWidth: 1)
                }
                .polishedEntrance()

                VStack(alignment: .leading, spacing: AlineaSpacing.lg) {
                    Text("Description")
                        .font(AlineaFonts.caption)
                        .foregroundStyle(AlineaColors.textTertiary)
                        .textCase(.uppercase)

                    Text(PlaylistMockData.playlistDescription)
                        .font(AlineaFonts.body)
                        .foregroundStyle(AlineaColors.textPrimary)
                        .lineSpacing(4)
                }
                .padding(AlineaSpacing.lg)
                .background {
                    RoundedRectangle(cornerRadius: AlineaSpacing.cardRadius, style: .continuous)
                        .fill(AlineaGradients.cardSurface)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: AlineaSpacing.cardRadius, style: .continuous)
                        .stroke(AlineaColors.border, lineWidth: 1)
                }
                .polishedEntrance()

                AllieMessageCard(
                    title: "Allie",
                    message: "I gave it a name and description based on your thesis - feel free to make it yours."
                )
            }
            .padding(.horizontal, AlineaSpacing.screenHorizontal)
            .padding(.top, AlineaSpacing.lg)
            .padding(.bottom, 108)
        }
        .scrollIndicators(.hidden)
        .background(AlineaGradients.appBackground.ignoresSafeArea())
        .safeAreaInset(edge: .bottom) {
            BottomCTA(title: "Save Playlist", systemImage: "checkmark", action: onContinue)
        }
    }

    private var playlistIdentityCard: some View {
        VStack(spacing: AlineaSpacing.lg) {
            ZStack {
                Circle()
                    .fill(viewModel.selectedPlaylistColor.color.opacity(0.28))
                    .frame(width: 162, height: 162)
                    .blur(radius: 22)

                AllieAvatar(size: 104)
            }
            .frame(maxWidth: .infinity)

            VStack(spacing: AlineaSpacing.xs) {
                Text(PlaylistMockData.playlistName)
                    .font(AlineaFonts.largeTitle)
                    .foregroundStyle(AlineaColors.textPrimary)
                    .multilineTextAlignment(.center)

                Text("\(viewModel.selectedStockTickers.count) companies, \(viewModel.selectedRefinement)")
                    .font(AlineaFonts.callout)
                    .foregroundStyle(AlineaColors.textSecondary)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(AlineaSpacing.xl)
        .background {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(AlineaGradients.cardSurface)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .stroke(AlineaColors.border, lineWidth: 1)
        }
        .shadow(color: viewModel.selectedPlaylistColor.color.opacity(0.16), radius: 24, x: 0, y: 12)
        .polishedEntrance()
    }
}
