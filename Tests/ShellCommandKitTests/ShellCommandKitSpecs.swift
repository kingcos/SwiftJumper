//
//  ShellCommandKitSpecs.swift
//  SwiftJumper
//
//  Created by kingcos on 04/01/2018.
//

import Foundation
import Spectre

@testable import ShellCommandKit

public func testShellCommandKit() {
    
    describe("----- Testing ShellCommandKit -----") {
        
        $0.it("should run shell command just with arguments") {
            let arguments = ["-c", "swift --version"]
            let result = ShellCommand.run(arguments) ?? ""
            let expectResultPrefix = "Apple Swift version 4"
            
            try expect(result.contains(expectResultPrefix)) == true
        }
        
        $0.it("should run shell command with arguments and a launch path") {
            let arguments = ["-c", "swift --version"]
            let launchPath = ShellLaunchPath.shell
            let result = ShellCommand.run(arguments, in: launchPath) ?? ""
            let expectResultPrefix = "Apple Swift version 4"
            
            try expect(result.contains(expectResultPrefix)) == true
        }
    }
}
