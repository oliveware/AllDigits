//
//  Irish.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Irish: Languedata{
    
    let ecriture = Ecriture (
        langue: Langue.Code.irg,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:" 's a ",sp:" 's a haon"),
        ordizun: false,
        masculin : ["neoni", "aon", "dó", "trì", "ceathair", "cúig", "sé", "seacht", "ocht", "naoi","deich","aon déag"," dó dhéag"," trì déag","ceathair déag", "cúig déag", "sé déag", "seacht déag","ocht déag","naoi déag"],
        feminin : [
        ],
        neutre: [],
        dizaines : ["fich", "triocha", "ceathracha", "caoga", "seasca", "seachtó", "ochtó", "nócha"],
        centaines : ["céad", "dó céad", "trì céad", "ceathair céad", "cúig céad", "sé céad", "seacht céad", "ocht céad", "naoi céad"],
        mille : ("míle",nil),
        grands : [("milliún",nil), ("míle milliún",nil)]
        //  moins = "lúide"
    )
    let groupement = Groupement.partrois
    let greatest = 999 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
}
