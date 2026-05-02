//
//  PrimaryButton.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct PrimaryButton: View {
    @State private var sparkleTrigger = 0

    let title: String
    var systemImage: String?
    var isDisabled = false
    let action: () -> Void

    var body: some View {
        Button {
            sparkleTrigger += 1
            action()
        } label: {
            HStack(spacing: AlineaSpacing.xs) {
                Text(title)

//                if let systemImage {
//                    Image(systemName: systemImage)
//                        .font(.system(size: 16, weight: .bold))
//                        .symbolEffect(.bounce, value: sparkleTrigger)
//                }
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
                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
            }
            .shadow(color: AlineaColors.primaryPurple.opacity(isDisabled ? 0 : 0.42), radius: 18, x: 0, y: 10)
            .shadow(color: AlineaColors.violet.opacity(isDisabled ? 0 : 0.18), radius: 8, x: 0, y: 2)
            .opacity(isDisabled ? 0.48 : 1)
            .overlay(alignment: .topTrailing) {
                SparkleBurst(trigger: sparkleTrigger, tint: Color.white)
                    .offset(x: -30, y: 12)
            }
        }
        .buttonStyle(.delightfulPress)
        .disabled(isDisabled)
        .accessibilityLabel(title)
    }
}
