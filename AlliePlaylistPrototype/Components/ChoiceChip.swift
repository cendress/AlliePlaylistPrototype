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
                        .stroke(isSelected ? AlineaColors.primaryPurple.opacity(0.72) : AlineaColors.border, lineWidth: 1)
                }
                .shadow(color: AlineaColors.primaryPurple.opacity(isSelected ? 0.26 : 0), radius: 12, x: 0, y: 6)
        }
        .buttonStyle(.plain)
    }
}
