//
//  File.swift
//  
//
//  Created by Herve Crespel on 04/10/2023.
//

import Foundation

struct Substitut {
    
    static func find (_ symbol:String) -> Substitut {
        var code = 0
        var power = 1
        for unit in symbol.unicodeScalars {
            code += Int(unit.value) * power
            power *= 256
        }
        return substituts[code]!
    }
    
    enum Kind {
        case image
        case shape
    }
    
    var name: String
    var kind: Kind
    var scale : CGFloat
    
    init(_ n:String, _ k:Kind = .image, _ s: CGFloat = 1 ) {
        name = n
        kind = k
        scale = s
    }
}

let substituts : [Int:Substitut] = [
    65860 : Substitut("dekapenta", .image, 0.27)
]
