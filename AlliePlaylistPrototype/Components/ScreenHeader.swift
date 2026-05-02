//
//  ScreenHeader.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct ScreenHeader: View {
    let eyebrow: String
    let title: String
    var subtitle: String?
    var onBack: (() -> Void)?

    var body: some View {
        VStack(alignment: .leading, spacing: AlineaSpacing.md) {
            HStack {
                if let onBack {
                    Button(action: onBack) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundStyle(AlineaColors.textPrimary)
                            .frame(width: 38, height: 38)
                            .background {
                                Circle()
                                    .fill(AlineaColors.elevatedCard)
                            }
                    }
                    .buttonStyle(.plain)
                }

                Spacer()

                Text(eyebrow)
                    .font(AlineaFonts.caption)
                    .foregroundStyle(AlineaColors.textTertiary)
                    .textCase(.uppercase)
            }

            Text(title)
                .font(AlineaFonts.hugeTitle)
                .foregroundStyle(AlineaColors.textPrimary)
                .multilineTextAlignment(.leading)
                .lineLimit(3)

            if let subtitle {
                Text(subtitle)
                    .font(AlineaFonts.body)
                    .foregroundStyle(AlineaColors.textSecondary)
                    .lineSpacing(4)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
