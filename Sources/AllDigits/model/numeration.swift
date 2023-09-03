//
//  File.swift
//  
//
//  Created by Herve Crespel on 23/11/2021.
//

import Foundation
import SwiftUI

public var multibasemax = 72

public struct Numeration{

    public var glyphes: [[String]] = []     // caractères unicode utilisés comme chiffres
    var classifiers = Classifierset() // caractères unicode des classifieurs
    public var numicode = Numicode.global
    public var graphism = Graphism.none
    public var isgraphic: Bool {graphism != .none}   // true si les chiffres sont des graphismes composés par des programmes SwiftUI
    public var base = 10
    public var nativebase = 10
    public var baserange : ClosedRange<Int> = 2...10

    // le plus grand nombre qui bloque la saisie (vaut 0 lorsqu'il n'y pas de limite)
    public var greatest = 99999
    
    // écriture correspondant au numicode
    // bro ne correspond à une aucun numicode
   // public var correspondingScript = Ecriture.bro
    
    public var isglobal10: Bool {
        numicode == .global && base == 10
    }
    
    public func symbols(_ power:Int) -> [String] {
        switch numicode {
        case .base72:  // multibase
            return Extended.base72
        case .global:
            return Extended.global
        case .aegypt:
            return Hieroglyph.symbols(power)
        case .alphabet:
            return Extended.alphabet
        case .arab:
            return Decimal.arab
        case .bali:
            return Decimal.balinese
        case .bengali:
            return  Decimal.bengali
        case .birman:
            return  Decimal.birman
        case .brahmi:
            return  Decimal.brahmi
        case .devanagari:
            return  Decimal.devanagari
        case .farsi:
            return  Decimal.farsi
        case .attic:
            return Grec.acrophonic(power)
        case .alpha:
            return Grec.alphabetic(power)
        case .hanzi:
            return Chinois.hanzi
        case .kanji:
            return Chinois.kanji
        case .khmer:
            return  Decimal.khmer
        case .kor:
            return Chinois.hangeul
        case .lao:
            return  Decimal.lao
        case .roman:
            return Romain.symbols(power)
        case .shadok:
            return Shadok.symbols(4)
        case .shadok5:
            return Shadok.symbols(5)
        case .telugu:
            return Decimal.telugu
        case .thai:
            return Decimal.thai
        default:
            return Generic.symbols(.digits, 72)
        }
    }
   
    
    public func isnot(_ numer:Numeration) -> Bool {
        return numicode != numer.numicode || base != numer.base
    }
    
    public func sature(_ value:Int)->Bool {
        if greatest == 0 {
            return false
        } else {
            return value >= greatest - 10
        }
    }
    
    // groupement des chiffres
    public var groupby = 3
    
    public init(_ numic:Numicode = .global, _ b:Int = 10){
        set(numic)
        set(b)
    }

