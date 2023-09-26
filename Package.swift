// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AllDigits",
    platforms: [.iOS(.v13),.macOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AllDigits",
            targets: ["AllDigits"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "http://github.com/oliveware/Hexaglyphes", branch: "main"),
        .package(url: "http://github.com/oliveware/Digiconf", branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AllDigits",
            dependencies: ["Hexaglyphes","Digiconf"],
            resources: [
                .process("resources")]
        ),
        
        .testTarget(
            name: "AllDigitsTests",
            dependencies: ["AllDigits"]),
    ]
)
