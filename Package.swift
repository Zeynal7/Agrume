// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Agrume",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "Agrume",
            targets: ["Agrume"]
        ),
    ],
    targets: [
        .target(
            name: "Agrume",
            path: "./Agrume"
        )
    ]
)
