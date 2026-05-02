//
//  AlineaGradients.swift
//  AlliePlaylistPrototype
//

import SwiftUI

enum AlineaGradients {
    static let primaryCTA = LinearGradient(
        colors: [AlineaColors.primaryPurple, AlineaColors.violet],
        startPoint: .leading,
        endPoint: .trailing
    )

    static let selectedChip = LinearGradient(
        colors: [AlineaColors.primaryPurple, AlineaColors.allieInnerPink],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let playlistAccent = LinearGradient(
        colors: [
            AlineaColors.allieInnerPink,
            AlineaColors.primaryPurple,
            AlineaColors.infoBlue,
            AlineaColors.healthcareGreen
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let allieHalo = RadialGradient(
        colors: [
            AlineaColors.allieGlowWhite.opacity(0.96),
            AlineaColors.allieHaloYellow.opacity(0.78),
            AlineaColors.allieHaloYellow.opacity(0.18),
            .clear
        ],
        center: .center,
        startRadius: 2,
        endRadius: 78
    )

    static func playlistColor(_ color: Color) -> LinearGradient {
        LinearGradient(
            colors: [color, AlineaColors.violet, AlineaColors.primaryPurple],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
