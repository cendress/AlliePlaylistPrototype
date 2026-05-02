# AlliePlaylistPrototype

A native SwiftUI prototype for an AI-guided investing playlist creation flow.

## Overview

This project explores how Alinea’s AI companion, Allie, could help users create investing playlists from beliefs, trends, and cultural moments rather than starting with individual stock picking.

The prototype reframes playlist creation around a simple product insight:

Most users do not think in tickers first. They think in ideas, themes, and convictions.

Instead of asking the user to manually select stocks at the beginning, this flow starts with what the user believes is changing in the world. Allie then clarifies the user’s intent, builds an investment thesis, suggests relevant holdings, helps tune the playlist, and keeps monitoring the playlist once it is live.

## Product Concept

Example belief:

> “AI is changing healthcare.”

Allie turns that belief into a playlist called:

> The Future of Care

The flow is designed to feel human, trustworthy, and native to mobile — less like a generic chatbot producing a stock list, and more like a thoughtful investing companion helping the user translate conviction into action.

## Flow

The prototype includes seven screens:

1. **Belief Prompt**  
   The user starts with a trend, feeling, cultural moment, or conviction.

2. **Allie Clarifies**  
   Allie asks a focused follow-up question to understand the user’s angle.

3. **Investment Thesis**  
   Allie explains the theme using cultural momentum, macro context, risk profile, and theme coherence.

4. **Allie Suggested Stocks**  
   Allie recommends a curated set of holdings with short rationales.

5. **Tune Playlist**  
   The user adjusts the playlist around comfort level, risk, and thematic focus.

6. **Customize Playlist**  
   The user personalizes the playlist name, description, and visual identity.

7. **Live Playlist Detail**  
   The playlist becomes a living object in the portfolio, with thesis health and Allie monitoring signals.

## Design Direction

The visual direction is Alinea-inspired:

- Dark mode only
- Premium consumer fintech feel
- Bold Instrument Sans-style typography
- Rounded cards
- Pill-shaped CTAs and chips
- Purple brand energy
- Colorful ticker badges
- A soft glowing Allie orb built directly in SwiftUI

No external image assets are used. Company logos are represented with text-based ticker badges, and the Allie avatar is recreated using SwiftUI shapes, gradients, blur, and opacity.

## Tech Stack

- Swift
- SwiftUI
- iOS
- Hardcoded mock data
- No backend
- No authentication
- No persistence
- No third-party dependencies

## Architecture

The project uses a lightweight, prototype-friendly SwiftUI structure.

```text
AlliePlaylistPrototype
│
├── App
│   ├── ContentView.swift
│   ├── PrototypeStep.swift
│   └── PrototypeViewModel.swift
│
├── DesignSystem
│   ├── AlineaColors.swift
│   ├── AlineaFonts.swift
│   ├── AlineaGradients.swift
│   └── AlineaSpacing.swift
│
├── Models
│   ├── StockRecommendation.swift
│   ├── Insight.swift
│   ├── MetricComparison.swift
│   └── PlaylistMockData.swift
│
├── Components
│   ├── PrimaryButton.swift
│   ├── AllieAvatar.swift
│   ├── AllieMessageCard.swift
│   ├── ChoiceChip.swift
│   ├── SelectableCard.swift
│   ├── InsightCard.swift
│   ├── StockRecommendationCard.swift
│   ├── MetricComparisonCard.swift
│   ├── TickerBadge.swift
│   ├── MockLineChart.swift
│   ├── ScreenHeader.swift
│   └── BottomCTA.swift
│
├── Screens
│   ├── BeliefPromptView.swift
│   ├── AllieClarifiesView.swift
│   ├── InvestmentThesisView.swift
│   ├── SuggestedStocksView.swift
│   ├── TunePlaylistView.swift
│   ├── CustomizePlaylistView.swift
│   └── LivePlaylistDetailView.swift
│
└── Utilities
    └── Color+Hex.swift
