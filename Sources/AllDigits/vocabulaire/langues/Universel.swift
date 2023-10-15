//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Universal: Languedata {
    

    let ecriture = Ecriture (
        langue:Langue.Code.uni,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : [],
        feminin : [],
        neutre: [],
        dizaines : [],
        centaines : [],
        mille :  ("",nil),
        grands : [("",nil), ("","")]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    
    let doigts = ["a", "e", "i", "o", "u", "y"]
    let mains = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p"]

    let powfix = ["", "q", "r", "s", "t", "v", "w", "x", "z", "rk", "rt", "rm", "rn", "rp", "sk", "st", "sm", "sn", "sp"]

    var units : [String] = ["zif"]
    var powords : [[String]] = []

    var base = 20
    var powers : [Int] = []

    init(_ kind:Langue.KindOfScript = .native) {

        makepowers()
        makeunits()
        
        powords = []
        for p in 0..<powfix.count {
            var words : [String] = []
            for i in 0..<units.count {
                words.append(units[i] + powfix[p])
            }
            powords.append(words)
        }
       // print ("powords : ", powords)
        
        
    }
    
    // traitement des cas particuliers
    func special(_ mcdu: Groupe.Mcdu) -> Ecriture.Special {
        var sp = Ecriture.Special()

        return sp
    }

    mutating func makeunits() {
        let nd = doigts.count
        var nbh = 1
        if base > nd {
            nbh = (base - base % nd) / nd
            if base % nd > 0 { nbh += 1 }
        }
        for h in 1...nbh {
            var i = 0
            while i < nd && (h-1)*nd + i < base {
                units.append(mains[h-1] + doigts[i])
                i += 1
            }
        }
    }

    mutating func makepowers() {
        let np = powfix.count
        var power = 1
        powers = [power]
        for _ in 1...np {
            if (greatest - greatest%base)/base > power {
                power = power * base
                powers.append(power)
            }
        }
    }

    public func lit(decival:Int)->String {
        if decival == 0 {
            return units[0]
        } else {

            var digits : [Int] = []
            
            var reduce = decival
            while reduce > 0 {
                let digit = reduce%base
                digits.append(digit)
                reduce = (reduce - digit)/base
            }
            
            digits = digits.reversed()

            return lit(digits)
        }
    }
    let liaison = "-"
    public func lit(_ native:[Int])->String {
        let digits = native == [] ? [0] : native

        var words = ""
        let nw = digits.count - 1
        
        for i in 0...nw {
            if digits[i] > 0 {
                words += powords[nw-i][digits[i]]
                if i < nw { words += liaison }
            }
        }
       
       // print(digits, words)
        return words
    }
}
