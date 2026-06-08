# Hepsiburada Clone

A SwiftUI clone of the Hepsiburada iOS app, built as a personal project to explore modern iOS architecture patterns, MVVM, and SwiftUI component composition.

> **Status:** Active development — UI flows are being built out screen by screen.

## Tech Stack

- **Language:** Swift 5
- **UI:** SwiftUI
- **Architecture:** MVVM + lightweight router
- **Min iOS:** 17.0
- **IDE:** Xcode 15+

## Features

- Home feed with banner slider, categories, brand slider, campaigns and product grid
- Product detail view
- Lists tab with Favorites and User Lists
- Tab bar navigation with a custom router

All data is mocked — there is no backend integration yet.

## Project Structure

```
HepsiburadaClone/
├── App/                 # App entry point
├── Core/                # Shared utilities and extensions
├── Domain/Models/       # Data models (Product, Category, Campaign, …)
├── Features/            # Feature-scoped views and view models
│   ├── Home/
│   ├── Lists/
│   └── ProductDetail/
├── Navigation/          # AppRouter
└── Presentation/
    └── Components/      # Reusable UI components (cards, sliders, tab bar)
```

## Getting Started

1. Clone the repo:
   ```bash
   git clone https://github.com/aysetakir/hepsiburada-clone.git
   ```
2. Open `HepsiburadaClone/HepsiburadaClone.xcodeproj` in Xcode.
3. Select an iOS 17+ simulator and run.

## Disclaimer

This is an educational/portfolio project and is **not affiliated with, endorsed by, or sponsored by Hepsiburada**. All brand names, logos, and trademarks referenced in this project belong to their respective owners and are used here for non-commercial, illustrative purposes only.

## License

MIT — see [LICENSE](LICENSE).
