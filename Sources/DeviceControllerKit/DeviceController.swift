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
    public static func getScreenshot(_ system: DeviceSystem = .android) -> String? {
        let screenshotName = "wejump_screenshot.png"
        
        switch system {
        case .android:
            _ = ShellCommand.run(["-c",
                                  "adb shell screencap -p /sdcard/\(screenshotName)"])
            _ = ShellCommand.run(["-c",
                                  "adb pull /sdcard/\(screenshotName) ./Resources/"])
        case .ios:
            break
        }
        
        let result = FileManager
            .default
            .fileExists(atPath: "./Resources/\(screenshotName)") ? screenshotName : nil
        return result
    }
}
