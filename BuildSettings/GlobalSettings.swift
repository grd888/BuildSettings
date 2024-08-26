//
//  GlobalSettings.swift
//  BuildSettings
//
//  Created by Greg Delgado on 8/26/24.
//

import Foundation

enum BuildEnvironment: String {
    case dev
    case qa
    case staging
    case prod
}

enum GlobalSettings {
    static let environment: BuildEnvironment = {
        guard let rawEnvironment = Bundle.main.infoDictionary!["APP_ENVIRONMENT"]  as? String,
              let environment = BuildEnvironment(rawValue: rawEnvironment) else {
            preconditionFailure("APP_ENVIRONMENT cannot be nil")
        }
        return environment
    }()
    
    static let baseApiPath: String = {
        guard let path = Bundle.main.infoDictionary!["BASE_URL"]  as? String else {
            preconditionFailure("BASE_URL cannot be nil")
        }
        return path
    }()
    
    static let logLevel: String = {
        guard let logLevel = Bundle.main.infoDictionary!["LOG_LEVEL"]  as? String else {
            preconditionFailure("LOG_LEVEL cannot be nil")
        }
        return logLevel
    }()
}
