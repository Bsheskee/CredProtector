//
//  CredProtectorTests.swift
//  CredProtectorTests
//
//  Created by bartek on 14/11/2023.
//

import XCTest
@testable import CredProtector

final class CredProtectorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let manager = CredsManager.emptyState()
        XCTAssertTrue(manager.creds.count == 0, "Should start with empty lists of creds")
        
        manager.addCred()
        XCTAssertTrue(manager.creds.count == 1, "Should have one cred after adding")
        
        
    }


}
