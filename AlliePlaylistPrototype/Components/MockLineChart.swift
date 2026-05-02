//
//  MockLineChart.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct MockLineChart: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var drawProgress: CGFloat = 0
    @State private var showEndpoint = false

    var values: [Double] = [18, 21, 19, 28, 24, 34, 31, 42, 38, 52, 64, 71]
    var tint: Color = AlineaColors.primaryPurple

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                VStack(spacing: 0) {
                    ForEach(0..<4, id: \.self) { _ in
                        Rectangle()
                            .fill(Color.white.opacity(0.06))
                            .frame(height: 1)

                        Spacer()
                    }
                }

                chartFill(in: proxy.size)
                    .fill(
                        LinearGradient(
                            colors: [tint.opacity(0.24), tint.opacity(0.02)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .opacity(showEndpoint ? 1 : 0)

                chartPath(in: proxy.size)
                    .trim(from: 0, to: drawProgress)
                    .stroke(tint.opacity(0.36), style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                    .blur(radius: 5)

                chartPath(in: proxy.size)
                    .trim(from: 0, to: drawProgress)
                    .stroke(
                        LinearGradient(
                            colors: [AlineaColors.allieInnerPink, tint, AlineaColors.infoBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        ),
                        style: StrokeStyle(lineWidth: 3.5, lineCap: .round, lineJoin: .round)
                    )

                if let last = chartPoints(in: proxy.size).last {
                    Circle()
                        .fill(AlineaColors.textPrimary)
                        .frame(width: 9, height: 9)
                        .overlay {
                            Circle()
                                .stroke(tint, lineWidth: 3)
                        }
                        .shadow(color: tint.opacity(0.55), radius: 10, x: 0, y: 0)
                        .scaleEffect(showEndpoint ? 1 : 0.35)
                        .opacity(showEndpoint ? 1 : 0)
                        .position(last)
                }
            }
        }
        .frame(height: 126)
        .onAppear(perform: animateChart)
        .polishedEntrance()
    }

    private func animateChart() {
        guard drawProgress == 0 else { return }

        if reduceMotion {
            drawProgress = 1
            showEndpoint = true
            return
        }

        withAnimation(.easeOut(duration: 0.95).delay(0.16)) {
            drawProgress = 1
        }

        withAnimation(.spring(response: 0.34, dampingFraction: 0.62).delay(0.88)) {
            showEndpoint = true
        }
    }

    private func chartPath(in size: CGSize) -> Path {
        let points = chartPoints(in: size)
        var path = Path()

        guard let first = points.first else { return path }
        path.move(to: first)

        for index in 1..<points.count {
            let previous = points[index - 1]
            let current = points[index]
            let midpoint = CGPoint(
                x: (previous.x + current.x) / 2,
                y: (previous.y + current.y) / 2
            )
            path.addQuadCurve(to: midpoint, control: previous)
        }

        if let last = points.last {
            path.addLine(to: last)
        }

        return path
    }

    private func chartFill(in size: CGSize) -> Path {
        let points = chartPoints(in: size)
        var path = Path()

        guard let first = points.first, let last = points.last else { return path }
        path.move(to: CGPoint(x: first.x, y: size.height))
        path.addLine(to: first)

        for index in 1..<points.count {
            let previous = points[index - 1]
            let current = points[index]
            let midpoint = CGPoint(
                x: (previous.x + current.x) / 2,
                y: (previous.y + current.y) / 2
            )
            path.addQuadCurve(to: midpoint, control: previous)
        }

        path.addLine(to: last)

        path.addLine(to: CGPoint(x: last.x, y: size.height))
        path.closeSubpath()
        return path
    }

    private func chartPoints(in size: CGSize) -> [CGPoint] {
        guard values.count > 1, let minValue = values.min(), let maxValue = values.max() else {
            return []
        }

        let spread = max(maxValue - minValue, 0.001)

        return values.enumerated().map { index, value in
            let progress = CGFloat(index) / CGFloat(values.count - 1)
            let normalized = CGFloat((value - minValue) / spread)
            return CGPoint(
                x: progress * size.width,
                y: size.height - (normalized * size.height)
            )
        }
    }
}
