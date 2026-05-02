//
//  AllieMessageCard.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct AllieMessageCard: View {
    let title: String
    let message: String

    var body: some View {
        HStack(alignment: .top, spacing: AlineaSpacing.md) {
            AllieAvatar(size: 46)
                .frame(width: 58, height: 58)

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
                .stroke(AlineaColors.border, lineWidth: 1)
        }
        .shadow(color: AlineaColors.primaryPurple.opacity(0.08), radius: 18, x: 0, y: 8)
        .polishedEntrance()
    }
}
