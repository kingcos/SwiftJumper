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
    public static func isAvaliable(_ system: DeviceSystem) -> Bool {
        switch system {
        case .android:
            let result = ShellCommand.run(["-c", "adb devices"]) ?? ""
            print(result)
            return result.hasSuffix("device\n\n")
        case .ios:
            break
        }
        
        return false
    }
    
    public static func getScreenshot(_ system: DeviceSystem,
                                     with filename: String) -> String? {
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
    
    public static func clickInsideScreen(_ system: DeviceSystem,
                                         at position: (Int, Int, Int, Int),
                                         during time: Int) {
        switch system {
        case .android:
            _ = ShellCommand.run(["-c",
                                  "adb shell input swipe \(position.0) \(position.1) \(position.2) \(position.3)  \(time)"])
        case .ios:
            break
        }
    }
}
