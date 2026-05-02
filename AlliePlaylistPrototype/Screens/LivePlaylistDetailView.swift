//
//  LivePlaylistDetailView.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct LivePlaylistDetailView: View {
    @ObservedObject var viewModel: PrototypeViewModel
    let onContinue: () -> Void
    var onBack: (() -> Void)?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: AlineaSpacing.xl) {
                ScreenHeader(
                    eyebrow: "Step 7 of 7",
                    title: PlaylistMockData.playlistName,
                    subtitle: "A polished placeholder for the live playlist detail screen.",
                    onBack: onBack
                )

                VStack(alignment: .leading, spacing: AlineaSpacing.lg) {
                    HStack(alignment: .center, spacing: AlineaSpacing.md) {
                        ZStack {
                            Circle()
                                .fill(AlineaGradients.playlistColor(viewModel.selectedPlaylistColor.color))
                                .frame(width: 68, height: 68)

                            Image(systemName: "waveform.path.ecg")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(AlineaColors.textPrimary)
                        }

                        VStack(alignment: .leading, spacing: AlineaSpacing.xs) {
                            Text("Live mock playlist")
                                .font(AlineaFonts.caption)
                                .foregroundStyle(AlineaColors.textTertiary)
                                .textCase(.uppercase)

                            Text("\(viewModel.selectedStockTickers.count) holdings")
                                .font(AlineaFonts.title2)
                                .foregroundStyle(AlineaColors.textPrimary)
                        }

                        Spacer()
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

                VStack(alignment: .leading, spacing: AlineaSpacing.md) {
                    Text("Allie is monitoring")
                        .font(AlineaFonts.caption)
                        .foregroundStyle(AlineaColors.textTertiary)
                        .textCase(.uppercase)

                    ForEach(PlaylistMockData.monitoringItems, id: \.self) { item in
                        HStack(spacing: AlineaSpacing.sm) {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(AlineaColors.primaryPurple)

                            Text(item)
                                .font(AlineaFonts.callout)
                                .foregroundStyle(AlineaColors.textSecondary)

                            Spacer(minLength: 0)
                        }
                        .padding(AlineaSpacing.md)
                        .background {
                            RoundedRectangle(cornerRadius: 18, style: .continuous)
                                .fill(AlineaColors.elevatedCard)
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
            BottomCTA(title: "Start over", systemImage: "arrow.counterclockwise", action: onContinue)
        }
    }
}
