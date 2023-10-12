//
//  File.swift
//
//
//  Created by Herve Crespel on 19/11/2021.
//

import Foundation

public struct Langue {
    var code: Code
    var romanise: Bool = false
    var special: Bool = false
    
    public enum Code: String, CaseIterable, Identifiable {
        case fr     = "français"
        case el     = "grec"
        case en     = "english"
        case de     = "deutsch"
        case it     = "italia"
        case sp     = "espana"
        case nl     = "nederlands"
        case fl     = "flanders"
        case br     = "breizh"
        case scg    = "scottish"        // gaélique écossais moderne
        case irg    = "irish"           // gaélique irlandais
        case wag    = "wales"           // gallois
        case bibi   = "bibi-binaire"    // breveté pat Boby Lapointe
        case bro    = "brooding"        // hexadécimal en lettres
        case latin  = "latin"
        case bg     = "bulgaren"       // balgarsky
        case letton = "letton"
        case litua  = "lituanien"
        case esto   = "estonien"
        case dan    = "danois"
        case id     = "indonésien"
        case isl    = "islandais"
        case af     = "afrikaans"
        case bok    = "norvégien"       // bokmal
        case ja   = "japonais"
        case ru   = "russe"
        case uk     = "ukrainien"
        case bsq    = "basque"
        case srp    = "srpski"              // serbe
        case pic    = "picard"
        case far    = "persan"
        case ar     = "arabe roman"           // romanisé
        case mapu   = "mapuche"
        case maya   = "maya"
        case turc   = "turc"
        case sue    = "suédois"
        case tif    = "tifinagh"
        case hy     = "arménien"            // hayeren
        case amh    = "amish"           // allemand pensylvanien
        case chol   = "ch'ol"           // maya écrit en ch'ol
        case als    = "alsacien"
        case mal    = "malais"          // indonésien
        case viet   = "vietnamien"
        case pol    = "polski"
        case kor    = "coréen"              // hangeul
        case hnd    = "hindi"
        case rhg    = "rohingya"
        case pt     = "portuguès"
        case zh     = "chinois"
        case np     = "nepali"
        case uni    = "universel" 
        
        public var id : String {self.rawValue}
    }
    
    // mots de Locale.Script
    enum CodeEcriture {
        case adlam
        case arabic
        case arabicNastaliq
        case armenian
        case bangla
        case cherokee
        case cyrillic
        case devanagari
        case ethiopic
        case georgian
        case greek
        case gujarati
        case gurmukhi
        case hanifiRohingya
        case hanSimplified
        case hanTraditional
        case hebrew
        case hiragana
        case japanese
        case kannada
        case katakana
        case khmer
        case korean
        case lao
        case latin
        case malayalam
        case meiteiMayek
        case myanmar
        case odia
        case olChiki
        case sinhala
        case syriac
        case tamil
        case telugu
        case thaana
        case thai
        case tibetan
    }
    public static var all : [Code] = [.af, .als, .amh, .ar, .hy, .bibi, .bok, .br, .bro, .bsq, .zh, .chol, .dan, .de, .en, .esto, .far, .fr, .hnd, .id, .irg, .isl, .it, .ja, .kor, .latin, .letton, .litua, .mal, .mapu, .nl, .np, .pic, .pol, .pt, .rhg, .ru, .scg, .sp, .srp, .sue, .tif, .turc, .viet, .wag ]
    
    public static var parlées : [Code] {
        var ep : [Code] = []
        for i in 0..<all.count {
            let langue = all[i]
            let parle = bcp47[langue] ?? ""
            if parle != "" {
                ep.append(langue)
            }
        }
        return ep
    }
    
    public static var muettes : [Code] {
        var ep : [Code] = []
        for i in 0..<all.count {
            let langue = all[i]
            let parle = bcp47[langue] ?? ""
            if parle == "" {
                ep.append(langue)
            }
        }
        return ep
    }
    
    // écritures acceptées par le text-to-speech
    // https://support.apple.com/en-us/HT206175
    public static var bcp47 : [Langue.Code:String] = [.ar:"ar", .bok:"nb-NO", .de:"de-DE", .el:"el-GR", .en:"en-GB", .fl:"nl-BG", .fr:"fr-FR", .hnd:"hi-IN", .it:"it-IT", .ja:"ja-JP", .kor:"ko-KR", .nl:"nl-NL", .pol:"pl-PL", .pt:"pt-PT", .ru:"ru-RU", .sp:"es-ES", .sue:"sv-SE", .turc:"tr-TR", .zh:"zh"]
    
    public static func dot(_ langue:Code) -> String{
        switch langue {
        case .af, .mal, .fr, .de, .it, .nl, .sp, .latin, .bg, .letton, .litua, .esto, .dan, .isl, .bok, .ru, .bsq, .srp, .pic, .turc, .sue, .als, .pol, .pt :
            return ","
        case .ar :
            return "٫"   // mommayez
        default:
            return "."
        }
    }
    
