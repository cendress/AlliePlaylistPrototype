//
//  MockLineChart.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct MockLineChart: View {
    var values: [Double] = [18, 21, 19, 28, 24, 34, 31, 42, 38, 52, 64, 71]
    var tint: Color = AlineaColors.primaryPurple

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                VStack(spacing: 0) {
                    ForEach(0..<4, id: \.self) { _ in
                        Rectangle()
                            .fill(AlineaColors.border)
                            .frame(height: 1)

                        Spacer()
                    }
                }

                chartFill(in: proxy.size)
                    .fill(
                        LinearGradient(
                            colors: [tint.opacity(0.26), tint.opacity(0)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )

                chartPath(in: proxy.size)
                    .stroke(
                        LinearGradient(
                            colors: [AlineaColors.allieInnerPink, tint, AlineaColors.infoBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        ),
                        style: StrokeStyle(lineWidth: 3.5, lineCap: .round, lineJoin: .round)
                    )
            }
        }
        .frame(height: 126)
    }

    private func chartPath(in size: CGSize) -> Path {
        let points = chartPoints(in: size)
        var path = Path()

        guard let first = points.first else { return path }
        path.move(to: first)

        for point in points.dropFirst() {
            path.addLine(to: point)
        }

        return path
    }

    private func chartFill(in size: CGSize) -> Path {
        let points = chartPoints(in: size)
        var path = Path()

        guard let first = points.first, let last = points.last else { return path }
        path.move(to: CGPoint(x: first.x, y: size.height))
        path.addLine(to: first)

        for point in points.dropFirst() {
            path.addLine(to: point)
        }

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
