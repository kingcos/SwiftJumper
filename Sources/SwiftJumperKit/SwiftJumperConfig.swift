//
//  SwiftJumperConfig.swift
//  SwiftJumperPackageDescription
//
//  Created by kingcos on 07/01/2018.
//

import Foundation

public struct SwiftJumperConfig: Codable {
    let devices: [Device]
}

public struct Device: Codable {
    let device: String
    let pressCoefficient: Double
    let jumperHeight: Int
    let jumperWidth: Int
    let reference: String
}
