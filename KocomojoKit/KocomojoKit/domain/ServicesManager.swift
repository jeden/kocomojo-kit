//
//  ServicesManager.swift
//  KocomojoKit
//
//  Created by Antonio Bello on 1/27/15.
//  Copyright (c) 2015 Elapsus. All rights reserved.
//

import Foundation

public class ServicesManager {
    private struct Static {
        static var instance: ServicesManager = ServicesManager()
    }
    
    public class var instance: ServicesManager { return Static.instance }
    private lazy var api: RestAPI = RestAPI.instance
    
    private init() {}
}

/// MARK: - Public interface
extension ServicesManager {
    public func getCountries(completion: Result<[Country]> -> ()) {
        self.api.getCountries { apiResult in
            var result: Result<[Country]>
            
            switch apiResult {
            case .HttpError(let status):
                let error = NSError(domain: "kocomojo.kit", code: -4, userInfo: [NSLocalizedDescriptionKey: "Server error: \(status)"])
                result = Result.Error(error)
                
            case .InvocationError(let error):
                result = Result.Error(error)
                
            case .Value(let value):
                let countries = value().countries
                result = Result.Value(countries)
            }
            
            completion(result)
        }
    }
}