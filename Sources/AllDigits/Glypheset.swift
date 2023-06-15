//
//  File.swift
//  
//
//  Created by Herve Crespel on 19/11/2021.
//

import Foundation

public var multibasemax = 72

struct Classifierset {
    var high: [String] = []
    var low: [String] = []
    var kot: [String] = []   // kind fo thing
    
    init(_ numicode:Numicode = .global) {
        switch numicode {
        case .hanzi:
            high = Toucheset("hanzi_wan").symbols
            low = Toucheset("hanzi_10").symbols
        case .kanji:
            high = Toucheset("kanji_man").symbols
            low = Toucheset("kanji_10").symbols
        case .kor:
            high = Toucheset("hangeul_man").symbols
            low = Toucheset("hangeul_10").symbols
        default:
            high = []
            low = []
            kot = [""]
        }
    }
}

public struct Powers {
    public var group: [String] = []  //["1000","10 000", "100 000"]
    public var digit: [String] = []   //["1","10","100"]
    
    private var power = 1
    
    public init(_ base:Int, _ groupby:Int,_ nb:Int = 3) {
        for _ in 1...groupby {
            digit.append(String(power))
            power *= base
        }
        digit.reverse()
        let groupower = power
        for i in 1...nb {
            group.append(String(power))
            // pour éviter un overflow !
            if i < nb && power < 100000000 {
                power *= groupower
            }
        }
        group.reverse()
        print(digit)
    }
}

struct Glypheset {
    var symbols:[String]
    
    init(_ set:[String]) {
        symbols = set
    }
    
    func symbol(_ index:Int) {
        index < symbols.count ? symbols[index] : "?"
    }
    
    subscript (_ index: Int) {
        return symbol(index)
    }
    
}
    
   
