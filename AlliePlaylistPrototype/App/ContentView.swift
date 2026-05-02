//
//  ContentView.swift
//  AlliePlaylistPrototype
//
//  Created by Christopher Endress on 5/1/26.
//

import SwiftUI

struct ContentView: View {
    @State private var currentStep: PrototypeStep = .beliefPrompt
    @StateObject private var viewModel = PrototypeViewModel()

    var body: some View {
        ZStack {
            AlineaColors.background
                .ignoresSafeArea()

            currentScreen
                .id(currentStep)
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing).combined(with: .opacity),
                    removal: .move(edge: .leading).combined(with: .opacity)
                ))
        }
        .animation(.spring(response: 0.42, dampingFraction: 0.88), value: currentStep)
        .preferredColorScheme(.dark)
    }

    @ViewBuilder
    private var currentScreen: some View {
        switch currentStep {
        case .beliefPrompt:
            BeliefPromptView(
                viewModel: viewModel,
                onContinue: advance
            )
        case .allieClarifies:
            AllieClarifiesView(
                viewModel: viewModel,
                onContinue: advance,
                onBack: goBack
            )
        case .investmentThesis:
            InvestmentThesisView(
                viewModel: viewModel,
                onContinue: advance,
                onBack: goBack
            )
        case .suggestedStocks:
            SuggestedStocksView(
                viewModel: viewModel,
                onContinue: advance,
                onBack: goBack
            )
        case .tunePlaylist:
            TunePlaylistView(
                viewModel: viewModel,
                onContinue: advance,
                onBack: goBack
            )
        case .customizePlaylist:
            CustomizePlaylistView(
                viewModel: viewModel,
                onContinue: advance,
                onBack: goBack
            )
        case .livePlaylistDetail:
            LivePlaylistDetailView(
                viewModel: viewModel,
                onContinue: {},
                onBack: goBack
            )
        }
    }

    private func advance() {
        currentStep = currentStep.next ?? .livePlaylistDetail
    }

    private func goBack() {
        guard let previous = currentStep.previous else { return }
        currentStep = previous
    }

}
