//
//  View+Polish.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct DelightfulPressButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed && isEnabled && !reduceMotion ? 0.975 : 1)
            .brightness(configuration.isPressed && isEnabled ? 0.035 : 0)
            .animation(.spring(response: 0.2, dampingFraction: 0.72), value: configuration.isPressed)
    }
}

struct SparkleBurst: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var isExpanded = false

    let trigger: Int
    var tint: Color = AlineaColors.primaryPurple

    var body: some View {
        ZStack {
            ForEach(0..<7, id: \.self) { index in
                Image(systemName: index.isMultiple(of: 2) ? "sparkle" : "circle.fill")
                    .font(.system(size: index.isMultiple(of: 2) ? 9 : 4, weight: .bold))
                    .foregroundStyle(index.isMultiple(of: 3) ? AlineaColors.allieWarmOrange : tint)
                    .scaleEffect(isExpanded ? 1 : 0.22)
                    .opacity(isExpanded ? 0 : 1)
                    .offset(
                        x: isExpanded ? cos(angle(for: index)) * radius(for: index) : 0,
                        y: isExpanded ? sin(angle(for: index)) * radius(for: index) : 0
                    )
            }
        }
        .frame(width: 1, height: 1)
        .opacity(trigger == 0 || reduceMotion ? 0 : 1)
        .onAppear {
            guard trigger > 0, !reduceMotion else { return }
            play()
        }
        .onChange(of: trigger) { _, newValue in
            guard newValue > 0, !reduceMotion else { return }
            play()
        }
    }

    private func angle(for index: Int) -> CGFloat {
        (CGFloat(index) / 7) * .pi * 2 - .pi / 2
    }

    private func radius(for index: Int) -> CGFloat {
        index.isMultiple(of: 2) ? 28 : 20
    }

    private func play() {
        isExpanded = false

        DispatchQueue.main.async {
            withAnimation(.spring(response: 0.48, dampingFraction: 0.78)) {
                isExpanded = true
            }
        }
    }
}

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

extension ButtonStyle where Self == DelightfulPressButtonStyle {
    static var delightfulPress: DelightfulPressButtonStyle {
        DelightfulPressButtonStyle()
    }
}
