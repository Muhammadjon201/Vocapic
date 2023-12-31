//
//  BaseState.swift
//  Vocapic
//
//  Created by ericzero on 8/6/23.
//

import UIKit

import Foundation

public struct BaseState {

    public var serviceState: ServiceState

    public var badRequest: Any?

    public var unauthorized: Any?

    public var forbidden: Any?

    public var notFound: Any?

    public var validationProblem: Any?

    public var unexpectedError: Any?

    public init(
        serviceState: ServiceState = .online,
        badRequest: Any? = nil,
        unauthorized: Any? = nil,
        forbidden: Any? = nil,
        notFound: Any? = nil,
        validationProblem: Any? = nil,
        unexpectedError: Any? = nil
        ) {
        self.serviceState = serviceState
        self.badRequest = badRequest
        self.unauthorized = unauthorized
        self.forbidden = forbidden
        self.notFound = notFound
        self.validationProblem = validationProblem
        self.unexpectedError = unexpectedError
    }

    public static let empty = BaseState()

    public static let offline = BaseState(serviceState: .offline)

    public static let online = BaseState(serviceState: .online)

    public var isSuccess: Bool {
        return self.serviceState == .online
            && self.badRequest == nil
            && self.unauthorized == nil
            && self.forbidden == nil
            && self.notFound == nil
            && self.validationProblem == nil
            && self.unexpectedError == nil

    }

}
