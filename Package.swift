// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BlueSeaSDK",
    defaultLocalization: "en",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "BlueSeaSDK",
            targets: ["BlueSeaSDKTarget"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
            // This is a wrapper target to configure various settings required by main binary target.
            .target(
                name: "BlueSeaSDKTarget",
                dependencies: [
                    .target(name: "BlueSeaSDK"),
                ],
                linkerSettings: [
                    .linkedFramework("AdSupport"),
                    .linkedFramework("AppTrackingTransparency"),
                    .linkedFramework("AVFoundation"),
                    .linkedFramework("CoreTelephony"),
                    .linkedFramework("Foundation"),
                    .linkedFramework("SafariServices"),
                    .linkedFramework("StoreKit"),
                    .linkedFramework("SystemConfiguration"),
                    .linkedFramework("UIKit"),
                    .linkedFramework("WebKit"),
                    
                    .linkedLibrary("z"),
                    
                    // NOTE: Swift Package Manager currently does not allow dependencies with unsafeFlags, unless a specific branch/commit is used.
                    // For now, these flags should be added manually to the project for integration.
                    .unsafeFlags(["-ObjC"])
                ]
            ),
            .binaryTarget(
                name: "BlueSeaSDK",
                url: "https://sdk.cdn.blueseasx.com/ios/V1.7.1/2026090900/BlueSeaSDK.xcframework.zip",
                checksum: "dfe2ffaddfb076f546d6ff64395757ff409f6fab91cf97e9259faed33a188f8c"
            ),
        ]
)
