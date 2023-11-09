//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Russe: Languedata {
    let ecriture : Ecriture
    
    let romanise = Ecriture (
        langue: Langue.Code.ru,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" i "),
        ordizun: true,
        masculin : ["nol", "odin", "dve", "tri", "četyre", "pâtʹ", "šestʹ", "semʹ", "vosemʹ", "devâtʹ", "desâtʹ", "odinnadcatʹ", "dvenadcat'", "trinadcat'", "četyrnadcat'", "pâtnadcatʹ", "šestnadcatʹ", "semnadcatʹ", "vosemnadcatʹ", "devâtnadcatʹ"],
        feminin : ["nol", "odna", "dve", "tri", "četyre", "pâtʹ", "šestʹ", "semʹ", "vosemʹ", "devâtʹ", "desâtʹ", "odinnadcatʹ", "dvenadcat'", "trinadcat'", "četyrnadcat'", "pâtnadcatʹ", "šestnadcatʹ", "semnadcatʹ", "vosemnadcatʹ", "devâtnadcatʹ"],
        neutre: [],
        dizaines : ["dvadcatʹ", "tridcat'", "sorok", "pâtʹdesât", "šestʹdesât", "semʹdesât", "vosemʹdesât", "devânosto"],
        centaines : ["sto", "dvesti", "trista", "četyresta", "pâtʹsot", "šestʹsot", "sem'sot", "vosem'sot", "devâtʹsot"],
        mille :  ("tysâča","tysâči"),
        classifieurs : [("million",nil), ("milliard",nil)]
    )
    let cyrillic = Ecriture (
        langue: Langue.Code.ru,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" и "),
        ordizun: true,
        masculin : ["ноль", "один", "двe", "три", "четыре", "пять", "шесть", "семь", "восемь", "девять", "десять", "одиннадцать", "двенадцать", "тринадцать", "четырнадцать", "пятнадцать", "шестнадцать", "семнадцать", "восемнадцать", "девятнадцать"],
        feminin : ["ноль", "одна́", "двe", "три", "четыре", "пять", "шесть", "семь", "восемь", "девять", "десять", "одиннадцать", "двенадцать", "тринадцать", "четырнадцать", "пятнадцать", "шестнадцать", "семнадцать", "восемнадцать", "девятнадцать"],
        neutre: [],
        dizaines : ["двадцать", "тридцать", "сорок", "пятьдесят", "шестьдесят", "семьдесят", "восемьдесят", "девяносто"],
        centaines : ["сто","двести","триста", "четыреста", "пятьсот", "шестьсот", "семьсот", "восемьсот", "девятьсот"],
        mille :  ("тысяча","тысячи"),
        classifieurs : [("миллион",nil), ("миллиард",nil)]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {
        if kind == .native {
            ecriture = cyrillic
        } else {
            ecriture = romanise
        }
    }
    
    // traitement des cas particuliers
    func special(_ groupe: Groupe) -> Ecriture.Special {
        var sp = Ecriture.Special()

        return sp
    }
}
