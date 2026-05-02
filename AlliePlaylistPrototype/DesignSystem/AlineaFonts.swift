//
//  AlineaFonts.swift
//  AlliePlaylistPrototype
//

import SwiftUI

#if canImport(UIKit)
import UIKit
#endif

enum AlineaFonts {
    static var massiveTitle: Font { instrument("InstrumentSans-Bold", size: 42, fallback: .bold) }
    static var hugeTitle: Font { instrument("InstrumentSans-Bold", size: 34, fallback: .bold) }
    static var largeTitle: Font { instrument("InstrumentSans-Bold", size: 28, fallback: .bold) }
    static var title1: Font { instrument("InstrumentSans-Bold", size: 24, fallback: .bold) }
    static var title2: Font { instrument("InstrumentSans-Bold", size: 21, fallback: .bold) }
    static var headline: Font { instrument("InstrumentSans-Bold", size: 18, fallback: .bold) }
    static var body: Font { instrument("InstrumentSans-Regular", size: 16, fallback: .regular) }
    static var bodyMedium: Font { instrument("InstrumentSans-Medium", size: 16, fallback: .medium) }
    static var callout: Font { instrument("InstrumentSans-Medium", size: 14, fallback: .medium) }
    static var footnote: Font { instrument("InstrumentSans-Medium", size: 12, fallback: .medium) }
    static var caption: Font { instrument("InstrumentSans-Bold", size: 11, fallback: .bold) }

    private static func instrument(_ fontName: String, size: CGFloat, fallback: Font.Weight) -> Font {
        #if canImport(UIKit)
        if UIFont(name: fontName, size: size) != nil {
            return .custom(fontName, size: size)
        }

        if UIFont(name: "Instrument Sans", size: size) != nil {
            return .custom("Instrument Sans", size: size).weight(fallback)
        }
        #endif

        return .system(size: size, weight: fallback, design: .rounded)
    }
}
