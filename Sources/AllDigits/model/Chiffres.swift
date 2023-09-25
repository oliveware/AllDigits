//
//  File.swift
//  
//
//  Created by Herve Crespel on 01/09/2023.
//

import Foundation

public struct Chiffres {

    public var values : [Int] = []
    
    var empty:Bool {values.count == 0}
    
    mutating func add(_ value:Int) {
        values.append(value)
    }
    
    mutating func clear() {
        values = []
    }
    
    mutating func compose60(_ value:Int) {
        if values.count == 0 {
            values = [value]
        } else {
            let deja = values[0]
            if deja < 10 {
                if value > 9 {
                    values[0] += value
                }
            } else {
                if value < 10 && deja % 10 == 0 {
                    values[0] += value
                }
            }
        }
    }
}
