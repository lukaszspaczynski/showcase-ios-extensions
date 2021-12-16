// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShowcaseExtensions",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ShowcaseExtensions",
            targets: ["ShowcaseExtensions"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.2.0")),
        .package(url: "https://github.com/RxSwiftCommunity/RxSwiftExt.git", .upToNextMajor(from: "6.1.0")),
        .package(url: "https://github.com/pixeldock/RxAppState.git", .upToNextMajor(from: "1.7.1")),
        .package(url: "https://github.com/RxSwiftCommunity/Action.git", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "9.2.1"))
    ],
    targets: [
        .target(
            name: "ShowcaseExtensions",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
                "RxSwiftExt",
                "RxAppState",
                "Action"
            ]),
        .testTarget(
            name: "ShowcaseExtensionsTests",
            dependencies: [
                "ShowcaseExtensions",
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
                .product(name: "RxBlocking", package: "RxSwift"),
                .product(name: "RxTest", package: "RxSwift"),
                "RxSwiftExt",
                "RxAppState",
                "Action",
                "Nimble"
            ]),
    ]
)
