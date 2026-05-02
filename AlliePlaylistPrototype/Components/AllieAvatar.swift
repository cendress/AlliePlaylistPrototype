//
//  AllieAvatar.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct AllieAvatar: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var isBreathing = false
    
    var size: CGFloat = 92
    var isAnimated = true
    
    var body: some View {
        ZStack {
            Circle()
                .fill(AlineaColors.allieHaloYellow.opacity(isBreathing ? 0.42 : 0.32))
                .frame(width: size * 1.42, height: size * 1.42)
                .blur(radius: size * 0.18)
                .offset(x: -size * 0.04, y: size * 0.02)
            
            Circle()
                .fill(AlineaColors.allieGlowWhite.opacity(isBreathing ? 0.58 : 0.42))
                .frame(width: size * 1.18, height: size * 1.18)
                .blur(radius: size * 0.1)
                .offset(y: size * 0.12)
            
            Circle()
                .fill(AlineaGradients.allieHalo)
                .frame(width: size * 1.02, height: size * 1.02)
                .shadow(color: AlineaColors.allieGlowWhite.opacity(0.62), radius: size * 0.12)
                .shadow(color: AlineaColors.allieHaloYellow.opacity(0.32), radius: size * 0.16)
            
            Circle()
                .fill(AlineaColors.allieGlowWhite.opacity(0.88))
                .frame(width: size, height: size)
                .blur(radius: size * 0.018)
                .overlay {
                    ZStack {
                        Circle()
                            .fill(AlineaColors.allieInnerPurple.opacity(0.86))
                            .frame(width: size * 0.72, height: size * 0.72)
                            .offset(x: -size * 0.15, y: -size * 0.05)
                            .blur(radius: size * 0.17)
                        
                        Circle()
                            .fill(AlineaColors.allieInnerBlue.opacity(0.78))
                            .frame(width: size * 0.58, height: size * 0.58)
                            .offset(x: size * 0.2, y: -size * 0.1)
                            .blur(radius: size * 0.18)
                        
                        Circle()
                            .fill(AlineaColors.allieInnerPink.opacity(0.72))
                            .frame(width: size * 0.62, height: size * 0.62)
                            .offset(x: -size * 0.02, y: size * 0.08)
                            .blur(radius: size * 0.17)
                        
                        Circle()
                            .fill(AlineaColors.allieWarmOrange.opacity(0.62))
                            .frame(width: size * 0.44, height: size * 0.44)
                            .offset(x: size * 0.14, y: size * 0.22)
                            .blur(radius: size * 0.18)
                    }
                    .frame(width: size * 0.96, height: size * 0.96)
                    .blur(radius: size * 0.035)
                }
                .overlay(alignment: .topLeading) {
                    Circle()
                        .fill(Color.white.opacity(0.32))
                        .frame(width: size * 0.28, height: size * 0.18)
                        .blur(radius: size * 0.1)
                        .offset(x: size * 0.22, y: size * 0.16)
                }
                .overlay {
                    Circle()
                        .stroke(Color.white.opacity(0.32), lineWidth: 0.8)
                }
                .clipShape(.circle)
        }
        .frame(width: size * 1.6, height: size * 1.6)
        .scaleEffect(isBreathing && isAnimated && !reduceMotion ? 1.018 : 1)
        .animation(
            isAnimated && !reduceMotion
            ? .easeInOut(duration: 2.6).repeatForever(autoreverses: true)
            : .default,
            value: isBreathing
        )
        .onAppear {
            guard isAnimated, !reduceMotion else { return }
            isBreathing = true
        }
        .accessibilityHidden(true)
    }
}

#Preview {
    AllieAvatar()
        .preferredColorScheme(.dark)
}
