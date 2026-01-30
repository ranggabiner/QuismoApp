# Quismo

**AI-Powered Smoking Cessation Companion**

An iOS application that reimagines smoking cessation by transforming Cognitive Behavioral Therapy (CBT) into an always-available AI companion. Built with Swift, SwiftUI, and powered by OpenAI GPT-4o mini.

---

## Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [Tech Stack](#tech-stack)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Implementation Details](#implementation-details)
- [Getting Started](#getting-started)
- [Dependencies](#dependencies)
- [Design Patterns](#design-patterns)
- [Contributors](#contributors)

---

## Overview

While 63.4% of smokers actively want to quit, over 90% fail because they attempt it without a proper plan. Professional counseling is proven effective, yet only 7.3% utilize it—many feel embarrassed by social stigma or find clinical visits too logistically difficult.

**Quismo** addresses this gap by providing:

- A judgment-free safe space through an AI companion
- Real-time trigger identification and pattern recognition
- Proven coping strategies including guided breathing techniques
- Instant support when cravings hit

The result is a support system that is both accessible and deeply personal, ensuring no one has to fight their addiction alone.

---

## Key Features

### AI Companion Chat (Poppy)
Powered by OpenAI GPT-4o mini, Poppy is a conversational AI companion that uses CBT techniques to support users through their quit journey with empathetic, non-judgmental responses.

### Breathing Technique Exercises
Guided breathing exercises with video guidance to help manage cravings and reduce withdrawal anxiety, implemented using AVKit video playback.

### Progress Dashboard
Comprehensive tracking of smoke-free days, money saved, and overall progress with an intuitive dashboard interface.

### Achievement Badge System
Gamified motivation system with unlockable badges loaded from JSON data to celebrate milestones and encourage continued progress.

### Personalized Onboarding
Multi-step onboarding flow collecting user data including quit reasons, smoking habits, and commitment level for personalized support.

### Cigarette Logging & Tracking
Visual calendar tracker to monitor smoking patterns, identify triggers, and measure improvement over time.

---

## Tech Stack

### Core Technologies

| Technology | Version | Purpose |
|------------|---------|---------|
| Swift | 5.0 | Primary programming language |
| SwiftUI | iOS 17+ | Declarative UI framework |
| SwiftData | iOS 17+ | Persistent data storage |
| Xcode | 16.0 | Development environment |

### AI Integration

| Library | Purpose |
|---------|---------|
| [OpenAI Swift](https://github.com/MacPaw/OpenAI) | GPT-4o mini integration for AI companion chat |

### Apple Frameworks

| Framework | Purpose |
|-----------|---------|
| AVKit | Video playback for breathing exercises |
| AVFoundation | Sound effects and audio management |
| Foundation | Core utilities, notifications, data handling |
| UIKit | Haptic feedback and legacy UI integration |

### Requirements

- iOS 17.0+
- iPhone (Optimized)
- Xcode 15.4+

---

## Architecture

Quismo implements **Clean Architecture** combined with **MVVM (Model-View-ViewModel)** pattern to ensure:

- **Separation of Concerns** — Clear boundaries between layers
- **Testability** — Business logic isolated for unit testing
- **Maintainability** — Modular codebase for efficient updates
- **Scalability** — Extensible design for new features

### Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                      PRESENTATION LAYER                         │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐  │
│  │     Views       │  │   ViewModels    │  │  ViewControllers│  │
│  │   (SwiftUI)     │◄─┤   (Reactive)    │  │   (UIKit)       │  │
│  └─────────────────┘  └────────┬────────┘  └─────────────────┘  │
└────────────────────────────────┼────────────────────────────────┘
                                 │
┌────────────────────────────────┼────────────────────────────────┐
│                        DOMAIN LAYER                              │
│  ┌─────────────────┐  ┌────────▼────────┐  ┌─────────────────┐  │
│  │     Models      │  │    UseCases     │  │  Repositories   │  │
│  │  (Entities)     │  │ (Business Logic)│  │   (Protocols)   │  │
│  └─────────────────┘  └────────┬────────┘  └────────┬────────┘  │
└────────────────────────────────┼────────────────────┼───────────┘
                                 │                    │
┌────────────────────────────────┼────────────────────┼───────────┐
│                         DATA LAYER                               │
│  ┌─────────────────┐  ┌────────▼────────────────────▼────────┐  │
│  │  SwiftData      │  │      Persistent Storages             │  │
│  │  (Context)      │◄─┤  (SwiftDataManager, UserStorage)     │  │
│  └─────────────────┘  └──────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
                                 │
┌────────────────────────────────┼────────────────────────────────┐
│                       EXTERNAL SERVICES                          │
│  ┌─────────────────────────────▼─────────────────────────────┐  │
│  │                    OpenAI GPT-4o mini                      │  │
│  │              (AI Companion Chat API)                       │  │
│  └───────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
```

### Layer Responsibilities

| Layer | Components | Responsibility |
|-------|------------|----------------|
| Presentation | Views, ViewModels, ViewControllers | UI rendering, user interaction, state management |
| Domain | Models, UseCases, Repositories | Business logic, entity definitions, data contracts |
| Data | SwiftDataManager, UserStorage | Data persistence, API integration |

---

## Project Structure

```
QuismoApp/
├── Quismo/
│   ├── QuitSmokingApp.swift              # App entry point
│   │
│   ├── Components/                        # Reusable UI components
│   │   ├── BadgeCardView.swift
│   │   ├── BadgeModalView.swift
│   │   ├── BadgeSectionView.swift
│   │   ├── CompanionMessageView.swift
│   │   ├── CountdownView.swift
│   │   ├── LetsTalkCard.swift
│   │   ├── MessageView.swift
│   │   └── StatusView.swift
│   │
│   ├── Data/                              # Data layer
│   │   └── PersistantStorages/
│   │       ├── SwiftDataManager.swift
│   │       └── UserStorage.swift
│   │
│   ├── Domain/                            # Business logic layer
│   │   ├── Models/
│   │   │   ├── BadgeModel.swift
│   │   │   ├── ChatLogModel.swift
│   │   │   ├── CigaretteLogModel.swift
│   │   │   ├── CompanionChatHistoryModel.swift
│   │   │   ├── MessageModel.swift
│   │   │   ├── MonthModel.swift
│   │   │   ├── OnBoardingModel.swift
│   │   │   └── UserModel.swift
│   │   │
│   │   ├── Repositories/
│   │   │   ├── BadgeRepository.swift
│   │   │   └── UserRepository.swift
│   │   │
│   │   └── UseCases/
│   │       ├── BadgeUseCase.swift
│   │       ├── ChatBuddyUseCase.swift
│   │       ├── CigaretteLogUseCase.swift
│   │       ├── CompanionChatUseCase.swift
│   │       ├── DashboardUseCase.swift
│   │       └── OnBoardingUseCase.swift
│   │
│   ├── Scene/                             # Presentation layer
│   │   ├── View/
│   │   │   ├── BadgeView.swift
│   │   │   ├── ChatBuddyView.swift
│   │   │   ├── ChatSessionView.swift
│   │   │   ├── CompanionChatView.swift
│   │   │   ├── DashboardView.swift
│   │   │   ├── OnboardingView.swift
│   │   │   ├── TabbarView.swift
│   │   │   ├── TrackView.swift
│   │   │   └── ... (additional views)
│   │   │
│   │   ├── ViewController/
│   │   │   ├── ChatController.swift
│   │   │   └── ... (additional controllers)
│   │   │
│   │   └── ViewModel/
│   │       ├── BadgeViewModel.swift
│   │       ├── ChatBuddyViewModel.swift
│   │       ├── DashboardViewModel.swift
│   │       ├── OnBoardingViewModel.swift
│   │       └── TrackViewModel.swift
│   │
│   ├── Resources/
│   │   ├── SoundManager.swift
│   │   └── badgesData.json
│   │
│   ├── BreathingTechniqueView.swift
│   ├── BreathingVideo.mov
│   └── Assets.xcassets/
│
└── Quismo.xcodeproj/
```

---

## Implementation Details

### OpenAI GPT-4o mini Integration

The AI companion leverages OpenAI's GPT-4o mini model with CBT-focused system prompts:

```swift
import OpenAI

class CompanionChatUseCase: ObservableObject {
    private let openAI: OpenAI
    
    init() {
        self.openAI = OpenAI(apiToken: "YOUR_API_KEY")
    }
    
    private func getCompanionReply() {
        let query = ChatQuery(
            messages: messages.map({ 
                .init(role: $0.isUser ? .user : .system, content: $0.content)! 
            }),
            model: .gpt4_o_mini
        )
        
        openAI.chats(query: query) { result in
            // Handle response
        }
    }
}
```

### SwiftData Persistence

Data persistence using Apple's SwiftData framework:

```swift
import SwiftData

public class SwiftDataManager {
    public static var shared = SwiftDataManager()
    var container: ModelContainer?
    var context: ModelContext?

    init() {
        container = try? ModelContainer(
            for: UserStorage.self, 
                Message.self, 
                ChatHistory.self, 
                SessionStatus.self
        )
        if let container {
            context = ModelContext(container)
        }
    }
}
```

### Haptic Feedback Integration

Enhanced user experience with tactile feedback:

```swift
UIImpactFeedbackGenerator(style: .medium).impactOccurred()
```

---

## Getting Started

### Prerequisites

- macOS Sonoma 14.0+
- Xcode 15.4+
- iOS 17.0+ device or simulator
- OpenAI API Key

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/ranggabiner/QuismoApp.git
   cd QuismoApp
   ```

2. **Open in Xcode**
   ```bash
   open Quismo.xcodeproj
   ```

3. **Configure API Key**
   
   Update the API key in `Domain/UseCases/CompanionChatUseCase.swift`:
   ```swift
   self.openAI = OpenAI(apiToken: "YOUR_OPENAI_API_KEY")
   ```

4. **Build and Run**
   
   Select target device and press `Cmd + R`

---

## Dependencies

| Package | Source | Purpose |
|---------|--------|---------|
| [OpenAI](https://github.com/MacPaw/OpenAI) | Swift Package Manager | GPT-4o mini API client |

---

## Design Patterns

| Pattern | Implementation |
|---------|----------------|
| MVVM | Separation of View, ViewModel, and Model |
| Clean Architecture | Domain, Data, Presentation layers |
| Repository Pattern | Abstract data access layer |
| Use Case Pattern | Encapsulated business logic |
| Singleton | `SwiftDataManager.shared`, `SoundManager.shared` |
| Observer | `@Published` properties with `@ObservableObject` |
| Dependency Injection | Repository injection into UseCases |

---

## Contributors

- **Rangga Biner** — Lead Developer
- **Michael Chrisandy** — iOS Developer

---

## License

This project is for portfolio and educational purposes.

---

## Acknowledgments

- [OpenAI](https://openai.com/) — GPT-4o mini API
- [MacPaw OpenAI Swift](https://github.com/MacPaw/OpenAI) — Swift client library
- Apple Developer Documentation — SwiftUI, SwiftData, AVKit