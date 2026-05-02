//
//  PrototypeStep.swift
//  AlliePlaylistPrototype
//

import Foundation

enum PrototypeStep: Int, CaseIterable, Identifiable {
    case beliefPrompt
    case allieClarifies
    case investmentThesis
    case suggestedStocks
    case tunePlaylist
    case customizePlaylist
    case livePlaylistDetail

    var id: Int { rawValue }

    var next: PrototypeStep? {
        PrototypeStep(rawValue: rawValue + 1)
    }

    var previous: PrototypeStep? {
        guard rawValue > 0 else { return nil }
        return PrototypeStep(rawValue: rawValue - 1)
    }

    var stepNumber: Int {
        rawValue + 1
    }

    var totalSteps: Int {
        Self.allCases.count
    }
}
