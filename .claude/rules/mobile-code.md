---
globs: ["mobile/**", "app/**/*.swift", "app/**/*.kt", "**/*.dart", "src/screens/**", "src/navigation/**"]
---

# Mobile Code Standards

## Platform Behavior
- Safe area insets handled on every screen (SafeAreaView / safeAreaInsets)
- Keyboard avoiding behavior on every screen with text input
- Back button behavior correct on Android (hardware back, gesture navigation)
- Status bar style managed per-screen where needed

## Performance
- No blocking the JS/main thread — all async operations properly awaited
- Lists use FlatList/FlashList (React Native) or LazyColumn (Android) or LazyVStack (iOS)
- Never `map()` items inside a ScrollView for large lists
- Images cached and optimized (expo-image, SDWebImage, Glide)

## Offline Behavior
- Define online/offline behavior explicitly for every network-dependent feature
- Errors from network failure shown as user-friendly messages, not raw errors
- Optimistic updates reversed correctly on failure

## State Management
- Screen-level state: component state (useState, remember)
- Global state: Zustand/Jotai (React Native), Riverpod (Flutter), ViewModel (Android), @StateObject (iOS)
- Server state: React Query (React Native), Repository pattern (Flutter/Android/iOS)

## Navigation
- All screens reachable via deep link (define URL scheme early)
- Navigation state not duplicated in component state
- Modal/stack navigation patterns appropriate for the interaction type

## Accessibility
- VoiceOver (iOS) and TalkBack (Android) labels on all interactive elements
- Minimum touch target: 44×44 points (iOS) / 48×48dp (Android)
- Color contrast checked for both light and dark mode
