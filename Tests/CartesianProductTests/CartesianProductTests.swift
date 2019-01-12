import XCTest
@testable import CartesianProduct

final class CartesianProductTests: XCTestCase {

    // We need a struct here because tuples are not Equatable
    struct Product: Equatable {
        let a: String
        let b: String

        init(_ a: String, _ b: String) {
            self.a = a
            self.b = b
        }

        static func == (lhs: Product, rhs: Product) -> Bool {
            return lhs.a == rhs.a && lhs.b == rhs.b
        }
    }

    func testProduct() {
        let sequence = product(["a", "b"], ["c", "d"])
        let allValues = sequence.map(Product.init)
        let expectedValues = [
            Product("a", "c"),
            Product("a", "d"),
            Product("b", "c"),
            Product("b", "d")
        ]
        XCTAssertEqual(allValues, expectedValues)
    }

    static var allTests = [
        ("testProduct", testProduct),
    ]
}
