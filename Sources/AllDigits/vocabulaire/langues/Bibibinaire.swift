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
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["ho", "ha", "he", "hi", "bo", "ba", "be", "bi", "ko", "ka", "ke", "ki", "do", "da", "de", "di"
                   ],
        feminin : [],
        neutre: [],
        dizaines : [],
        centaines : [],
        mille :  ("",nil),
        classifieurs : [("",nil), ("","")]
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
