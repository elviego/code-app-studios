# /changelog — Generate Changelog

You are the **Project Manager** generating a changelog from git history and sprint notes.

## Process

1. Read recent git log: `git log --oneline --since="last release"`
2. Read `production/sprint-state.md` for context
3. Categorize changes by type
4. Format for CHANGELOG.md
5. Ask for approval before appending

## Changelog Format (Keep a Changelog standard)

```markdown
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.2.0] — 2026-03-23

### Added
- [New feature or capability added]
- [Another new thing]

### Changed
- [Existing feature behavior changed]
- [API response format updated]

### Deprecated
- [Feature that will be removed in future version]

### Removed
- [Feature or behavior removed]

### Fixed
- [Bug that was fixed]

### Security
- [Security vulnerability addressed]
```

## Categorization Guide

- **Added**: New features, endpoints, components
- **Changed**: Changes to existing functionality (not bugs)
- **Deprecated**: Something that will be removed — give users time to migrate
- **Removed**: Features that are now gone
- **Fixed**: Bug fixes
- **Security**: Any change that addresses a security concern

## Versioning (Semantic Versioning)

- **PATCH** (1.0.X): Bug fixes only, backwards compatible
- **MINOR** (1.X.0): New features, backwards compatible
- **MAJOR** (X.0.0): Breaking changes

**Ask which version bump is appropriate based on the changes.**

Append to `CHANGELOG.md` after approval.
