//
//  BottomCTA.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct BottomCTA: View {
    let title: String
    var systemImage: String? = "arrow.right"
    let action: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            PrimaryButton(title: title, systemImage: systemImage, action: action)
                .padding(.horizontal, AlineaSpacing.screenHorizontal)
                .padding(.top, AlineaSpacing.md)
                .padding(.bottom, AlineaSpacing.sm)
        }
        .background {
            LinearGradient(
                colors: [
                    AlineaColors.background.opacity(0),
                    AlineaColors.background.opacity(0.94),
                    AlineaColors.background
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        }
        .padding(.bottom, AlineaSpacing.xs)
    }
}
