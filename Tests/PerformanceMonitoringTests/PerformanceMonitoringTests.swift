import XCTest
@testable import PerformanceMonitoring

class PerformanceMonitoringTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(PerformanceMonitoring().text, "Hello, World!")
    }


    static var allTests : [(String, (PerformanceMonitoringTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
