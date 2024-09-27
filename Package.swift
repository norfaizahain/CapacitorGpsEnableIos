// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CapacitorGpsEnableIos",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "CapacitorGpsEnableIos",
            targets: ["CapacitorGpsEnableIosPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "CapacitorGpsEnableIosPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/CapacitorGpsEnableIosPlugin"),
        .testTarget(
            name: "CapacitorGpsEnableIosPluginTests",
            dependencies: ["CapacitorGpsEnableIosPlugin"],
            path: "ios/Tests/CapacitorGpsEnableIosPluginTests")
    ]
)