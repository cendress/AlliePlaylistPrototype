//
//  StockRecommendationCard.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct StockRecommendationCard: View {
    let stock: StockRecommendation
    var isSelected = true
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(alignment: .top, spacing: AlineaSpacing.md) {
                TickerBadge(ticker: stock.ticker, color: stock.accentColor)

                VStack(alignment: .leading, spacing: AlineaSpacing.xs) {
                    HStack(spacing: AlineaSpacing.xs) {
                        Text(stock.companyName)
                            .font(AlineaFonts.headline)
                            .foregroundStyle(AlineaColors.textPrimary)

                        Spacer()

                        Text(stock.category)
                            .font(AlineaFonts.footnote)
                            .foregroundStyle(stock.accentColor)
                            .padding(.horizontal, AlineaSpacing.sm)
                            .padding(.vertical, 6)
                            .background {
                                Capsule()
                                    .fill(stock.accentColor.opacity(0.14))
                            }
                    }

                    Text(stock.rationale)
                        .font(AlineaFonts.callout)
                        .foregroundStyle(AlineaColors.textSecondary)
                        .lineSpacing(3)
                }

                Image(systemName: isSelected ? "checkmark.circle.fill" : "plus.circle")
                    .font(.system(size: 21, weight: .semibold))
                    .foregroundStyle(isSelected ? AlineaColors.primaryPurple : AlineaColors.textTertiary)
            }
            .padding(AlineaSpacing.lg)
            .background {
                RoundedRectangle(cornerRadius: AlineaSpacing.cardRadius, style: .continuous)
                    .fill(isSelected ? AlineaColors.elevatedCard : AlineaColors.card)
            }
            .overlay {
                RoundedRectangle(cornerRadius: AlineaSpacing.cardRadius, style: .continuous)
                    .stroke(isSelected ? AlineaColors.primaryPurple.opacity(0.58) : AlineaColors.border, lineWidth: 1)
            }
        }
        .buttonStyle(.plain)
    }
}
