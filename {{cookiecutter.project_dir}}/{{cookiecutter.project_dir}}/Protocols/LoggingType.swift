//
//  LoggingProtocol.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on {{ cookiecutter.date }}.
//  Copyright © {{ cookiecutter.year }} {{ cookiecutter.company_name }}. All rights reserved.
//

protocol LoggingProtocol {

    /// Log something generally unimportant (lowest priority)
    ///
    /// - Parameters:
    ///   - message: the message to be logged
    ///   - file: the file from which this is being called
    ///   - function: the function from which this is being called
    ///   - line: the line from which this is being called
    static func verbose(_ message: String, file: String, function: String, line: Int)

    /// Log something which help during debugging (low priority)
    ///
    /// - Parameters:
    ///   - message: the message to be logged
    ///   - file: the file from which this is being called
    ///   - function: the function from which this is being called
    ///   - line: the line from which this is being called
    static func debug(_ message: String, file: String, function: String, line: Int)

    /// Log something which you are really interested but which is not an issue or error (normal priority)
    ///
    /// - Parameters:
    ///   - message: the message to be logged
    ///   - file: the file from which this is being called
    ///   - function: the function from which this is being called
    ///   - line: the line from which this is being called
    static func info(_ message: String, file: String, function: String, line: Int)

    /// Log something which may cause big trouble soon (high priority)
    ///
    /// - Parameters:
    ///   - message: the message to be logged
    ///   - file: the file from which this is being called
    ///   - function: the function from which this is being called
    ///   - line: the line from which this is being called
    static func warning(_ message: String, file: String, function: String, line: Int)

    /// Log something which will keep you awake at night (highest priority)
    ///
    /// - Parameters:
    ///   - message: the message to be logged
    ///   - file: the file from which this is being called
    ///   - function: the function from which this is being called
    ///   - line: the line from which this is being called
    static func error(_ message: String, file: String, function: String, line: Int)

}
