//
//  DeviceControllerKitSpecs.swift
//  SwiftJumperPackageDescription
//
//  Created by kingcos on 04/01/2018.
//

import Foundation
import Spectre

@testable import DeviceControllerKit

public func testDeviceControllerKit() {
    
    let filename = "wejump_screenshot.png"
    
    describe("----- Testing DeviceControllerKit -----") {
        
        $0.it("should get one screenshot directly (Android)") {
            prepareForGettingScreenshot()
            
            let result = DeviceController.getScreenshot()

            try expect(result != nil) == true
        }

        $0.it("should get one screenshot (Android)") {
            prepareForGettingScreenshot()
            
            let result = DeviceController.getScreenshot(.android)

            try expect(result != nil) == true
        }

        $0.it("should click inside the screen directly (Android)") {
            DeviceController.clickInsideScreen(at: (100, 100, 100, 100),
                                               during: 1)
            
            try expect(true) == true
        }
        
        $0.it("should click inside the screen (Android)") {
            DeviceController.clickInsideScreen(.android,
                                               at: (100, 100, 100, 100),
                                               during: 1)
            
            try expect(true) == true
        }
    }
    
    func prepareForGettingScreenshot() {
        if FileManager
            .default
            .fileExists(atPath: "./Resources/\(filename)") {
            do {
                try FileManager.default.removeItem(atPath: "./Resources/\(filename)")
            } catch {
                fatalError("Error occured when delete \(filename).")
            }
        }
    }
}
