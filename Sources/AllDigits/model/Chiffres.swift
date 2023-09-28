//
//  File.swift
//  
//
//  Created by Herve Crespel on 01/09/2023.
//

import Foundation

public struct Chiffres {

    // valeurs des chiffres dans la base courante, dans l'ordre décroissant des puissances
    public var values : [Int] = []
    // base courante
    private var base: Int = 10
    // valeur du nombre en base 10
    var global10: Int = 0
    
    public init(_ decival:Int = 0, _ b:Int = 10) {
        base = b
        global10 = decival
        conval(b)
    }
    
    mutating func change(_ b:Int) {
        if base != b {
            base = b
            conval(b)
        }
    }
    
    func conv10() -> Int {
        var decival = 0
        var power = 1
        for value in values.reversed() {
            decival += value * power
            power *= base
        }
       return decival
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
        values = newvalues.reversed()
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

}
