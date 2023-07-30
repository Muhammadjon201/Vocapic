//
//  BaseResponse.swift
//  Vocapic
//
//  Created by ericzero on 8/6/23.
//

import UIKit

public enum BaseResponse: Error {
    
    case forbidden(body: Any?)
    case notFound(body: Any?)
    case validationProblem(error: Any?)
    case unexpectedError(error:Any?)
    case serviceOffline
    case badRequest(body: Any?)
    
}
