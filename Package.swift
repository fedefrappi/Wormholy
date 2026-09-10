// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "Wormholy",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "Wormholy",
            targets: ["WormholySwift", "WormholyObjC"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "WormholySwift",
            dependencies: [],
            exclude: [
                "UI/Cells/ActionableTableViewCell.xib",
                "UI/Cells/RequestCell.xib",
                "UI/Cells/TextTableViewCell.xib",
                "UI/Flow.storyboard",
                "UI/Sections/RequestTitleSectionView.xib"
            ],
            resources: [
                .process("Models/Postman/Postman_demo_collection.json"),
                .process("SPMResources"),
                .process("Support Files/Assets.xcassets")
            ]
        ),
        .target(
            name: "WormholyObjC",
            dependencies: [
                "WormholySwift"
            ]),
        .testTarget(
            name: "WormholyTests",
            dependencies: [
                "WormholySwift",
                "WormholyObjC"
            ]),
    ]
)
