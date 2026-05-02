//
//  SelectableCard.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct SelectableCard: View {
    let title: String
    let subtitle: String
    var systemImage: String?
    var isSelected = false
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(alignment: .top, spacing: AlineaSpacing.md) {
                if let systemImage {
                    Image(systemName: systemImage)
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(isSelected ? AlineaColors.textPrimary : AlineaColors.primaryPurple)
                        .frame(width: 38, height: 38)
                        .background {
                            Circle()
                                .fill(isSelected ? AlineaColors.primaryPurple : AlineaColors.primaryPurple.opacity(0.14))
                        }
                }

                VStack(alignment: .leading, spacing: AlineaSpacing.xs) {
                    Text(title)
                        .font(AlineaFonts.headline)
                        .foregroundStyle(AlineaColors.textPrimary)

                    Text(subtitle)
                        .font(AlineaFonts.callout)
                        .foregroundStyle(AlineaColors.textSecondary)
                        .lineSpacing(3)
                }

                Spacer()

                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(isSelected ? AlineaColors.primaryPurple : AlineaColors.textTertiary)
            }
            .padding(AlineaSpacing.lg)
            .background {
                RoundedRectangle(cornerRadius: AlineaSpacing.cardRadius, style: .continuous)
                    .fill(isSelected ? AlineaGradients.cardSurface : LinearGradient(colors: [AlineaColors.card], startPoint: .top, endPoint: .bottom))
            }
            .overlay {
                RoundedRectangle(cornerRadius: AlineaSpacing.cardRadius, style: .continuous)
                    .stroke(isSelected ? AlineaColors.primaryPurple.opacity(0.72) : AlineaColors.border, lineWidth: 1)
            }
            .shadow(color: AlineaColors.primaryPurple.opacity(isSelected ? 0.28 : 0), radius: 22, x: 0, y: 10)
            .animation(.spring(response: 0.28, dampingFraction: 0.86), value: isSelected)
        }
        .buttonStyle(.plain)
        .polishedEntrance()
    }
}
