// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "Trackr",
    platforms: [
        .iOS(.v13)
    ],
    targets: [
        .target(
            name: "Trackr",
            path: "Trackr"
        )
    ]
)
