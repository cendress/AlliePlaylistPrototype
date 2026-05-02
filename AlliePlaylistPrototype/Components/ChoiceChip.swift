//
//  ChoiceChip.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct ChoiceChip: View {
    let title: String
    var isSelected = false
    let action: () -> Void

    init(_ title: String, isSelected: Bool = false, action: @escaping () -> Void = {}) {
        self.title = title
        self.isSelected = isSelected
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(AlineaFonts.callout)
                .foregroundStyle(isSelected ? AlineaColors.textPrimary : AlineaColors.textSecondary)
                .padding(.horizontal, AlineaSpacing.md)
                .frame(height: AlineaSpacing.chipHeight)
                .background {
                    if isSelected {
                        Capsule()
                            .fill(AlineaGradients.selectedChip)
                    } else {
                        Capsule()
                            .fill(AlineaColors.elevatedCard)
                    }
                }
                .overlay {
                    Capsule()
                        .stroke(isSelected ? Color.white.opacity(0.28) : AlineaColors.border, lineWidth: 1)
                }
                .shadow(color: AlineaColors.primaryPurple.opacity(isSelected ? 0.34 : 0), radius: 14, x: 0, y: 7)
                .scaleEffect(isSelected ? 1.02 : 1)
                .animation(.spring(response: 0.28, dampingFraction: 0.82), value: isSelected)
        }
        .buttonStyle(.plain)
    }
}
