//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Tifinagh: Languedata {
    
    let ecriture : Ecriture
    let tifinagh = Ecriture (
        langue: Langue.Code.tif,
        ecriture:.tifinagh,
        liaison: Ecriture.Liaison(mc:" ⵏ ", cd:"", du:""),
        ordizun: true,
        masculin : ["ⴰⵎⵢⴰ", "ⵢⴰⵏ", "ⵙⵉⵏ", "ⴽⵕⴰⴹ", "ⴽⴽⵓⵣ", "ⵙⵎⵎⵓⵙ", "ⵚⴹⵉⵚ", "ⵙⴰ", "ⵜⴰⵎ", "ⵜⵥⴰ", "ⵎⵔⴰⵡ", "ⵢⴰⵏ ⴷ ⵎⵔⴰⵡ", "ⵙⵉⵏ ⴷ ⵎⵔⴰⵡ", "ⴽⵕⴰⴹ ⴷ ⵎⵔⴰⵡ", "ⴽⴽⵓⵣ ⴷ ⵎⵔⴰⵡ", "ⵙⵎⵎⵓⵙ ⴷ ⵎⵔⴰⵡ", "ⵚⴹⵉⵚ ⴷ ⵎⵔⴰⵡ", "ⵙⴰ ⴷ ⵎⵔⴰⵡ", "ⵜⴰⵎ ⴷ ⵎⵔⴰⵡ", "ⵜⵥⴰ ⴷ ⵎⵔⴰⵡ"],
        feminin : ["ⴰⵎⵢⴰ", "ⵢⴰⵜ", "ⵙⵏⴰⵜ", "ⴽⵕⴰⵟⵜ", "ⴽⴽⵓⵣⵜ", "ⵙⵎⵎⵓⵙⵜ", "ⵚⴹⵉⵚⵜ", "ⵙⴰⵜ", "ⵜⴰⵎⵜ", "ⵜⵥⴰⵜ", "ⵎⵔⴰⵡⵜ", "ⵢⴰⵏ ⴷ ⵎⵔⴰⵡⵜ", "ⵙⵉⵏ ⴷ ⵎⵔⴰⵡⵜ", "ⴽⵕⴰⴹ ⴷ ⵎⵔⴰⵡⵜ", "ⴽⴽⵓⵣ ⴷ ⵎⵔⴰⵡⵜ", "ⵙⵎⵎⵓⵙ ⴷ ⵎⵔⴰⵡⵜ", "ⵚⴹⵉⵚ ⴷ ⵎⵔⴰⵡⵜ", "ⵙⴰ ⴷ ⵎⵔⴰⵡⵜ", "ⵜⴰⵎ ⴷ ⵎⵔⴰⵡⵜ", "ⵜⵥⴰ ⴷ ⵎⵔⴰⵡⵜ"],
        neutre: [],
        dizaines : ["ⵢⴰⵏ ⵉⴷ ⵎⵔⴰⵡ", "ⵙⵉⵏ ⵉⴷ ⵎⵔⴰⵡ", "ⴽⵕⴰⴹ ⵉⴷ ⵎⵔⴰⵡ", "ⴽⴽⵓⵣ ⵉⴷ ⵎⵔⴰⵡ", "ⵙⵎⵎⵓⵙ ⵉⴷ ⵎⵔⴰⵡ", "ⵚⴹⵉⵚ ⵉⴷ ⵎⵔⴰⵡ", "ⵙⴰ ⵉⴷ ⵎⵔⴰⵡ", "ⵜⴰⵎ ⵉⴷ ⵎⵔⴰⵡ", "ⵜⵥⴰ ⵉⴷ ⵎⵔⴰⵡ"],
        // les centaines sont féminines
        centaines : ["ⵜⵉⵎⵉⴹⵉ", "ⵙⵏⴰⵜⵜⵉⵎⴰⴹ", "ⴽⵕⴰⵟⵜⵜⵉⵎⴰⴹ", "ⴽⴽⵓⵣⵜⵜⵉⵎⴰⴹ", "ⵙⵎⵎⵓⵙⵜⵜⵉⵎⴰⴹ", "ⵚⴹⵉⵚⵜⵜⵉⵎⴰⴹ", "ⵙⴰⵜⵜⵉⵎⴰⴹ", "ⵜⴰⵎⵜⵜⵉⵎⴰⴹ", "ⵜⵥⴰⵜⵜⵉⵎⴰⴹ"],
        mille : ("ⵉⴼⴹ","ⴰⴼⴹⴰⵏ"),
        classifieurs : [("ⵎⵍⵢⵓⵏ","ⵎⵍⵢⵓⴰⴹ"), ("ⵎⵍⵢⵔⴰⴹ","ⵎⵍⵢⵔⴰⴹⴰⵏ"), ("ⴱⵍⵢⵓⵏ","ⴱⵍⵢⵓⴰⴹ")]
    )
    // romanisé
    let tamazight = Ecriture (
        langue: Langue.Code.tif,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" n ", cd:"", du:""),
        ordizun: true,
        masculin : ["amya", "yan", "sin", "krad", "kkuz", "smmus", "sdis", "sa", "tam", "tza", "mraw", "yan d mraw", "sin d mraw", "krad d mraw", "kkuz d mraw", "smmous d mraw", "sdis d mraw", "sa d mraw", "tam d mraw", "tza d mraw"],
        feminin : ["amya", "yat", "snat", "kratt", "kkuzt", "smmust", "sdist", "sat", "tamt", "tzat", "mrawt", "yan d mrawt", "sin d mrawt", "krad d mrawt", "kouz d mrawt", "smmous d mrawt", "sdis d mrawt", "sa d mrawt", "tam d mrawt", "tza d mrawt"],
        neutre: [],
        dizaines : ["sin id mraw", "krad id mraw", "kouz id mraw", "smmous id mraw", "sdis id mraw", "sa id mraw", "tam id mraw", "tza id mraw"],
        // les centaines sont féminines
        centaines : ["timidi", "yattimad", "snattimad", "kratttimad", "kkuzttimad", "smmusttimad", "sdisttimad", "sattimad", "tamttimad"],
        mille : ("ifd","afdan"),
        classifieurs : [("mlyun","mlyunad"), ("mlyard","mlyardan"), ("blyun","blyunad")]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {
        if kind == .native {
            ecriture = tifinagh
        } else {
            ecriture = tamazight
        }
    }
    
    // traitement des cas particuliers
    func special(_ groupe: Groupe) -> Ecriture.Special {
        var sp = Ecriture.Special()

        return sp
    }
}
