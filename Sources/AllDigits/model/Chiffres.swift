//
//  File.swift
//  
//
//  Created by Herve Crespel on 01/09/2023.
//

import Foundation

public struct Chiffres {

    // valeurs des chiffres dans la base courante
    public var values : [Int] = []
    // base courante
    private var base: Int = 10
    // valeur du nombre en base 10
    var global10: Int = 0
    
    public init(_ val:Int = 0, _ b:Int = 10) {
        if b == 10 {
            global10 = val
            conval(10)
        } else {
            
        }
    }
    
    func conv10() -> Int {
        var conval = 0
        var power = 1
        for value in values.reversed() {
            conval += value * power
            power *= base
        }
       return conval
    }
    
    mutating func conval(_ newbase:Int) {
        var newvalues: [Int] = []
        var decival = global10
        var chiffre: Int
        while decival > 0 {
            chiffre = decival % newbase
            newvalues.append( chiffre)
            decival = (decival - chiffre) / newbase
        }
        values = newvalues
    }
    
    var empty:Bool {values.count == 0}
    
    mutating func add(_ value:Int) {
        values.append(value)
        global10 = conv10()
    }
    
    mutating func clear() {
        values = []
        global10 = 0
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
