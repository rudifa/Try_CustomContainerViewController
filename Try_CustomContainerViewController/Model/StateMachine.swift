//
//  StateMachine.swift
//  Try_CustomContainerViewController
//
//  Created by Rudolf Farkas on 23.06.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import UIKit

enum State {
    case red, green, blue
}

enum Event {
    case cancel, done
}

struct StateMachine1 {
    private var state: State = .red

    mutating func nextState(event: Event) -> State {
        switch (state, event) {
        case (.red, .done): state = .green
        case (.green, .done): state = .blue
        case (.blue, .done): state = .red
        case (_, .cancel): state = .red
        }
        return state
    }

    var currentState: State {
        return state
    }
}

struct StateMachine2 {
    private var state: State = .red

    typealias State_Event = HashablePair<State, Event>

    let dictionary: [State_Event: State] = [
        State_Event(.red, .done): .green,
        State_Event(.green, .done): .blue,
        State_Event(.blue, .done): .red,
        State_Event(.red, .cancel): .green,
        State_Event(.green, .cancel): .blue,
        State_Event(.blue, .done): .red,
    ]
}

struct StateMachine3<S, E> {
    private(set) var state: S!

    init(state: S) {
        self.state = state
    }
}

extension StateMachine3 where S == State, E == Event {
    mutating func nextState(event: Event) -> State {
        switch (state, event) {
        case (.red, .done): state = .green
        case (.green, .done): state = .blue
        case (.blue, .done): state = .red
        case (_, .cancel): state = .red
        case (_, .done): break
        }
        return state
    }
}
