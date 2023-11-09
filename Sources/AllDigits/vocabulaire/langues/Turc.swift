//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Turc: Languedata {
    
    let code = Langue.Code.el
    let ecriture = Ecriture (
        langue: Langue.Code.turc,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["sıfır", "bir", "iki", "üç", "dört", "beş", "altı", "yedi", "sekiz", "dokuz", "on", "on bir", "on iki", "on üç", "on dört", "on beş", "on altı", "on yedi", "on sekiz", "on dokuz"],
        feminin : [],
        neutre: [],
        dizaines : ["yirmi", "otuz", "kırk", "elli", "altmış", "yetmiş", "seksen", "doksan"],
        centaines : ["yüz"],
        mille :  ("bin",nil),
        classifieurs : [("milyon",nil), ("milyard",""), ("trilyon",nil)]
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
