//
//  File.swift
//  
//
//  Created by Herve Crespel on 01/09/2023.
//

import Foundation

public struct Valuebase {
    public let g10:Int
    public let base:Int
    
    public init(_ value:Int, _ b:Int)
    {
        g10 = value
        base = b
    }
}

public struct Groupe {
    // valeurs des chiffres dans la base courante, dans l'ordre décroissant des puissances
    var values : [Int] = []
    // nombre max de chiffres du groupe
    private var groupby: Int = 3
    // base du groupe     (ex:80 en mangarévien, 1000 en global, 10 000 en chinois)
    private var base: Int = 1000
    // puissance du groupe
    private var power: Int = 0
    // valeur du groupe en base 10
    internal var global10: Int = 0
    
    
    public init(_ gb:Int, _ b: Int, _ p:Int) {
        groupby = gb
        base = b
        power = p
    }
    
    var empty:Bool {values.count == 0}
    
    func conv10() -> Int {
        var decival = 0
        var power = 1
        for value in values.reversed() {
            decival += value * power
            power *= base
        }
       return decival
    }
    
    mutating func add(_ value:Int) {
        values.append(value)
        global10 = conv10()
    }

}

public struct Chiffres {

    // valeurs des chiffres dans la base courante, dans l'ordre décroissant des puissances
    internal var values : [Int] = []
    // base courante
    private var base: Int = 10
    
    
    // valeur du nombre en base 10
    internal var global10: Int = 0
    
    public var value: Valuebase {
        Valuebase(global10, base)
    }
    
    public init(_ decival:Int = 0, _ b:Int = 10) {
        base = b
        global10 = decival
        conval(b)
    }
    
    public func engroupes(_ groupby:Int = 3,_ groupbase:Int = 1000) -> [Groupe] {
        var groupes : [Groupe] = []
        let nbv = values.count
        let reste = nbv % groupby
        let nbfg = (nbv - reste) / groupby
        if reste > 0 {
            var groupe = Groupe(groupby, groupbase, nbfg)
            for i in 0..<reste { groupe.add(values[i]) }
            groupes = [groupe]
        }
        for g in 0..<nbfg {
            var groupe = Groupe(groupby, groupbase, nbfg-g)
            for i in 0..<groupby {
                groupe.add(values[g*groupby + i])
            }
            groupes.append(groupe)
        }
        return groupes
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
    
    mutating func add(_ value:Int, _ additif:Bool = false) {
        if additif {
            var newval : [Int] = [value]
            for value in values { newval.append(value) }
            values = newval
        } else {
            values.append(value)
        }
        global10 = conv10()
    }
    
    mutating func clear() {
        values = []
        global10 = 0
    }

}
