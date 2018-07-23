//
//  String-Extension.swift
//  SwiftJumperPackageDescription
//
//  Created by kingcos on 05/01/2018.
//

import Foundation

extension String {
    func substringsWithPattern(_ pattern: String) -> [String]? {
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            let results = regex.matches(in: self,
                                        options: [],
                                        range: NSRange(location: 0, length: self.count))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch {
            print(error)
        }
        
        return nil
    }
}
