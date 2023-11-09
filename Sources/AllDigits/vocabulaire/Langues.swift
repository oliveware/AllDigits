//
//  File.swift
//
//
//  Created by Herve Crespel on 19/11/2021.
//

import Foundation

public var parle = true

protocol Languedata {

    var ecriture:   Ecriture     { get }
    var groupement: Groupement  { get }
    var greatest:   Int         { get }
    
    init(_ kind:Langue.KindOfScript)
    
  //  mutating func ecrire(_ nombre:[Groupe], _ genre:Genre) -> String
    func special(_ groupe:Groupe) -> Ecriture.Special
}

public struct Langue {
    var langue:Languedata

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
        case ja     = "japonais"
        case ru     = "russe"
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
        
        func chinois() -> Bool {
            [.ja, .kor, .zh].contains(self)
        }
    }
    static var chinois : [Code] = [.ja, .kor, .zh]
    
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
    func ecrire(_ groupes:[Groupe],_ genre:Genre = .m) -> String {
        var result = ""
        for groupe in groupes {
            result += langue.ecriture.ecrit(groupe, genre, langue.special(groupe))
        }
        return result
    }
    init(_ code:Code, _ kind:KindOfScript = .native) {
        switch code {
        case .fr: langue = Francais()
        case .el: langue = Ellinika(kind)
        case .en: langue = English()
        case .de: langue = Deutsch()
        case .it: langue = Italia()
        case .sp: langue = Espana()
        case .nl, .fl: langue = Dutch()
        case .br: langue = Breizh()
        case .scg: langue = Scottish()
        case .irg: langue = Irish()
        case .wag: langue = Cymru()
        case .bibi: langue = Bibibinaire()
        case .bro: langue = Brooding()
        case .latin: langue = Latin()
        case .bg: langue = Bulgare(kind)
        case .letton: langue = Letton()
        case .litua: langue = Portuges()
        case .esto: langue = Eesti()
        case .dan: langue = Dansk()
        case .isl: langue = Islande()
        case .af: langue = Afrikaans()
        case .bok: langue = Bokmal()
        case .ja: langue = Japan(kind)
        case .ru: langue = Russe(kind)
        case .bsq: langue = Basque()
        case .srp: langue = Srpski(kind)
        case .pic: langue = Picard()
   //     case .far: langue = Persan()
        case .ar: langue = Arabe()
   //     case .mapu: langue = Mapuche()
   //     case .maya: langue = Maya()
        case .turc: langue = Turc()
        case .sue: langue = Sweden()
        case .tif: langue = Tifinagh(kind)
        case .hy: langue = Armenien(kind)
        case .amh: langue = Amish()
   //     case .chol: langue = Chol()
        case .als: langue = Alsacien()
        case .mal: langue = Bahasa(.special)
        case .viet: langue = Viet()
        case .zh: langue = Chineese(kind)
        case .pol: langue = Polski()
        case .kor: langue = Hangug(kind)
   //     case .hnd: langue = Hindi(kind)
        case .rhg: langue = Rohingya(kind)
        case .pt: langue = Portuges()
   //     case .np: langue = Devanagari(kind)
        case .id: langue = Bahasa(.native)
        case .uni: langue = Universal()
        case .uk: langue = Ukraine(kind)
        default: langue = Universal()
        }
    }
    
    
}

