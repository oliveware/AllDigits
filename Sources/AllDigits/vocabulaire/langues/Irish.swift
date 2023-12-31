//
//  Irish.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Irish: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.irg,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" 's a "),
        ordizun: true,
        masculin : ["neoni", "aon", "dó", "trì", "ceathair", "cúig", "sé", "seacht", "ocht", "naoi","deich","aon déag"," dó dhéag"," trì déag","ceathair déag", "cúig déag", "sé déag", "seacht déag","ocht déag","naoi déag"],
        feminin : [],
        neutre: [],
        dizaines : ["fich", "triocha", "ceathracha", "caoga", "seasca", "seachtó", "ochtó", "nócha"],
        centaines : ["céad", "dó céad", "trì céad", "ceathair céad", "cúig céad", "sé céad", "seacht céad", "ocht céad", "naoi céad"],
        mille : ("míle",nil),
        classifieurs : [("aon milliún","milliún"), ("míle milliún",nil)]
        //  moins = "lúide"
    )
    let groupement = Groupement.partrois
    let greatest = 999 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    // traitement des cas particuliers
    func special(_ groupe: Groupe) -> Ecriture.Special {
        let mcdu = groupe.mcdu
        var sp = Ecriture.Special()
        if mcdu.mil == 2 { sp.mil = "dhà mhile"}
        if mcdu.diz > 1 {
            if mcdu.unit == 1 { sp.unit = "haon" }
        }
        return sp
    }
}
