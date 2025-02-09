// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "PokemonAPI",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .watchOS(.v8),
        .tvOS(.v15),
    ],
    products: [
        .library(name: "PokemonAPI",
                 targets: ["PokemonAPI"]),
    ],
    targets: [
        .target(name: "PokemonAPI",
                path: "PokemonAPI",
                exclude: ["../Example", "../Tests"]),
        .testTarget(name: "PokemonAPITests",
                    dependencies: ["PokemonAPI"],
                    path: "Tests")
    ]
)
