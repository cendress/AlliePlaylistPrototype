//
//  TickerBadge.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct TickerBadge: View {
    let ticker: String
    var color: Color = AlineaColors.primaryPurple

    var body: some View {
        Text(ticker)
            .font(AlineaFonts.caption)
            .foregroundStyle(AlineaColors.textPrimary)
            .lineLimit(1)
            .minimumScaleFactor(0.72)
            .frame(width: 54, height: 54)
            .background {
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(AlineaGradients.playlistColor(color))
            }
            .overlay(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(Color.white.opacity(0.18))
                    .frame(width: 28, height: 18)
                    .blur(radius: 8)
                    .offset(x: 6, y: 4)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .stroke(Color.white.opacity(0.18), lineWidth: 1)
            }
            .shadow(color: color.opacity(0.26), radius: 14, x: 0, y: 8)
    }
}
