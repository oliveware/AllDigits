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
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:" 's a ", sp:" 's a h-"),
        ordizun: false,
        masculin : ["neoni", "aon", "dhà", "trì", "ceithir", "còig", "sia", "seachd", "ochd", "naoi","deich","h-aon deug"," dhà dheug"," trì deug","ceithir deug", "còig deug", "sia deug", "seachd deug","ochd deug","naoi deug"],
        feminin : [],
        neutre: [],
        dizaines : ["fichead", "trithead", "ceathread", "caogad", "seasgad", "seachdad", "ochdad", "naochad"],
        centaines : ["ceud", "dhà ceud", "trì ceud", "ceithir ceud", "còig ceud", "sia ceud", "seachd ceud", "ochd ceud", "naoi ceud"],
        // pluriel uniquement pour dhà mhile
        mille : ("mile",nil),
        grands : [("millean",nil), ("billean",nil)]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
}
