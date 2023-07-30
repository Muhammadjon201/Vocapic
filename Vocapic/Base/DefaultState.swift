//
//  DefaultState.swift
//  Vocapic
//
//  Created by ericzero on 8/6/23.
//

import Foundation

public struct ResponseData {
    
    public typealias Body = Data

    public var success: Bool?
    public var state: BaseState?

    public init(state: BaseState) {
        self.state = state
        self.success = false
    }

    public init(response: (HTTPURLResponse, Data?)) {
        self.state = BaseState.online
        self.success = (200..<300).contains(response.0.statusCode)
    }
    
}
