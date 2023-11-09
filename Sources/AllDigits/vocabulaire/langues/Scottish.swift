//
//  Scottish.swift
//
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Scottish: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.scg,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" 's a "),
        ordizun: true,
        masculin : ["neoni", "aon", "dhà", "trì", "ceithir", "còig", "sia", "seachd", "ochd", "naoi","deich","h-aon deug"," dhà dheug"," trì deug","ceithir deug", "còig deug", "sia deug", "seachd deug","ochd deug","naoi deug"],
        feminin : [],
        neutre: [],
        dizaines : ["fichead", "trithead", "ceathread", "caogad", "seasgad", "seachdad", "ochdad", "naochad"],
        centaines : ["ceud", "dhà ceud", "trì ceud", "ceithir ceud", "còig ceud", "sia ceud", "seachd ceud", "ochd ceud", "naoi ceud"],
        // pluriel uniquement pour dhà mhile
        mille : ("mile",nil),
        classifieurs : [("millean",nil), ("billean",nil)]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    // traitement des cas particuliers
    func special(_ groupe: Groupe) -> Ecriture.Special {
        let mcdu = groupe.mcdu
        var sp = Ecriture.Special()
        if mcdu.mil == 2 { sp.mil = "dhà mhile"}
        if mcdu.diz > 1 {
            if mcdu.unit == 1 { sp.unit = "h-aon" }
            if mcdu.unit == 8 { sp.unit = "h-ochd" }
        }
        return sp
    }
}
