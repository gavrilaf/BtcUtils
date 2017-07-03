//
//  StringExtention.swift
//  BtcUtils
//
//  Created by Eugen Fedchenko on 6/29/17.
//  Copyright © 2017 gavrilaf. All rights reserved.
//

import Foundation

extension String {
    
    func parseHex() -> [UInt8] {
        guard self.characters.count > 0 && self.characters.count % 2 == 0 else { return [] }
        
        var data = [UInt8](repeating: 0, count: self.characters.count/2)
        var byteLiteral = ""
        
        for (index, character) in self.characters.enumerated() {
            if index % 2 == 0 {
                byteLiteral = String(character)
            } else {
                byteLiteral.append(character)
                guard let byte = UInt8(byteLiteral, radix: 16) else { return [] }
                data[index / 2] = byte
            }
        }
        return data
    }
}
