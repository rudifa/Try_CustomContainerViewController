//
//  Try_CustomContainerViewControllerTests.swift
//  Try_CustomContainerViewControllerTests
//
//  Created by Rudolf Farkas on 22.06.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

@testable import Try_CustomContainerViewController
import XCTest

class Try_CustomContainerViewControllerTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testStateMachine1() {
        var sm = StateMachine1()
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

    func testStateMachine2() {
        enum State {
            case black, red, green, blue
        }

        enum Event {
            case done, cancel, reset
        }

        typealias State_Event = HashablePair<State, Event>

        let dictionary: [State_Event: State] = [
            State_Event(.black, .cancel): .red,
            State_Event(.black, .done): .black,
            State_Event(.red, .cancel): .black,
            State_Event(.red, .done): .green,
            State_Event(.green, .cancel): .black,
            State_Event(.green, .done): .blue,
            State_Event(.blue, .cancel): .black,
            State_Event(.blue, .done): .red,
        ]

        for (key, _) in dictionary {
            print("hash of key=", key.hashValue)
        }
    }

    func testStateMachine3() {
        var sm = StateMachine3<State, Event>(state: .red)

        XCTAssert(sm.state == .red)
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
}
