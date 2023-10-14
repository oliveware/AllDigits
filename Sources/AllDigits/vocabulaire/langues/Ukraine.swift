//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Ukraine: Languedata {
    let ecriture: Ecriture
    
    let cyrillic = Ecriture (
        langue: Langue.Code.uk,
        ecriture:.cyrillic,
        liaison: Ecriture.Liaison(mu:", ", uc:" ", cd:" ", du:" "),
        ordizun: false,
        masculin : ["ноль", "один", "двa", "три", "чотири", "п’ять", "шість", "сім", "вісім", "дев’ять", "десять", "одиннадцять", "дванадцять", "тринадцять", "чотирнадцять", "п’ятнадцять", "шістнадцять", "сімнадцять", "вісімнадцять", "дев’ятнадцять"],
        feminin : [],
        neutre: [],
        dizaines : ["двадцять", "тридцять", "сорок", "п'ятдесят", "шiстдесят", "сiмдесят", "вiсiмдесят", "дев'яносто"],
        centaines : ["сто","двiстi","триста", "чотириста", "п'ятсот", "шiстсот", "сiмсот", "вiсiмсот", "дев'ятсот"],
        mille :  ("одна тисяча","тисячi"),
        grands : [("мільйон",nil), ("мільярд",nil)]
    )
    let romanise = Ecriture (
        langue: Langue.Code.uk,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mu:", ", uc:" ", cd:" ", du:" "),
        ordizun: false,
        masculin : ["nol", "odin", "dva", "tri", "čotiri", "p'âtʹ", "šistʹ", "simʹ", "visimʹ", "dev'âtʹ", "desâtʹ", "odinnadcâtʹ", "dvanadcât'", "trinadcât'", "čotirnadcât'", "p'âtnadcâtʹ", "šistnadcâtʹ", "simnadcâtʹ", "visimnadcâtʹ", "dev'âtnadcâtʹ"],
        feminin : [],
        neutre: [],
        dizaines : ["dvadcâtʹ", "tridcât'", "sorok", "p'âtdesât", "šistdesât", "simdesât", "visimdesât", "dev'ânosto"],
        centaines : ["sto", "dvisti", "trista", "čotirista", "p'âtsot", "šistsot", "simsot", "visimsot", "dev'âtsot"],
        mille :  ("odna tisâča","tisâči"),
        grands : [("mil'jon",nil), ("mil'ârd",nil)]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {
        if kind == .native {
            ecriture = cyrillic
            mil59 = "тисяч"
        } else {
            ecriture = romanise
            mil59 = "tisâč"
        }
    }
    let mil59:String
    // traitement des cas particuliers
    func special(_ mcdu: Groupe.Mcdu) -> Ecriture.Special {
        var sp = Ecriture.Special()
        if mcdu.mil > 4 { sp.mil = mil59}
        return sp
    }
}
