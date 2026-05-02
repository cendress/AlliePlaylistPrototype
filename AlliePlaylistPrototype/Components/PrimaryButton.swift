//
//  PrimaryButton.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    var systemImage: String?
    var isDisabled = false
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: AlineaSpacing.xs) {
                Text(title)

                if let systemImage {
                    Image(systemName: systemImage)
                        .font(.system(size: 16, weight: .bold))
                }
            }
            .font(AlineaFonts.headline)
            .foregroundStyle(AlineaColors.textPrimary)
            .frame(maxWidth: .infinity)
            .frame(height: AlineaSpacing.buttonHeight)
            .background {
                Capsule()
                    .fill(AlineaGradients.primaryCTA)
            }
            .overlay {
                Capsule()
                    .stroke(Color.white.opacity(0.16), lineWidth: 1)
            }
            .shadow(color: AlineaColors.primaryPurple.opacity(isDisabled ? 0 : 0.34), radius: 18, x: 0, y: 10)
            .opacity(isDisabled ? 0.48 : 1)
        }
        .buttonStyle(.plain)
        .disabled(isDisabled)
        .accessibilityLabel(title)
    }
}
