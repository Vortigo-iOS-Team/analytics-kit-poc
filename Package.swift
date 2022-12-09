// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AnalyticsKit",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "AnalyticsKit",
            targets: ["AnalyticsKit"]),
    ],
    dependencies: [
        .package(name: "Firebase", url: "https://github.com/firebase/firebase-ios-sdk.git", from: "9.5.0"),
        .package(url: "https://github.com/AppsFlyerSDK/AppsFlyerFramework.git", from: "6.1.0")
    ],
    targets: [
        .target(
            name: "AnalyticsKit",
            dependencies: [
                .product(name: "FirebaseAnalytics", package: "Firebase"),
                .product(name: "FirebaseCrashlytics", package: "Firebase"),
                .product(name: "AppsFlyerLib", package: "AppsFlyerFramework")
            ],
            resources: [
                .process("Resources")
            ]),
        .testTarget(
            name: "AnalyticsKitTests",
            dependencies: ["AnalyticsKit"]),
    ]
)
