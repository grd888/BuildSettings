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
    
    static private let logLevelBuildConfigSetting: String = {
        guard let logLevel = Bundle.main.infoDictionary!["LOG_LEVEL"]  as? String else {
            preconditionFailure("LOG_LEVEL cannot be nil")
        }
        return logLevel
    }()
}

extension GlobalSettings {
    static var forceSubscribedState: Bool {
        let key = "FORCE_SUBSCRIBE"
        guard ProcessInfo.processInfo.environment.contains(where: {$0.key == key} ) else {
            return false
        }
        return ProcessInfo.processInfo.environment[key] == "true"
    }
    
    static private var logLevelEnvironmentVariable: String? {
        let key = "LOG_LEVEL"
        guard ProcessInfo.processInfo.environment.contains(where: { $0.key == key }) else {
            return nil
        }
        return ProcessInfo.processInfo.environment[key]
    }
}

extension GlobalSettings {
    static var logLevel: String {
        logLevelEnvironmentVariable ?? logLevelBuildConfigSetting
    }
}
