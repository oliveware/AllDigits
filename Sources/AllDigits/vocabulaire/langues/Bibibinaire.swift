//
// Bibibinaire.swift
//
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation
struct Bibibinaire : Languedata {

    let ecriture = Ecriture (
        langue: Langue.Code.bibi,
        ecriture:.bibi,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:" "),
        ordizun: false,
        masculin : ["ho", "ha", "he", "hi", "bo", "ba", "be", "bi", "ko", "ka", "ke", "ki", "do", "da", "de", "di"
                   ],
        feminin : [
        ],
        neutre: [],
        dizaines : [],
        centaines : [],
        mille :  ("",nil),
        grands : [("",nil), ("","")]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
}
