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
                url: "https://sdk.cdn.blueseasx.com/ios/V1.9.0/2026091500/BlueSeaSDK.xcframework.zip",
                checksum: "892c2706b75a8308513a782c2a73858bb5d1648fe11e4c3ef19cccb468d22c67"
            ),
        ]
)
