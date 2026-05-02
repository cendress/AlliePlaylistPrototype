//
//  InsightCard.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct InsightCard: View {
    let insight: Insight

    var body: some View {
        VStack(alignment: .leading, spacing: AlineaSpacing.md) {
            HStack(spacing: AlineaSpacing.sm) {
                Image(systemName: insight.symbolName)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(AlineaColors.background)
                    .frame(width: 34, height: 34)
                    .background {
                        Circle()
                            .fill(insight.tint)
                    }

                VStack(alignment: .leading, spacing: 2) {
                    Text(insight.title)
                        .font(AlineaFonts.caption)
                        .foregroundStyle(AlineaColors.textTertiary)
                        .textCase(.uppercase)

                    Text(insight.value)
                        .font(AlineaFonts.headline)
                        .foregroundStyle(AlineaColors.textPrimary)
                }
            }

            Text(insight.message)
                .font(AlineaFonts.callout)
                .foregroundStyle(AlineaColors.textSecondary)
                .lineSpacing(3)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
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
    }
}
