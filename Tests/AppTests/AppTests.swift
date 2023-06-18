@testable import App
import XCTVapor
import Fluent
import FluentPostgresDriver

final class AppTests: XCTestCase {
    func testHelloWorld() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        do {
            try await app.autoMigrate()
        } catch {
            fatalError(String(reflecting: error))
        }
        
        try app.test(.GET, "hello", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "Hello, world!")
        })
    }
}
