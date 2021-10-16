// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "PokemonAPI",
    platforms: [
        .macOS(.v10_11),
        .iOS(.v11),
        .watchOS(.v2),
        .tvOS(.v9),
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
                    path: "Tests",
                    exclude: ["../Example"])
    ]
)
