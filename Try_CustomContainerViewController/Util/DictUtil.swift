//
//  DictUtil.swift v.0.1.0
//  Swift4Util
//
//  Created by Rudolf Farkas on 30.06.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import Foundation

/*
 Synthesizing Equatable and Hashable conformance

 https://github.com/apple/swift-evolution/blob/78332d211d00abac286c47609ce1a88a03c6e9bf/proposals/0185-synthesize-equatable-hashable.md

 Status: Implemented (Swift 4.1)

 The struct HashablePair<P1, P2>, below, is an example of struct for which the swift compiler generates the hashValue and func ==.

 init(_ firstProperty: P1, _ secondProperty: P2) lets us avoid argument labels in the initializer call.

 The default generated init would have the signature init(firstProperty: P1, secondProperty: P2).

 */

struct HashablePair<P1, P2>: Hashable where P1: Hashable, P2: Hashable {
    var firstProperty: P1
    var secondProperty: P2
    init(_ firstProperty: P1, _ secondProperty: P2) {
        self.firstProperty = firstProperty
        self.secondProperty = secondProperty
    }
}
