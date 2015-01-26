//
//  ApiResult.swift
//  KocomojoKit
//
//  Created by Antonio Bello on 1/26/15.
//  Copyright (c) 2015 Elapsus. All rights reserved.
//

import Foundation

public enum ApiResult<T: JsonDecodable> {
    case Value(@autoclosure () -> T)
    case HttpError(Int)
    case InvocationError(NSError)
    
    public var succeeded: Bool {
        return !hasError
    }
    
    public var hasError: Bool {
        switch(self) {
        case .HttpError: return true
        case .Value: return false
        case .InvocationError: return false
        }
    }   
}
