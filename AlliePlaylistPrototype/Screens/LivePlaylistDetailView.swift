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
            VStack(alignment: .leading, spacing: AlineaSpacing.lg) {
                ScreenHeader(
                    eyebrow: "Step 7 of 7",
                    title: PlaylistMockData.playlistName,
                    subtitle: nil,
                    onBack: onBack
                )

                performanceCard

                HStack(spacing: AlineaSpacing.sm) {
                    PerformanceStat(title: "Today", value: "+1.8%", tint: AlineaColors.positiveGreen)
                    PerformanceStat(title: "Since created", value: "+4.2%", tint: AlineaColors.positiveGreen)
                    PerformanceStat(title: "Risk", value: "Medium", tint: AlineaColors.warningYellow)
                }

                DetailInfoCard(
                    title: "Thesis Health: Strong",
                    symbolName: "checkmark.seal.fill",
                    tint: AlineaColors.positiveGreen,
                    message: "Still aligned with the original AI healthcare thesis.",
                    isPulsing: true
                )

                VStack(alignment: .leading, spacing: AlineaSpacing.md) {
                    HStack {
                        Image(systemName: "eye.fill")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundStyle(AlineaColors.primaryPurple)

                        Text("Allie is watching")
                            .font(AlineaFonts.headline)
                            .foregroundStyle(AlineaColors.textPrimary)

                        Spacer()
                    }

                    ForEach(PlaylistMockData.monitoringItems, id: \.self) { item in
                        HStack(spacing: AlineaSpacing.sm) {
                            Circle()
                                .fill(AlineaColors.primaryPurple)
                                .frame(width: 6, height: 6)

                            Text(item)
                                .font(AlineaFonts.callout)
                                .foregroundStyle(AlineaColors.textSecondary)
                                .lineLimit(2)

                            Spacer(minLength: 0)
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
                    title: "Allie check-in",
                    message: "Your playlist is still aligned with the original thesis. One thing to watch: regulation around AI diagnostics is heating up."
                )
            }
            .padding(.horizontal, AlineaSpacing.screenHorizontal)
            .padding(.top, AlineaSpacing.lg)
            .padding(.bottom, 142)
        }
        .scrollIndicators(.hidden)
        .background(AlineaGradients.appBackground.ignoresSafeArea())
        .safeAreaInset(edge: .bottom) {
            liveActions
        }
    }

    private var performanceCard: some View {
        VStack(alignment: .leading, spacing: AlineaSpacing.lg) {
            HStack(alignment: .center, spacing: AlineaSpacing.md) {
                ZStack {
                    Circle()
                        .fill(AlineaGradients.playlistColor(viewModel.selectedPlaylistColor.color))
                        .frame(width: 66, height: 66)

                    Image(systemName: "waveform.path.ecg")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(AlineaColors.textPrimary)
                }

                VStack(alignment: .leading, spacing: AlineaSpacing.xs) {
                    Text("Live Playlist")
                        .font(AlineaFonts.footnote)
                        .foregroundStyle(AlineaColors.textPrimary)
                        .padding(.horizontal, AlineaSpacing.sm)
                        .padding(.vertical, 6)
                        .background {
                            Capsule()
                                .fill(AlineaColors.positiveGreen.opacity(0.18))
                        }

                    Text("\(viewModel.selectedStockTickers.count) holdings")
                        .font(AlineaFonts.title2)
                        .foregroundStyle(AlineaColors.textPrimary)
                }

                Spacer(minLength: 0)
            }

            MockLineChart(tint: viewModel.selectedPlaylistColor.color)
        }
        .padding(AlineaSpacing.lg)
        .background {
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(AlineaGradients.cardSurface)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .stroke(AlineaColors.border, lineWidth: 1)
        }
        .polishedEntrance()
    }

    private var liveActions: some View {
        VStack(spacing: AlineaSpacing.sm) {
            PrimaryButton(title: "Invest", systemImage: "arrow.up.right", action: onContinue)

            HStack(spacing: AlineaSpacing.sm) {
                SecondaryActionButton(title: "Ask Allie", systemImage: "sparkles") {}
                SecondaryActionButton(title: "Rebalance", systemImage: "slider.horizontal.3") {}
            }
        }
        .padding(.horizontal, AlineaSpacing.screenHorizontal)
        .padding(.top, AlineaSpacing.md)
        .padding(.bottom, AlineaSpacing.lg)
        .background {
            LinearGradient(
                colors: [
                    AlineaColors.background.opacity(0),
                    AlineaColors.background.opacity(0.92),
                    AlineaColors.background
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        }
    }
}

private struct PerformanceStat: View {
    let title: String
    let value: String
    let tint: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(AlineaFonts.footnote)
                .foregroundStyle(AlineaColors.textTertiary)
                .lineLimit(1)
                .minimumScaleFactor(0.78)

            Text(value)
                .font(AlineaFonts.headline)
                .foregroundStyle(tint)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(AlineaSpacing.md)
        .background {
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(AlineaGradients.cardSurface)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(AlineaColors.border, lineWidth: 1)
        }
        .polishedEntrance()
    }
}

private struct DetailInfoCard: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var pulse = false

    let title: String
    let symbolName: String
    let tint: Color
    let message: String
    var isPulsing = false

    var body: some View {
        HStack(alignment: .top, spacing: AlineaSpacing.md) {
            Image(systemName: symbolName)
                .font(.system(size: 17, weight: .bold))
                .foregroundStyle(tint)
                .frame(width: 34, height: 34)
                .background {
                    Circle()
                        .fill(tint.opacity(0.14))
                }

            VStack(alignment: .leading, spacing: AlineaSpacing.xs) {
                Text(title)
                    .font(AlineaFonts.headline)
                    .foregroundStyle(AlineaColors.textPrimary)

                Text(message)
                    .font(AlineaFonts.callout)
                    .foregroundStyle(AlineaColors.textSecondary)
                    .lineSpacing(3)
            }

            Spacer(minLength: 0)
        }
        .padding(AlineaSpacing.lg)
        .background {
            RoundedRectangle(cornerRadius: AlineaSpacing.cardRadius, style: .continuous)
                .fill(AlineaGradients.cardSurface)
        }
        .overlay {
            RoundedRectangle(cornerRadius: AlineaSpacing.cardRadius, style: .continuous)
                .stroke(isPulsing ? tint.opacity(pulse ? 0.48 : 0.2) : AlineaColors.border, lineWidth: 1)
        }
        .shadow(color: tint.opacity(isPulsing ? (pulse ? 0.28 : 0.12) : 0), radius: 20, x: 0, y: 8)
        .animation(.easeInOut(duration: 2.2).repeatForever(autoreverses: true), value: pulse)
        .onAppear {
            guard isPulsing, !reduceMotion else { return }
            pulse = true
        }
        .polishedEntrance()
    }
}

private struct SecondaryActionButton: View {
    let title: String
    let systemImage: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Label(title, systemImage: systemImage)
                .font(AlineaFonts.callout)
                .foregroundStyle(AlineaColors.textPrimary)
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .background {
                    Capsule()
                        .fill(AlineaColors.elevatedCard)
                }
                .overlay {
                    Capsule()
                        .stroke(AlineaColors.border, lineWidth: 1)
                }
        }
        .buttonStyle(.plain)
    }
}
