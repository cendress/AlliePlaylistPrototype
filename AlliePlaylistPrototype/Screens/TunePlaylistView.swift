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
            VStack(alignment: .leading, spacing: AlineaSpacing.xl) {
                ScreenHeader(
                    eyebrow: "Step 5 of 7",
                    title: "Tune your playlist",
                    subtitle: "Choose a quick refinement. The mock metrics show how Allie might explain the adjustment.",
                    onBack: onBack
                )

                LazyVGrid(columns: chipColumns, alignment: .leading, spacing: AlineaSpacing.sm) {
                    ForEach(PlaylistMockData.refinementChips, id: \.self) { chip in
                        ChoiceChip(chip, isSelected: viewModel.selectedRefinement == chip) {
                            viewModel.selectedRefinement = chip
                        }
                    }
                }

                VStack(spacing: AlineaSpacing.md) {
                    ForEach(PlaylistMockData.metricComparisons) { metric in
                        MetricComparisonCard(metric: metric)
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
            BottomCTA(title: "Customize look", action: onContinue)
        }
    }
}
