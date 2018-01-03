//
//  ShellCommand.swift
//  SwiftJumperPackageDescription
//
//  Created by kingcos on 03/01/2018.
//

import Foundation

public enum ShellLaunchPath: String {
    case shell = "/bin/sh"
    case bash  = "/bin/bash"
    case zsh   = "/bin/zsh"
}

public struct ShellCommand {
    public static func run(_ arguments: [String],
                           in launchPath: ShellLaunchPath = .shell) -> String? {
        let process = Process()
        let pipe = Pipe()
        
        let fileHandle = pipe.fileHandleForReading
        
        process.arguments = arguments
        process.launchPath = launchPath.rawValue
        process.standardOutput = pipe
        
        process.launch()
        
        let result = String(data: fileHandle.readDataToEndOfFile(), encoding: .utf8)
        return result
    }
}
