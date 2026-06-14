// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

@preconcurrency import PackageDescription

extension PackageDescription.Target.Dependency {}

extension PackageDescription.Target.PluginUsage {
  static let swiftLint: Self = .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
}
    
let package = Package(
    name: "PlaygroundCore",
    // Development Target
    platforms: [.iOS(.v18)],
    products: [
        .library(
            name: "Main", targets: ["Main"]),
    ],
    dependencies: [
      .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", exact: "0.63.3"),
    ],
    targets: [
        .target(
            name: "Main",
            dependencies: [
              "ExpandableScrollViewSample"
            ],
            path: "Sources/Samples/Main"
        ),
        .target(
          name: "ExpandableScrollViewSample",
          path: "Sources/Samples/ExpandableScrollViewSample"
        ),
    ]
)

for target in package.targets {
  // Feature共通の依存関係の追加
//  if let path = target.path, path.hasSuffix("Sources/Features/") {
//    target.dependencies += []
//  }
  // Pluginを設定
  if target.type == .regular || target.type == .test {
    target.plugins = target.plugins ?? []
    target.plugins?.append(.swiftLint)
  }
}
