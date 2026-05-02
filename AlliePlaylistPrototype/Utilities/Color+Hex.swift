//
//  Color+Hex.swift
//  AlliePlaylistPrototype
//

import SwiftUI

extension Color {
    init(hex: String, alpha: Double = 1.0) {
        let hexValue = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hexValue).scanHexInt64(&int)

        let a: UInt64
        let r: UInt64
        let g: UInt64
        let b: UInt64

        switch hexValue.count {
        case 3:
            a = 255
            r = ((int >> 8) & 0xF) * 17
            g = ((int >> 4) & 0xF) * 17
            b = (int & 0xF) * 17
        case 6:
            a = 255
            r = (int >> 16) & 0xFF
            g = (int >> 8) & 0xFF
            b = int & 0xFF
        case 8:
            a = (int >> 24) & 0xFF
            r = (int >> 16) & 0xFF
            g = (int >> 8) & 0xFF
            b = int & 0xFF
        default:
            a = 255
            r = 255
            g = 255
            b = 255
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: (Double(a) / 255) * alpha
        )
    }
}
