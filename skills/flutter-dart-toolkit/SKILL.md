---
name: flutter-dart-toolkit
description: Comprehensive Flutter and Dart engineering suite. Architecture best practices, responsive layouts, layout bug fixing, routing, testing, mocking, runtime error diagnosis, CLI apps, FFI interop, package conflict resolution, and static analysis.
---

# Flutter & Dart Engineering Suite

A consolidated toolkit for building, testing, optimizing, and maintaining production-grade Flutter applications and Dart packages.

When working on Flutter or Dart tasks, locate the corresponding guide in `references/<category>/<topic>/SKILL.md`.

---

## Catalog & Quick Navigation

### 1. Architecture, Layout & UI (`references/architecture-and-layout/`)
| Topic | Subpath | Description |
| :--- | :--- | :--- |
| **flutter-apply-architecture-best-practices** | `architecture-and-layout/flutter-apply-architecture-best-practices` | Layered architecture (UI, Domain/Logic, Data), state management patterns, and repository contracts. |
| **flutter-build-responsive-layout** | `architecture-and-layout/flutter-build-responsive-layout` | Responsive and adaptive UI using LayoutBuilder, MediaQuery, Expanded, and multi-device breakpoints. |
| **flutter-fix-layout-issues** | `architecture-and-layout/flutter-fix-layout-issues` | Diagnosing RenderFlex overflow, unbounded height/width constraints, and intrinsic dimensions. |
| **flutter-setup-declarative-routing** | `architecture-and-layout/flutter-setup-declarative-routing` | Advanced declarative navigation (go_router), deep linking, nested routes, and route guards. |
| **flutter-setup-localization** | `architecture-and-layout/flutter-setup-localization` | Internationalization setup (l10n.yaml, arb files, flutter_localizations, intl). |
| **flutter-add-widget-preview** | `architecture-and-layout/flutter-add-widget-preview` | Interactive widget preview environments and component showcase setups. |

### 2. Testing & Debugging (`references/testing-and-debugging/`)
| Topic | Subpath | Description |
| :--- | :--- | :--- |
| **flutter-add-widget-test** | `testing-and-debugging/flutter-add-widget-test` | Component-level testing with WidgetTester (tapping, scrolling, pumpAndSettle, matchers). |
| **flutter-add-integration-test** | `testing-and-debugging/flutter-add-integration-test` | End-to-end integration tests using integration_test and Flutter Driver. |
| **dart-add-unit-test** | `testing-and-debugging/dart-add-unit-test` | Unit testing functions, state logic, and services using package:test. |
| **dart-collect-coverage** | `testing-and-debugging/dart-collect-coverage` | Code coverage collection and LCOV report generation. |
| **dart-generate-test-mocks** | `testing-and-debugging/dart-generate-test-mocks` | External dependency mock generation with Mockito and build_runner. |
| **dart-fix-runtime-errors** | `testing-and-debugging/dart-fix-runtime-errors` | Stack trace analysis, null-safety exceptions, and live runtime debugging. |

### 3. Tooling, CLI & Interop (`references/tooling-and-interop/`)
| Topic | Subpath | Description |
| :--- | :--- | :--- |
| **dart-build-cli-app** | `tooling-and-interop/dart-build-cli-app` | Command-line utilities, argument parsing (args), exit codes, and cross-platform scripts. |
| **dart-resolve-package-conflicts** | `tooling-and-interop/dart-resolve-package-conflicts` | Dependency resolution, version solver failures, pubspec dependency overrides. |
| **dart-run-static-analysis** | `tooling-and-interop/dart-run-static-analysis` | `dart analyze` linting enforcement, analysis_options.yaml tuning, and automated fixes (`dart fix`). |
| **dart-setup-ffi-assets** | `tooling-and-interop/dart-setup-ffi-assets` | Native C/C++ source compilation and packaging with Dart Native Assets (hook/build.dart). |
| **dart-use-ffigen** | `tooling-and-interop/dart-use-ffigen` | Automatic C/Objective-C/Swift binding generation with package:ffigen. |
| **dart-write-documentation** | `tooling-and-interop/dart-write-documentation` | Effective Dart documentation conventions and API doc formatting. |
