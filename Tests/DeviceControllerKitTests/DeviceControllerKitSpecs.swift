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
    
    describe("----- Testing DeviceControllerKit -----") {
        
        $0.it("should get one screenshot directly (Android)") {
            let result = DeviceController.getScreenshot()
            
            try expect(result) != nil
        }
        
        $0.it("should get one screenshot (Android)") {
            let result = DeviceController.getScreenshot(.android)
            
            try expect(result) != nil
        }
    }
}
