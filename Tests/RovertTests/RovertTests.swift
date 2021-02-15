import XCTest
@testable import Rovert

final class RovertTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(RVTApp().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
