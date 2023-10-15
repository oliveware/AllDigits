//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Farsi: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.far,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" o "),
        ordizun: true,
        masculin : ["sefr", "yek", "do", "se", "chahâr", "panj", "shesh", "haft", "hasht", "noh", "dah", "yâzdah", "davâzdah","sizdah","chahârdah", "poonzdah", "shoonzdah", "hifdah","hijdah","noozdah"],
        feminin : [],
        neutre: [],
        dizaines : ["bist", "si", "chehel", "panjâh", "shast", "haftâd", "hashtâd", "navad"],
        centaines : ["sad", "devist", "sisad", "chahârsad", "pansad", "sheshsad", "heftsad", "heshtsad", "nehsad"],
        mille :  ("hezâr",nil),
        grands : [("meyeleyon",nil), ("meyeleyâr",nil)]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    // traitement des cas particuliers
    func special(_ mcdu: Groupe.Mcdu) -> Ecriture.Special {
        var sp = Ecriture.Special()

        return sp
    }
}
