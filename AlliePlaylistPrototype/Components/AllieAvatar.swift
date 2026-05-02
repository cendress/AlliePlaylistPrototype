//
//  AllieAvatar.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct AllieAvatar: View {
    var size: CGFloat = 92

    var body: some View {
        ZStack {
            Circle()
                .fill(AlineaColors.allieHaloYellow.opacity(0.34))
                .frame(width: size * 1.7, height: size * 1.7)
                .blur(radius: size * 0.24)
                .offset(x: -size * 0.06, y: size * 0.04)

            Circle()
                .fill(AlineaColors.allieGlowWhite.opacity(0.42))
                .frame(width: size * 1.24, height: size * 1.24)
                .blur(radius: size * 0.13)
                .offset(y: size * 0.2)

            Circle()
                .fill(AlineaGradients.allieHalo)
                .frame(width: size * 1.08, height: size * 1.08)
                .shadow(color: AlineaColors.allieGlowWhite.opacity(0.52), radius: size * 0.18)

            Circle()
                .fill(AlineaColors.allieGlowWhite.opacity(0.92))
                .frame(width: size, height: size)
                .overlay {
                    ZStack {
                        Circle()
                            .fill(AlineaColors.allieInnerPurple.opacity(0.88))
                            .frame(width: size * 0.58, height: size * 0.58)
                            .offset(x: -size * 0.16, y: -size * 0.08)
                            .blur(radius: size * 0.08)

                        Circle()
                            .fill(AlineaColors.allieInnerBlue.opacity(0.84))
                            .frame(width: size * 0.48, height: size * 0.48)
                            .offset(x: size * 0.22, y: -size * 0.12)
                            .blur(radius: size * 0.09)

                        Circle()
                            .fill(AlineaColors.allieInnerPink.opacity(0.78))
                            .frame(width: size * 0.54, height: size * 0.54)
                            .offset(x: -size * 0.02, y: size * 0.08)
                            .blur(radius: size * 0.08)

                        Circle()
                            .fill(AlineaColors.allieWarmOrange.opacity(0.7))
                            .frame(width: size * 0.38, height: size * 0.38)
                            .offset(x: size * 0.16, y: size * 0.24)
                            .blur(radius: size * 0.1)
                    }
                    .frame(width: size * 0.84, height: size * 0.84)
                    .clipShape(Circle())
                }
                .overlay {
                    Circle()
                        .stroke(Color.white.opacity(0.72), lineWidth: 1)
                }
        }
        .frame(width: size * 1.6, height: size * 1.6)
        .accessibilityHidden(true)
    }
}
