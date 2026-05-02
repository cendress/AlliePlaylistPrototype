//
//  StockRecommendationCard.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct StockRecommendationCard: View {
    @State private var sparkleTrigger = 0

    let stock: StockRecommendation
    var isSelected = true
    let onTap: () -> Void

    var body: some View {
        Button {
            if !isSelected {
                sparkleTrigger += 1
            }
            onTap()
        } label: {
            HStack(alignment: .top, spacing: AlineaSpacing.md) {
                TickerBadge(ticker: stock.ticker, color: stock.accentColor)

                VStack(alignment: .leading, spacing: AlineaSpacing.xs) {
                    VStack(alignment: .leading, spacing: 2) {
                        HStack(alignment: .firstTextBaseline, spacing: AlineaSpacing.xs) {
                            Text(stock.companyName)
                                .font(AlineaFonts.headline)
                                .foregroundStyle(AlineaColors.textPrimary)
                                .lineLimit(1)

                            Text(stock.ticker)
                                .font(AlineaFonts.footnote)
                                .foregroundStyle(AlineaColors.textTertiary)
                        }

                        Text(stock.category)
                            .font(AlineaFonts.footnote)
                            .foregroundStyle(stock.accentColor)
                            .padding(.horizontal, AlineaSpacing.sm)
                            .padding(.vertical, 6)
                            .background {
                                Capsule()
                                    .fill(stock.accentColor.opacity(0.14))
                            }
                            .fixedSize(horizontal: true, vertical: false)
                    }

                    Text(stock.rationale)
                        .font(AlineaFonts.callout)
                        .foregroundStyle(AlineaColors.textSecondary)
                        .lineLimit(2)
                        .lineSpacing(2)
                }

                Spacer()

                Image(systemName: isSelected ? "checkmark.circle.fill" : "plus.circle")
                    .font(.system(size: 21, weight: .semibold))
                    .foregroundStyle(isSelected ? AlineaColors.primaryPurple : AlineaColors.textTertiary)
                    .symbolEffect(.bounce, value: sparkleTrigger)
                    .overlay {
                        SparkleBurst(trigger: sparkleTrigger, tint: stock.accentColor)
                    }
            }
            .padding(AlineaSpacing.md)
            .background {
                RoundedRectangle(cornerRadius: AlineaSpacing.cardRadius, style: .continuous)
                    .fill(isSelected ? AlineaGradients.cardSurface : LinearGradient(colors: [AlineaColors.card], startPoint: .top, endPoint: .bottom))
            }
            .overlay {
                RoundedRectangle(cornerRadius: AlineaSpacing.cardRadius, style: .continuous)
                    .stroke(isSelected ? AlineaColors.primaryPurple.opacity(0.58) : AlineaColors.border, lineWidth: 1)
            }
            .shadow(color: AlineaColors.primaryPurple.opacity(isSelected ? 0.14 : 0), radius: 18, x: 0, y: 8)
            .animation(.spring(response: 0.28, dampingFraction: 0.86), value: isSelected)
        }
        .buttonStyle(.delightfulPress)
        .polishedEntrance()
    }
}
