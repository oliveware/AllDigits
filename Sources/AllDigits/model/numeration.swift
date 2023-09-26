//
//  File.swift
//  
//
//  Created by Herve Crespel on 23/11/2021.
//

import Foundation
import SwiftUI

public var multibasemax = 72

public struct Numeration {

    // var classifiers = Classifierset() // caractères unicode des classifieurs
    public var numicode = Numicode.global
    
    public func isnot(_ numer:Numeration) -> Bool {
        return numicode != numer.numicode || base != numer.base
    }
    
    public var base = 10
    public var nativebase = 10
    public var baserange : ClosedRange<Int> = 2...10

    // le plus grand nombre défini par la plus grande puissance décimale
    public var powermax = 17
    /*public func sature(_ value:Int)->Bool {
        if greatest == 0 {
            return false
        } else {
            return value >= greatest - 10
        }
    }*/
    
    // écriture correspondant au numicode
    // bro ne correspond à une aucun numicode
   // public var correspondingScript = Ecriture.bro
    
    public var isglobal10: Bool {
        numicode == .global && base == 10
    }
    
    public var graphism : Graphism?

    public var isgraphic: Bool {graphism != nil}   // true si les chiffres sont des graphismes composés par des programmes SwiftUI
    
    var zeroisknown = true
    var isadditive = false
    
    func chiffre(_ maxpower:Int, _ power:Int, _ index:Int) -> String {
        if power <= powermax && index < base {
            switch numicode {
            case .hanzi:
                return Chinois.hanzi(maxpower, power, index)
            case .kanji:
                return Chinois.kanji(maxpower, power, index)
            case .kor:
                return Chinois.hangeul(maxpower, power, index)
            case .aegypt:
                return Hieroglyph.chiffre(maxpower, power, index)
            case .attic:
                return Grec.acrochiffre(maxpower, power, index)
            case .alpha:
                return Grec.alphachiffre(maxpower, power, index)
            case .roman:
                return Romain.chiffre(maxpower, power, index)
            default:
                return clavier()[index]
            }
        } else {
            return "?"
        }
        
    }
    
    public func clavier(_ power:Int = 0) -> [String] {
        switch numicode {
        case .base72:  // multibase
            return Extended.base72
        case .global:
            return Extended.global
        case .aegypt:
            return Hieroglyph.clavier(power)
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
            return Grec.acrophoniclavier(power)
        case .alpha:
            return Grec.alphabeticlavier(power)
        case .hanzi:
            return Chinois.hanziset
        case .kanji:
            return Chinois.kanjiset
        case .khmer:
            return Decimal.khmer
        case .kor:
            return Chinois.hangeulset
        case .lao:
            return Decimal.lao
        case .roman:
            return Romain.clavier(power)
        case .shadok:
            return Shadok.symbols(4)
        case .shadok5:
            return Shadok.symbols(5)
        case .telugu:
            return Decimal.telugu
        case .thai:
            return Decimal.thai
            
        case .babyash, .babydish, .babygesh, .sumerash, .sumerdish, .sumergesh, .geshu, .sumer, .cuneigesh, .cuneidish, .cuneiash:
            return Mesopotamie.symbols(numicode)
        default:
            return Generic.symbols(.digits, 72)
        }
    }
    
    // groupement des chiffres
    public var groupby = 3
    
    public init(_ numic:Numicode = .global, _ b:Int = 10){
        set(numic)
        set(b)
    }
    
    public var scale:CGFloat {
        switch numicode {
        case .bali, .hanzi, .kanji:
            return 0.8
        case .shadok, .shadok5:
            return 0.6
        case .roman, .alpha, .attic,  .aegypt:
            return 0.4
        case .babyash, .babydish, .babygesh, .sumerash, .sumerdish, .sumergesh, .geshu, .sumer, .cuneigesh, .cuneidish, .cuneiash:
            return 0.5
        default:
            return 1
        }
    }

    private mutating func set(_ numic:Numicode) {
        numicode = numic
       // classifiers = Classifierset(numic)
        setnativebase()
        powermax = 17
        zeroisknown = true
        isadditive = false
        switch numic {
        case .base72:  // multibase
            baserange = setbaserange(2, 72)
        case .global:
            baserange = setbaserange(2, 36)
        case .aegypt:
            baserange = setbaserange(10, 10)
            powermax = 5
            groupby = 6
            zeroisknown = false
            isadditive = true
        case .alphabet:
            baserange = setbaserange(2, 26)
        case .geshu, .sumer :
            baserange = setbaserange(2, 6)
        case .sumerash, .sumerdish, .sumergesh, .babyash, .babydish, .babygesh:
             baserange = setbaserange(2, 60)
            groupby = 3
        case .bibi:
            baserange = setbaserange(2, 16)
            graphism = .bibi
            //  correspondingScript = .bibi
        case .brahmi:
            baserange = setbaserange(2, 10)
            groupby = 2
        case .cister:
            baserange = setbaserange(10, 10)
            groupby = 4
        case .attic:
            baserange = setbaserange(2, 10)
            powermax = 5
            groupby = 3
            zeroisknown = false
            isadditive = true
        case .alpha:
            baserange = setbaserange(2, 10)
            powermax = 5
            groupby = 3
            zeroisknown = false
            isadditive = true
        case .hanzi:
            baserange = setbaserange(2, 10)
            //  correspondingScript = .zh
            groupby = 4
            // glyphes[0] et glyphes[1] servent à Digigroup
        case .kanji:
            baserange = setbaserange(2, 10)
            // ecritures = [.japa, .kanji, .japr]
            groupby = 4
            //  correspondingScript = .japa
        case .kor:
            baserange = setbaserange(2, 10)
            // correspondingScript = .kor
            groupby = 4
        case .maya:
            baserange = setbaserange(2, 20)
            graphism = .maya
        case .roman:
            baserange = setbaserange(2, 10)
            powermax = 4
            groupby = 6
            zeroisknown = false
            isadditive = true
        case .shadok:
            baserange = setbaserange(2, 4)
            zeroisknown = false
        case .shadok5:
            baserange = setbaserange(2, 5)
        case .yiking:
            baserange = setbaserange(2, 64)
            graphism = .yiking
        default:
            baserange = setbaserange(2, 10)
        }
    }
    
    func setbaserange(_ a:Int,_ b:Int)->ClosedRange<Int> {
        var nbc = clavier(0).count
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
    
    var baseisnative:Bool { nativebase == base }
    
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
    
    mutating func setbasetonative(){
        base = nativebase
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
    
    var baselocked = false
    mutating func baselock() {
        baselocked = !baselocked
    }
    
    public mutating func setbase(_ newbase: Int) {
        if baserange.contains(newbase) {
            change(numicode, newbase)
        }
    }
    
    public mutating func change(_ choice:Numicode,_ b:Int, _ locked:Bool = false){
        groupby = 3
        set(choice)
        // base est encore l'ancienne base
        if baselocked {
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

