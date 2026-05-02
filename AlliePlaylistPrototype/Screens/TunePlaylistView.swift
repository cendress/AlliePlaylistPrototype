//
//  TunePlaylistView.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct TunePlaylistView: View {
    @ObservedObject var viewModel: PrototypeViewModel
    let onContinue: () -> Void
    var onBack: (() -> Void)?

    private let chipColumns = [
        GridItem(.adaptive(minimum: 132), spacing: AlineaSpacing.sm, alignment: .leading)
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: AlineaSpacing.lg) {
                ScreenHeader(
                    eyebrow: "Step 5 of 7",
                    title: "Tune the playlist",
                    subtitle: PlaylistMockData.playlistName,
                    onBack: onBack
                )

                AllieMessageCard(
                    title: "Allie",
                    message: "Want this to feel safer, bolder, or more focused? I can adjust the mix around your comfort level."
                )

                LazyVGrid(columns: chipColumns, alignment: .leading, spacing: AlineaSpacing.sm) {
                    ForEach(PlaylistMockData.refinementChips, id: \.self) { chip in
                        ChoiceChip(chip, isSelected: viewModel.selectedRefinement == chip) {
                            viewModel.selectedRefinement = chip
                        }
                    }
                }

                VStack(alignment: .leading, spacing: AlineaSpacing.md) {
                    Text("Before and after")
                        .font(AlineaFonts.caption)
                        .foregroundStyle(AlineaColors.textTertiary)
                        .textCase(.uppercase)

                    VStack(spacing: AlineaSpacing.sm) {
                        ForEach(PlaylistMockData.metricComparisons) { metric in
                            MetricComparisonCard(metric: metric)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: AlineaSpacing.md) {
                    HStack {
                        Text("Simplified allocation")
                            .font(AlineaFonts.caption)
                            .foregroundStyle(AlineaColors.textTertiary)
                            .textCase(.uppercase)

                        Spacer()

                        Text("Mock")
                            .font(AlineaFonts.footnote)
                            .foregroundStyle(AlineaColors.textTertiary)
                    }

                    VStack(spacing: AlineaSpacing.sm) {
                        ForEach(PlaylistMockData.allocationItems) { item in
                            AllocationRow(item: item)
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

                AllieMessageCard(
                    title: "Allie adjusted the mix",
                    message: "I reduced exposure to earlier-stage names and leaned more toward profitable infrastructure and healthcare leaders. It's slightly less pure, but more stable."
                )

            }
            .padding(.horizontal, AlineaSpacing.screenHorizontal)
            .padding(.top, AlineaSpacing.lg)
            .padding(.bottom, 108)
        }
        .scrollIndicators(.hidden)
        .background(AlineaGradients.appBackground.ignoresSafeArea())
        .safeAreaInset(edge: .bottom) {
            BottomCTA(title: "Finalize Playlist", action: onContinue)
        }
    }
}

private struct AllocationRow: View {
    let item: AllocationItem

    private var progress: CGFloat {
        min(CGFloat(item.weight / 24), 1)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            HStack(spacing: AlineaSpacing.sm) {
                Text(item.companyName)
                    .font(AlineaFonts.footnote)
                    .foregroundStyle(AlineaColors.textPrimary)
                    .lineLimit(1)

                Text(item.ticker)
                    .font(AlineaFonts.footnote)
                    .foregroundStyle(AlineaColors.textTertiary)

                Spacer(minLength: 0)

                Text("\(Int(item.weight))%")
                    .font(AlineaFonts.footnote)
                    .foregroundStyle(AlineaColors.textSecondary)
            }

            GeometryReader { proxy in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(AlineaColors.elevatedCard)

                    Capsule()
                        .fill(LinearGradient(
                            colors: [item.tint, AlineaColors.primaryPurple],
                            startPoint: .leading,
                            endPoint: .trailing
                        ))
                        .frame(width: max(proxy.size.width * progress, 22))
                }
            }
            .frame(height: 7)
        }
    }
}
