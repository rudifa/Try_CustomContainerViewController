//
//  Try_CustomContainerViewControllerTests.swift
//  Try_CustomContainerViewControllerTests
//
//  Created by Rudolf Farkas on 22.06.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import XCTest
@testable import Try_CustomContainerViewController

class Try_CustomContainerViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStateMachine() {
        let sm = StateMachine()
        XCTAssert(sm.currentState == .red)
        XCTAssert(sm.nextState(event: .cancel) == .red)

        XCTAssert(sm.nextState(event: .done) == .green)
        XCTAssert(sm.nextState(event: .done) == .blue)
        XCTAssert(sm.nextState(event: .done) == .red)

        XCTAssert(sm.nextState(event: .done) == .green)
        XCTAssert(sm.nextState(event: .cancel) == .red)

        XCTAssert(sm.nextState(event: .done) == .green)
        XCTAssert(sm.nextState(event: .done) == .blue)
        XCTAssert(sm.nextState(event: .cancel) == .red)

    }
    
    func xtestPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
