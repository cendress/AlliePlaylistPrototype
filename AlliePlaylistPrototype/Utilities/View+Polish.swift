//
//  View+Polish.swift
//  AlliePlaylistPrototype
//

import SwiftUI

private struct PolishedEntranceModifier: ViewModifier {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var hasAppeared = false

    let delay: Double

    func body(content: Content) -> some View {
        content
            .opacity(hasAppeared ? 1 : 0)
            .offset(y: hasAppeared || reduceMotion ? 0 : 12)
            .onAppear {
                guard !hasAppeared else { return }

                if reduceMotion {
                    hasAppeared = true
                } else {
                    withAnimation(.spring(response: 0.46, dampingFraction: 0.88).delay(delay)) {
                        hasAppeared = true
                    }
                }
            }
    }
}

extension View {
    func polishedEntrance(_ index: Int = 0) -> some View {
        modifier(PolishedEntranceModifier(delay: Double(index) * 0.055))
    }
}
