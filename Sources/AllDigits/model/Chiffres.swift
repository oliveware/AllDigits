//
//  File.swift
//  
//
//  Created by Herve Crespel on 01/09/2023.
//

import Foundation

struct Chiffres {
    var numeration: Numeration
    var values : [Int]
    
    var empty:Bool {values.count == 0}
    
    init(_ numic:Numicode, _ base:Int) {
        numeration = Numeration(numic, base)
        values = []
    }
    
    mutating func add(_ value:Int) {
        values.append(value)
    }
    
    mutating func clear() {
        values = []
    }
    
    mutating func compose60(_ value:Int,_ unit:Bool) {
        if values.count == 0 {
            values = [value]
        } else {
            let deja = values[0]
            if unit {
                if deja % 10 == 0 {
                    values[0] += value
                }
            } else {
                if deja < 10 {
                    values[0] += value
                }
            }
        }
    }
}
