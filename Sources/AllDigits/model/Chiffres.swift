//
//  File.swift
//  
//
//  Created by Herve Crespel on 01/09/2023.
//

import Foundation

enum Groupement {
    case indien
    case chinois
    case partrois
    // case mangareva
    // case yupana
}

public struct Chiffres {

    // valeurs des chiffres dans la base courante, dans l'ordre décroissant des puissances
    internal var values : [Int] = []
    // base courante
    private var base: Int = 10

   // var groupement:Groupement = .partrois

    // valeur du nombre en base 10
    internal var global10: Int = 0
    // puissance du chiffre le plus puissant
    public var power:Int { values.count - 1 }
    
    public var value: Valuebase {
        Valuebase(global10, base)
    }
    
    public init(_ decival:Int = 0, _ b:Int = 10) {
        base = b
        global10 = decival
        conval(b)
    }
    // groupby variable
    func engroupes(_ groupement:Groupement) -> [Groupe] {
        var groupes : [Groupe] = []
        switch groupement {
        case .chinois:
            groupes = grouper(par: 4, 10000)
        case .indien:
            let nbv = values.count
            var pardeux = Chiffres(0, base)
            var mil = Groupe(3, 1000, 0)
            if nbv < 4 {
                for i in 0..<nbv { mil.add(values[i]) }
                groupes = [mil]
            } else {
                for i in 0..<nbv {
                    if i < nbv - 3 {
                        pardeux.add(values[i])
                    } else {
                        mil.add(values[i])
                    }
                }
                groupes = pardeux.grouper(par:2, 100)
                for g in 0..<groupes.count { groupes[g].indianpower() }
                groupes = groupes + [mil]
            }
        case .partrois:
            groupes = grouper(par: 3, 1000)
        }
        return groupes
    }
    // groupby constant
    public func grouper(par groupby:Int = 3,_ groupbase:Int = 1000) -> [Groupe] {
        var groupes : [Groupe] = []
        var chiffres = values
        let nbv = values.count
        let reste = nbv % groupby
        let nbfg = (nbv - reste) / groupby
        if reste > 0 {
            var groupe = Groupe(groupby, groupbase, nbfg)
            for _ in 0..<reste {
                groupe.add(chiffres[0])
                chiffres.remove(at: 0)
            }
            groupes = [groupe]
        }
        if nbfg > 0 {
            for g in 1...nbfg {
                var groupe = Groupe(groupby, groupbase, nbfg-g)
                for _ in 0..<groupby {
                    groupe.add(chiffres[0])
                    chiffres.remove(at: 0)
                }
                groupes.append(groupe)
            }
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
    
    func enlettres(_ code:Langue.Code, _ kind:Langue.KindOfScript, _ groupement:Groupement) -> String {
        let langue = Langue(code, kind)
        return langue.ecrire(engroupes(groupement))
    }

}
