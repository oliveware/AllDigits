//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Japan: Languedata {
    
    let ecriture:Ecriture
    let romaji = Ecriture (
        langue: Langue.Code.ja,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["rei", "ichi", "ni", "san", "yon", "go", "roku", "nana", "hachi", "kyū", "jū"],
        feminin : [],
        neutre: [],
        dizaines : [],
        // les centaines 3,6 et 8 ont leur propre mot
        centaines : ["hyaku","ni hyaku", "sanbyaku", "yon hyaku", "go hyaku", "roppyaku","nana hyaku", "happyaku", "kyū hyaku"],
        mille : ("sen",nil),
        classifieurs : [("man",nil), ("oku",nil), ("chō",nil), ("kyō",nil ), ("gai",nil)]
        //  moins = "mainasu"
    )
    let kana = Ecriture (
        langue: Langue.Code.ja,
        ecriture:.japanese,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["れい", "いち", "に", "さん", "よん", "ご", "ろく", "なな", "はち", "きゅう", "じゅう"],
        feminin : [],
        neutre: [],
        dizaines : [],
        // les centaines 3,6 et 8 ont leur propre mot
        centaines : ["ひゃく","にひゃく", "sanbyaku", "よんひゃく", "ごひゃく", "roppyaku","ななひゃく", "happyaku", "きゅうひゃく"],
        mille : ("せん",nil),
        /// trois mille =  "さんぜん "
        /// huit mille = "はっせん "
        classifieurs : [("まん",nil), ("おく",nil), ("ちょう",nil), ("きょう",nil ), ("がい",nil)]
 
        //  moins = "マイナス"
    )
    let groupement = Groupement.chinois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {
        if kind == .native {
            ecriture = kana
        } else {
            ecriture = romaji
        }
    }
    
    // traitement des cas particuliers
    func special(_ groupe: Groupe) -> Ecriture.Special {
        var sp = Ecriture.Special()

        return sp
    }
}
