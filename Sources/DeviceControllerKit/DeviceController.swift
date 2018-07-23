//
//  DeviceController.swift
//  SwiftJumperPackageDescription
//
//  Created by kingcos on 04/01/2018.
//

import Foundation
import ShellCommandKit

public enum DeviceSystem {
    case android
    case ios
}

public struct DeviceController {
    
    var system: DeviceSystem
    
    public init(_ system: DeviceSystem) {
        self.system = system
    }
    
}

extension DeviceController {
    public func isAvaliable() -> Bool {
        switch system {
        case .android:
            let result = ShellCommand.run(["-c", "adb devices"]) ?? ""
            
            return result.hasSuffix("device\n\n")
        case .ios:
            break
        }
        
        return false
    }
    
    public func getScreenshot(with filename: String) -> String? {
        switch system {
        case .android:
            _ = ShellCommand.run(["-c",
                                  "adb shell screencap -p /sdcard/\(filename)"])
            _ = ShellCommand.run(["-c",
                                  "adb pull /sdcard/\(filename) ./Resources/"])
        case .ios:
            break
        }
        
        let result = FileManager
            .default
            .fileExists(atPath: "./Resources/\(filename)") ? filename : nil
        return result
    }
    
    public func clickInsideScreen(at position: (Int, Int, Int, Int),
                                  during time: Int) {
        switch system {
        case .android:
            _ = ShellCommand.run(["-c",
                                  "adb shell input swipe \(position.0) \(position.1) \(position.2) \(position.3)  \(time)"])
        case .ios:
            break
        }
    }
    
    public func getModel() -> String? {
        switch system {
        case .android:
            let pattern = "model:(.*?) "
            guard let output = ShellCommand.run(["-c", "adb devices -l"]),
                  let info = output.substringsWithPattern(pattern),
                      info.count > 0, // eg: model:MI_5
                  let colonIndex = info[0].index(of: ":") else { return nil }
            let startIndex = info[0].index(after: colonIndex)
            let endIndex = info[0].index(before: info[0].endIndex)
            let model = info[0][startIndex ..< endIndex]
            
            return String(model)
        case .ios:
            break
        }
        
        return nil
    }
}
