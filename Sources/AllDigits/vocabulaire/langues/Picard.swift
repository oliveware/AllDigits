//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Picard: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.pic,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:"-", du:"-"),
        ordizun: false,
        masculin : ["zéro", "un", "deus", "tros", "quate", "chinq", "sis", "sièt", "ût", "nué", "dich", "onze", "douze", "treize", "catorze", "qhinze", "seize", "dis-sèt", "dis-ût", "dis-nué"],
        feminin : [],
        neutre: [],
        dizaines : ["vint", "trente", "quarante", "chonquante", "sissante", "sétante", "ûtante", "novante"],
        centaines : ["chint", "deus chint", "tros chint", "quate chint", "chinq chint", "sis chint", "sièt chint", "ût chint", "nué chint"],
        mille :  ("eune milliasse","milliasses"),
        grands : [("eune millionasse","millionasses"), ("eune milliardasse","milliardasses")]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    // traitement des cas particuliers
    func special(_ mcdu: Groupe.Mcdu) -> Ecriture.Special {
        var sp = Ecriture.Special()
        if mcdu.diz > 1 && mcdu.unit == 1 { sp.diz = ecriture.dizaines[mcdu.diz-2].singulier + "-et" }
        return sp
    }
}
