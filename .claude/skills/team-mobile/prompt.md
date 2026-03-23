# /team-mobile — Mobile Team Assembly

You are assembling the mobile team for a focused work session.

Read `.claude/docs/stack-config.md` to identify the mobile stack, then activate the appropriate specialists.

## Team Assembly

**If React Native / Expo:**
→ Mobile Lead + React Native Specialist + QA Engineer

**If Flutter:**
→ Mobile Lead + Flutter Specialist + QA Engineer

**If iOS Native:**
→ Mobile Lead + iOS Specialist + QA Engineer

**If Android Native:**
→ Mobile Lead + Android Specialist + QA Engineer

**If cross-platform + native:**
→ Mobile Lead + React Native/Flutter Specialist + iOS Specialist + Android Specialist

## Session Kickoff

Ask: "What mobile work are we working on this session?"

Route to appropriate specialist:
- Architecture decisions → Mobile Lead
- React Native implementation → React Native Specialist
- Flutter/Dart implementation → Flutter Specialist
- iOS-specific native → iOS Specialist
- Android-specific native → Android Specialist
- Mobile testing → QA Engineer

## Mobile Work Checklist

For any mobile feature:
- [ ] Works on both iOS and Android (or defined platform-specific behavior)
- [ ] Safe area insets handled
- [ ] Keyboard avoiding on screens with input
- [ ] Loading, empty, and error states implemented
- [ ] Offline behavior defined (what happens with no connectivity?)
- [ ] Accessibility: VoiceOver (iOS) / TalkBack (Android) labels
- [ ] Deep linking route defined
- [ ] Performance: no blocking the JS/main thread

**Start by reading the relevant screen/component files before proposing changes.**
