//
//  Groupe.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
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

public struct Groupe : Hashable {
    // valeurs des chiffres dans la base courante, dans l'ordre décroissant des puissances
    var values : [Int] = []
    // nombre max de chiffres du groupe
    private var groupby: Int = 3
    // base du groupe     (ex:80 en mangarévien, 1000 en global, 10 000 en chinois)
    private var base: Int = 1000
    // puissance du groupe
    var power: Int = 0
    
    var isnul:Bool {
        var tot = 0
        for val in values {
            tot += val
        }
        return tot == 0
    }
    
    mutating func indianpower() {if groupby == 2 { power += 1 } }
    
    func classifier(_ classifieurs: [Mot]) -> String {
        if power == 0 || isnul {
            return ""
        } else {
            let singulier = values.count == 1 && values[0] == 1
            return classifieurs[power-1][!singulier]
        }
    }
    // valeur du groupe en base 10
    internal var global10: Int = 0
    
    // unité = chiffre(0), dizaine = chiffre(1)
    func chiffre(_ power:Int) -> Int {
        let nbc = values.count
        return values[nbc - 1 - power]
    }
    
    
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
    
    func enlettres(_ code:Langue.Code, _ kind:Langue.KindOfScript) -> String {
        let langue = Langue(code, kind)
        return langue.ecrire([self])
    }
    var mcdu : Mcdu { Mcdu(values) }
    struct Mcdu {
        var unit:Int = 0
        var diz:Int = 0
        var cent:Int = 0
        var mil:Int = 0
        
        init(_ values: [Int]) {
            switch values.count {
            case 1:
                unit = values[0]
            case 2:
                diz = values[0]
                unit = values[1]
            case 3:
                cent = values[0]
                diz = values[1]
                unit = values[2]
            case 4:
                mil = values[0]
                cent = values[1]
                diz = values[2]
                unit = values[3]
            default:
                break
            }
        }
    }

}
