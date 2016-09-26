import PackageDescription

let package = Package(
    name: "PerformanceMonitoring",
    targets: [
        Target(name: "Server", dependencies: [.Target(name: "PerformanceMonitoring")]),
        Target(name: "PerformanceMonitoring")
    ],
    dependencies: [
    .Package(url: "https://github.com/IBM-Swift/Aphid", majorVersion: 0, minor: 3),
    .Package(url: "https://github.com/IBM-Swift/Kitura", majorVersion: 1, minor: 0)
    ]
)
