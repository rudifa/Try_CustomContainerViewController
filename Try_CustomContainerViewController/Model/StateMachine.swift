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

class StateMachine: NSObject {
    private var state: State = .red

    func nextState(event: Event) -> State {
        switch (state, event) {
        case (.red, .done): state = .green
        case (.green, .done): state = .blue
        case (.blue, .done): state = .red
        case (_, .cancel): state = .red
//        default: break
        }
        return state
    }

//    func state() -> State {
//        return state
//    }

    var currentState: State {
        get {
            return state
        }
    }

}