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
    case artificial = "artificial numic"
    case live = "live numic"
}

// Jeux de chiffres
public struct Numicodeset {
    public let name: LocalizedStringKey
    public let set:[Numicode]

    public init(_ type:Numictype) {
        name = LocalizedStringKey(type.rawValue)
        switch type {
        case .all:
            set = [.global, .aegypt, .arab, .babyash, .babygesh, .bali, .bibi, .brahmi, .cister, .devanagari, .farsi, .hanzi, .kanji, .khmer, .kor, .lao, .maya, .roman, .shadok,.shadok5, .sumerash, .sumergesh, .telugu, .thai, .yiking, .alphabet,.base72 ]
        case .antik:
            set = [.sumerash, .sumerdish, .sumergesh, .babyash, .babydish, .babygesh, .aegypt, .attic, .alpha, .roman, .maya, .cister]
        case .artificial:
            set = [.bibi, .shadok, .shadok5, .yiking, .alphabet, .base72 ]
        case .live:
            set = [.global, .arab, .bali, .brahmi, .devanagari, .farsi, .hanzi, .kanji, .khmer, .kor, .lao, .telugu, .thai]
        }
    }
    
    init(_ n:LocalizedStringKey, _ s:[Numicode]) {
        name = n
        set = s
    }
        
    public func othercodes(_ exclude:Numicode) -> Numicodeset{
        var others :[Numicode] = []
        for i in 0..<set.count {
            let item = set[i]
            if exclude != item {
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
    case birman     = "birman"
    case brahmi     = "brahmi"
    case cister     = "cistercian"
    case devanagari = "devanagarî"
    case farsi      = "farsi"
    case hanzi      = "china"
    case kanji      = "japan"
    case khmer      = "khmer"
    case kor        = "korean"
    case lao        = "lao"
    case maya       = "maya"
   // case quenya     = "quenya"
    case shadok     = "shadok"
    case shadok5    = "shadok5"
    case telugu     = "telugu"
    case thai       = "thai"
    case yiking     = "yiking"
    
    // additif
    case aegypt     = "aegypt"
    case alpha      = "alpha"   // alphabétique grec
    case attic      = "attic"   // acrophonique grec
    case babyash    = "babylonian ash"
    case babydish   = "babylonian dish"
    case babygesh   = "babylonian gesh"
    case cuneiash   = "cunei ash"
    case cuneidish  = "cunei dish"
    case cuneigesh  = "cunei gesh"
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
