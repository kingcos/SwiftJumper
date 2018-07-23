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
        
        let arguments = ["-c", "swift --version"]
        let expectResultPrefix = "Apple Swift"
        
        $0.it("should run shell command just with arguments") {
            let result = ShellCommand.run(arguments) ?? ""
            
            try expect(result.contains(expectResultPrefix)) == true
        }
        
        $0.it("should run shell command with arguments and a launch path") {
            let launchPath = ShellLaunchPath.shell
            let result = ShellCommand.run(arguments, in: launchPath) ?? ""
            
            try expect(result.contains(expectResultPrefix)) == true
        }
    }
}
