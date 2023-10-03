//
//  numicodes.swift
//  
//
//  Created by Herve Crespel on 31/08/2023.
//

import Foundation
import SwiftUI

public enum Numictype: String {
    case all = "all numic"
    case antik = "antik numic"
    case ancient = "ancient numic"
    case artificial = "artificial numic"
    case live = "live numic"
    case zero = "avec zéro"
}

// Jeux de chiffres
public struct Numicodeset {
    public let name: LocalizedStringKey
    public let set:[Numicode]

    public init(_ type:Numictype) {
        name = LocalizedStringKey(type.rawValue)
        switch type {
        case .all:
            set = Extended.codes + Dekaval.codes + Chinois.codes + Grec.codes + Mesopotamie.codes + [.global, .cister, .maya, .roman, .shadok,.shadok5, .yiking, .alphabet, .base72 ]
        case .antik:
            set = [.roman] + Grec.codes + [.aegypt] + Mesopotamie.codes
        case .ancient:
            set = [.maya, .cister, .yiking] + Numicodeset(.antik).set
        case .artificial:
            set = [.shadok, .shadok5, .alphabet, .base72]
        case .live:
            set = Dekaval.codes + Chinois.codes + [.bibi]
        case .zero:
            set = Numicodeset(.live).set + [.yiking]
        }
    }
    
    init(_ n:LocalizedStringKey, _ s:[Numicode]) {
        name = n
        set = s
    }
        
    public func othercodes(_ exclude:[Numicode]) -> Numicodeset{
        var others :[Numicode] = []
        for item in set {
            //let item = set[i]
            if !exclude.contains(item) {
                others.append(item)
            }
        }
        return Numicodeset(name, others)
    }
}

public enum Numicode: LocalizedStringKey {
    case base72     = "base 72"
    case global     = "global"
    case alphabet   = "alphabet"
    case arab       = "arab"
    // case aztek   = "aztèque"
    case bibi       = "bibi-binary"
    case bali       = "bali"
    case bengali    = "bengali"
    case brahmi     = "brahmi"
    case burmese    = "burmese"     // birman
    case cister     = "cistercian"
    case devanagari = "devanagarî"
    case farsi      = "farsi"
    case gujarati   = "gujarati"
    case gurmukhi   = "gurmukhi"
    case javanese   = "javanese"
    case kannada    = "kannada"
    case hanzi      = "china"
    case kanji      = "japan"
    case khmer      = "khmer"
    case kor        = "korean"
    case lao        = "lao"
    case maithili   = "maithili"
    case malayalam  = "malayalam"
    case maya       = "maya"
    case meitei     = "meitei"
    case modi       = "modi"
    case mongolian  = "mongolian"
    case nagari     = "nagari"
    case odia       = "odia"
   // case quenya     = "quenya"
    case santali    = "santali"
    case shadok     = "shadok"
    case shadok5    = "shadok5"
    case sharada    = "sharada"
    case tamil      = "tamil"
    case telugu     = "telugu"
    case thai       = "thai"
    case tibetan    = "tibetan"
    // case urdu    = "urdu"        idem farsi
    case yiking     = "yiking"
    
    // additif
    case aegypt     = "aegypt"
    case alpha      = "alpha grec"   // alphabétique grec
    case attic      = "attic grec"   // acrophonique grec
    case babyash    = "babylonian ash"
    case babydish   = "babylonian dish"
    case babygesh   = "babylonian gesh"
    case ash        = "cunei ash"
    case dish       = "cunei dish"
    case gesh2      = "cunei gesh"
    case geshu      = "cunei geshu"
    case roman      = "roman"
    case sumer      = "sumerian tens"
    case sumerash   = "sumerian ash"
    case sumergesh  = "sumerian gesh"
    case sumerdish  = "sumerian dish"
    
    // archaïque
    case unarbat    = "unarstyle.bat"
    case unargat    = "unarstyle.gbat"
    case unarbar    = "unarstyle.barre"
    case unardiag   = "unarstyle.diag"
    case unarame    = "unarstyle.arame"
    case unaramh    = "unarstyle.aramh"
    case unarpalm   = "unarstyle.palmyre"
    case unarmino   = "unarstyle.minoan"
    case unarcar    = "unar.carre"
    case unarV      = "unarstyle.V"
    case unarX      = "unarstyle.X"
   
}

public enum Graphism : String {
    case bibi       = "bibi-binaire"
    // case aztek   = "aztèque"
    case maya       = "maya"
    case yiking     = "yiking"
}
