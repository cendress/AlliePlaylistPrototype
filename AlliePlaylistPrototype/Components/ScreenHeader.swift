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
                        Image(systemName: "arrow.left")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundStyle(AlineaColors.textPrimary)
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
