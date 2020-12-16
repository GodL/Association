import XCTest
@testable import Association

final class AssociationTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let target = NSObject()
        
        target.associationObject["id"] = 15
        target.associationObject["name"] = "lihao"
        
        XCTAssertEqual(15, target.associationObject["id"])
        XCTAssertEqual("lihao", target.associationObject["name"])
        
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
