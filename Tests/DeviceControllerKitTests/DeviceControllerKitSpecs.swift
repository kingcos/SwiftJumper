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
    
    let filename = "swiftjumper_screenshot.png"
    let androidController = DeviceController(.android)
    
    describe("----- Testing DeviceControllerKit on Android -----") {
        
        $0.it("should be avaliable") {
            let result = androidController.isAvaliable()
            
            try expect(result) == true
        }

        $0.it("should get one screenshot") {
            prepareForGettingScreenshot()
            
            let result = androidController.getScreenshot(with: filename)

            try expect(result != nil) == true
        }
        
        $0.it("should click inside the screen [PLEASE WATCH YOUR PHONE FOR TESTING]") {
            androidController.clickInsideScreen(at: (100, 100, 100, 100),
                                                during: 1)
            
            try expect(true) == true
        }
        
        $0.it("should get model") {
            let result = androidController.getModel()
            
            try expect(result != nil) == true
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
