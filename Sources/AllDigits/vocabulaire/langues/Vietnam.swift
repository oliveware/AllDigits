//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Viet: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.viet,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["số không", "môt", "hai", "ba", "bốn", "năm", "sáu", "bảy", "tám", "chín", "mười"],
        feminin : [],
        neutre: [],
        dizaines : [],
        centaines : ["trăm"],
        mille :  ("ngàn",nil),
        classifieurs : [("triệu",nil), ("tỷ",nil)]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    // traitement des cas particuliers
    func special(_ groupe: Groupe) -> Ecriture.Special {
        var sp = Ecriture.Special()

        return sp
    }
}