    static var local:Langue.Code = .fr
    static var universal: Langue.Code = .uni
    static var choices: [Langue.Code] = [.nl, .zh, .en]
    
    static func change(_ index:Int, _ new:Langue.Code) {
        choices[index] = new
    }
    // écriture correspondant à la numération
    static var coscript: Langue.Code?
    
    static var changelang = false
    
    // affiche l'écriture universelle
    static var showuniversal    = true
    // affiche l'écriture locale
    static var showlocal        = true
    // affiche l'écriture correspondant aux chiffres de l'afficheur
    static var showcoscript     = true
    static var showglobal10     = true
    
    // ecritures à choisir
    // exclude optimise en oubliant ce qui a déjà été éliminé
    static func others(_ exclude:[Langue.Code] = []) -> [Langue.Code]{
        var other :[Langue.Code] = []
        var remain = exclude
        remain.append(local)
        remain.append(universal)
        if coscript != nil { remain.append(coscript!) }
        for choice in choices { remain.append(choice) }
        let all = Langue.all
        for i in 0..<all.count {
            let item = all[i]
            var take = true
            var clude :[Langue.Code] = []
            for r in 0..<remain.count{
                if item != remain[r] {
                    clude.append(remain[r])
                } else {
                    take = false
                }
            }
            if take {
                other.append(item)
                remain = clude
            } else {
                take = true
            }
        }
        return other
    }
    
    enum KindOfScript{
        case native
        case romanise
        case special
    }
    static func ecriture(_ code:Code, _ kind:KindOfScript = .native) -> Ecriture {
        switch code {
        case .fr:
            return Litteral<Francais>().ecriture
        case .el:
            return Litteral<Ellenika>(kind).ecriture
        case .en:
            return Litteral<English>().ecriture
        case .de:
            return Litteral<Deutsch>().ecriture
        case .it:
            return Litteral<Italiano>().ecriture
        case .sp:
            return Litteral<Espagnol>().ecriture
        case .nl, .fl:
            return Litteral<Dutch>().ecriture
        case .br:
            return Litteral<Breizh>().ecriture
        case .scg:
            return Litteral<Scottish>().ecriture
        case .irg:
            return Litteral<Irish>().ecriture
        case .wag:
            return Litteral<Cymru>().ecriture
        case .bibi:
            return Litteral<Bibibinaire>().ecriture
        case .bro:
            return Litteral<Brooding>().ecriture
        case .latin:
            return Litteral<Latin>().ecriture
        case .bg:
            return Litteral<Bulgare>(kind).ecriture
        case .letton:
            return Litteral<Letton>().ecriture
        case .litua:
            return Litteral<Lituanie>().ecriture
        case .esto:
            return Litteral<Estonie>().ecriture
        case .dan:
            return Litteral<Danois>().ecriture
        case .isl:
            return Litteral<Islande>().ecriture
        case .af:
            return Litteral<Afrikaans>().ecriture
        case .bok:
            return Litteral<Bokmal>().ecriture
        case .ja:
            return Litteral<Japan>(kind).ecriture
        case .ru:
            return Litteral<Russe>(kind).ecriture
        case .bsq:
            return Litteral<Basque>().ecriture
        case .srp:
            return Litteral<Srpski>(kind).ecriture
        case .pic:
            return Litteral<Picard>().ecriture
        case .far:
            return Litteral<Persan>().ecriture
        case .ar:
            return Litteral<Arabe>().ecriture
        case .mapu:
            return Litteral<Mapuche>().ecriture
        case .maya:
            return Litteral<Maya>().ecriture
        case .turc:
            return Litteral<Turc>().ecriture
        case .sue:
            return Litteral<Suedois>().ecriture
        case .tif:
            return Litteral<Tifinagh>(kind).ecriture
        case .hy:
            return Litteral<Armenien>(kind).ecriture
        case .amh:
            return Litteral<Amish>().ecriture
        case .chol:
            return Litteral<Chol>().ecriture
        case .als:
            return Litteral<Alsacien>().ecriture
        case .mal:
            return Litteral<Bahasa>(.special).ecriture
        case .viet:
            return Litteral<Viet>().ecriture
        case .zh:
            return Litteral<Chineese>(kind).ecriture
        case .pol:
            return Litteral<Polski>().ecriture
        case .kor:
            return Litteral<Hangug>(kind).ecriture
        case .hnd:
            return Litteral<Hindi>(kind).ecriture
        case .rhg:
            return Litteral<Rohingya>(kind).ecriture
        case .pt:
            return Litteral<Portuguais>().ecriture
        case .np:
            return Litteral<Devanagari>(kind).ecriture
        case .id:
            return Litteral<Bahasa>(.native).ecriture
        case .uni:
            return Litteral<Universal>().ecriture
        case .uk:
            return Litteral<Ukraine>(kind).ecriture
        }
    }
    
    
}