    private mutating func set(_ numic:Numicode) {
        numicode = numic
        classifiers = Classifierset(numic)
        setnativebase()
        switch numic {
        case .base72:  // multibase
            baserange = setbaserange(2, 72)
        case .global:
            baserange = setbaserange(2, 36)
        case .aegypt:
            baserange = setbaserange(10, 10)
            greatest = 999999
            groupby = 6
        case .alphabet:
            baserange = setbaserange(2, 26)
        case .arab:
            baserange = setbaserange(2, 10)
            // correspondingScript = .ar
        case .cuneiash, .cuneidish, .cuneigesh:
            baserange = setbaserange(2, 10)
        case .geshu, .sumer :
            baserange = setbaserange(2, 6)
        case .sumerash, .sumerdish, .sumergesh, .babyash, .babydish, .babygesh:
             baserange = setbaserange(2, 60)
            groupby = 3
        case .bali:
            baserange = setbaserange(2, 10)
        case .bengali:
            baserange = setbaserange(2, 10)
        case .bibi:
             graphism = .bibi
            baserange = setbaserange(2, 16)
            //  correspondingScript = .bibi
        case .birman:
            baserange = setbaserange(2, 10)
        case .brahmi:
            baserange = setbaserange(2, 10)
            groupby = 2
        case .cister:
            baserange = setbaserange(10, 10)
            groupby = 4
        case .devanagari:
            baserange = setbaserange(2, 10)
            groupby = 2
        case .farsi:
            baserange = setbaserange(2, 10)
        case .attic:
            baserange = setbaserange(2, 10)
            greatest = 9999
            groupby = 3
        case .alpha:
            baserange = setbaserange(2, 10)
            greatest = 9999
            groupby = 3
            // glyphes[0] et glyphes[1] servent à Digigroup
        case .hanzi:
            baserange = setbaserange(2, 10)
            //  correspondingScript = .zh
            groupby = 4
            greatest = 999999999999999999
            // glyphes[0] et glyphes[1] servent à Digigroup
        case .kanji:
            baserange = setbaserange(2, 10)
            // ecritures = [.japa, .kanji, .japr]
            groupby = 4
            greatest = 999999999999999999
            //  correspondingScript = .japa
        case .khmer:
            baserange = setbaserange(2, 10)
            // glyphes[0] et glyphes[1] servent à Digigroup
        case .kor:
            baserange = setbaserange(2, 10)
            // correspondingScript = .kor
            groupby = 4
            greatest = 999999999999999999
        case .lao:
            baserange = setbaserange(2, 10)
        case .maya:
            graphism = .maya
            baserange = setbaserange(2, 20)
        case .roman:
            baserange = setbaserange(2, 10)
            greatest = 399999
            groupby = 6
            //  correspondingScript = .latin
        case .shadok:
            baserange = setbaserange(2, 4)
        case .shadok5:
            baserange = setbaserange(2, 5)
        case .telugu:
            baserange = setbaserange(2, 10)
        case .thai:
            baserange = setbaserange(2, 10)
        case .yiking:
            graphism = .yiking
            baserange = setbaserange(2, 64)
        }
    }
    
    func setbaserange(_ a:Int,_ b:Int)->ClosedRange<Int> {
        var nbc = symbols(0).count
        if nbc > multibasemax { nbc = multibasemax }
        let min = a <= b ? a : b
        let max = a <= b ? b : a
        var range : ClosedRange<Int>
        if min <= nbc && nbc <= max {
            range = min...nbc
        } else {
            if nbc < min {
                range = 2...nbc
            } else {
                range = min...max
            }
        }
        return range
    }
    
    mutating func setnativebase() {
        switch numicode {
        case .shadok:
            nativebase = 4
        case .shadok5:
            nativebase = 5
        case .bibi:
            nativebase = 16
        case .maya:
            nativebase = 20
        case .yiking:
            nativebase = 64
        case .babyash, .babydish, .babygesh, .sumerash, .sumerdish, .sumergesh:
            nativebase = 60
        case .alphabet:
            nativebase = 26
        case .base72:
            nativebase = 72
        default:
            nativebase = 10
        }
    }
    
    mutating func setbasetonative()-> Int {
        base = nativebase
        return base
    }
    
    mutating func set(_ asked:Int) {
        if baserange.contains(asked) {
            base = asked
        } else {
            let min = baserange.lowerBound
            if asked < min {
                base = min
            } else {
                let max = baserange.upperBound
                if asked > max {
                    base = max
                } else {
                    base = asked
                }
            }
        }
    }
    
    public mutating func change(_ incordec:Bool) {
        var b: Int
        if incordec {
            if base == baserange.upperBound {
                b = baserange.lowerBound
            } else {
                b = base + 1
            }
        } else {
            if base == baserange.lowerBound {
                b = baserange.upperBound
            } else {
                b = base - 1
            }
        }
        change(numicode, b)
    }
    
    public mutating func setbase(_ newbase: Int) {
        if baserange.contains(newbase) {
            change(numicode, newbase)
        }
    }
    
    public mutating func change(_ choice:Numicode,_ b:Int, _ locked:Bool = false){
        graphism = .none
        groupby = 3
        set(choice)
        // base est encore l'ancienne base
        if locked {
           if !baserange.contains(base) {
                set(b)
           }
        } else {
           set(b)
        }
    }
    
  /*  func complangs()->[Ecriture]{
        var complangs:[Ecriture] = []
        for e in 0..<ecritures.count {
            let lgs = ecrinums[ecritures[e]]
            if lgs != nil {
                for l in 0..<lgs!.count {
                    if lgs![l] == numicode {
                        complangs.append(ecritures[e])
                    }
                }
            }
        }
        return complangs
    }*/
}

