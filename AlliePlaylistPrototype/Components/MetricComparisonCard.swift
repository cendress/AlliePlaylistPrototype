//
//  MetricComparisonCard.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct MetricComparisonCard: View {
    let metric: MetricComparison

    var body: some View {
        HStack(spacing: AlineaSpacing.md) {
            VStack(alignment: .leading, spacing: AlineaSpacing.xs) {
                Text(metric.title)
                    .font(AlineaFonts.caption)
                    .foregroundStyle(AlineaColors.textTertiary)
                    .textCase(.uppercase)

                HStack(spacing: AlineaSpacing.sm) {
                    Text(metric.before)
                        .font(AlineaFonts.title2)
                        .foregroundStyle(AlineaColors.textSecondary)

                    Image(systemName: "arrow.right")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundStyle(AlineaColors.textTertiary)

                    Text(metric.after)
                        .font(AlineaFonts.title2)
                        .foregroundStyle(metric.tint)
                }
            }

            Spacer()
        }
        .padding(AlineaSpacing.lg)
        .background {
            RoundedRectangle(cornerRadius: AlineaSpacing.cardRadius, style: .continuous)
                .fill(AlineaColors.card)
        }
        .overlay {
            RoundedRectangle(cornerRadius: AlineaSpacing.cardRadius, style: .continuous)
                .stroke(AlineaColors.border, lineWidth: 1)
        }
    }
}
