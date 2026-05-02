//
//  PlaylistMockData.swift
//  AlliePlaylistPrototype
//

import SwiftUI

struct PlaylistAngle: Identifiable, Equatable {
    var id: String { title }

    let title: String
    let description: String
}

struct PlaylistColorOption: Identifiable, Equatable {
    var id: String { name }

    let name: String
    let color: Color

    static func == (lhs: PlaylistColorOption, rhs: PlaylistColorOption) -> Bool {
        lhs.name == rhs.name
    }
}

struct AllocationItem: Identifiable {
    var id: String { ticker }

    let companyName: String
    let ticker: String
    let weight: Double
    let tint: Color
}

enum PlaylistMockData {
    static let playlistName = "The Future of Care"
    static let userBelief = "AI is changing healthcare"
    static let beliefInputValue = "AI is changing healthcare..."
    static let playlistDescription = "A playlist for companies using AI to make healthcare more predictive, personalized, and efficient."

    static let beliefChips = [
        "AI in healthcare",
        "Space economy",
        "Women’s sports boom",
        "Clean energy comeback",
        "Future of food"
    ]

    static let defaultBeliefChip = beliefChips[0]

    static let clarifyingAngles = [
        PlaylistAngle(
            title: "AI Infrastructure",
            description: "Chips, cloud, and data platforms powering healthcare AI."
        ),
        PlaylistAngle(
            title: "Care Delivery",
            description: "Tools helping doctors diagnose, treat, and monitor patients."
        ),
        PlaylistAngle(
            title: "Balanced Mix",
            description: "A blend across infrastructure, diagnostics, drug discovery, and care platforms."
        )
    ]

    static let defaultAngle = clarifyingAngles[2]

    static let insights = [
        Insight(
            title: "Cultural Momentum",
            value: "High",
            message: "AI healthcare is moving from niche research into mainstream conversation.",
            symbolName: "sparkles",
            tint: AlineaColors.allieInnerPink
        ),
        Insight(
            title: "Macro Tailwind",
            value: "Strong",
            message: "Aging populations, clinician shortages, and rising costs are pushing healthcare toward automation.",
            symbolName: "wind",
            tint: AlineaColors.infoBlue
        ),
        Insight(
            title: "Risk Profile",
            value: "Medium-High",
            message: "Regulation, clinical adoption, and AI hype cycles could create volatility.",
            symbolName: "exclamationmark.triangle.fill",
            tint: AlineaColors.warningYellow
        ),
        Insight(
            title: "Theme Coherence",
            value: "88%",
            message: "This playlist connects AI infrastructure, diagnostics, drug discovery, and care efficiency.",
            symbolName: "circle.hexagongrid.fill",
            tint: AlineaColors.healthcareGreen
        )
    ]

    static let stockRecommendations = [
        StockRecommendation(
            companyName: "NVIDIA",
            ticker: "NVDA",
            category: "Infrastructure",
            rationale: "AI compute backbone for imaging, drug discovery, and clinical models.",
            accentColor: AlineaColors.healthcareGreen
        ),
        StockRecommendation(
            companyName: "Microsoft",
            ticker: "MSFT",
            category: "Cloud AI",
            rationale: "Cloud and AI infrastructure used across healthcare systems.",
            accentColor: AlineaColors.infoBlue
        ),
        StockRecommendation(
            companyName: "GE HealthCare",
            ticker: "GEHC",
            category: "Diagnostics",
            rationale: "Medical imaging and diagnostics with AI integration.",
            accentColor: AlineaColors.cyan
        ),
        StockRecommendation(
            companyName: "Intuitive Surgical",
            ticker: "ISRG",
            category: "Care Delivery",
            rationale: "Robotic surgery and precision care.",
            accentColor: AlineaColors.warningYellow
        ),
        StockRecommendation(
            companyName: "Eli Lilly",
            ticker: "LLY",
            category: "Drug Discovery",
            rationale: "Scaled healthcare leader using AI across discovery and operations.",
            accentColor: AlineaColors.allieWarmOrange
        ),
        StockRecommendation(
            companyName: "Tempus AI",
            ticker: "TEM",
            category: "Precision Medicine",
            rationale: "Clinical data and AI platform for personalized treatment.",
            accentColor: AlineaColors.allieInnerPink
        )
    ]

    static let refinementChips = [
        "Lower risk",
        "More aggressive",
        "Less big tech",
        "More pure healthcare",
        "More AI infrastructure"
    ]

    static let defaultRefinement = refinementChips[0]

    static let metricComparisons = [
        MetricComparison(
            title: "Risk Score",
            before: "7.4",
            after: "5.8",
            tint: AlineaColors.positiveGreen
        ),
        MetricComparison(
            title: "Volatility",
            before: "High",
            after: "Medium",
            tint: AlineaColors.infoBlue
        ),
        MetricComparison(
            title: "Theme Purity",
            before: "88%",
            after: "81%",
            tint: AlineaColors.warningYellow
        )
    ]

    static let monitoringItems = [
        "FDA policy on AI diagnostics",
        "Healthcare earnings calls",
        "AI adoption in hospitals",
        "Labor shortages and automation demand"
    ]

    static let allocationItems = [
        AllocationItem(companyName: "NVIDIA", ticker: "NVDA", weight: 22, tint: AlineaColors.healthcareGreen),
        AllocationItem(companyName: "Microsoft", ticker: "MSFT", weight: 20, tint: AlineaColors.infoBlue),
        AllocationItem(companyName: "GE HealthCare", ticker: "GEHC", weight: 17, tint: AlineaColors.cyan),
        AllocationItem(companyName: "Intuitive Surgical", ticker: "ISRG", weight: 15, tint: AlineaColors.warningYellow),
        AllocationItem(companyName: "Eli Lilly", ticker: "LLY", weight: 18, tint: AlineaColors.allieWarmOrange),
        AllocationItem(companyName: "Tempus AI", ticker: "TEM", weight: 8, tint: AlineaColors.allieInnerPink)
    ]

    static let playlistColors = [
        PlaylistColorOption(name: "Violet", color: AlineaColors.primaryPurple),
        PlaylistColorOption(name: "Pink", color: AlineaColors.allieInnerPink),
        PlaylistColorOption(name: "Blue", color: AlineaColors.infoBlue),
        PlaylistColorOption(name: "Cyan", color: AlineaColors.cyan),
        PlaylistColorOption(name: "Green", color: AlineaColors.healthcareGreen),
        PlaylistColorOption(name: "Orange", color: AlineaColors.allieWarmOrange)
    ]
}
