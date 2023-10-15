//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Letton: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.letton,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:" "),
        ordizun: false,
        masculin : ["nulle", "viens", "divi", "trïs", "četri", "pieci", "seši", "septini", "astoni", "devini", "desmit", "vienpadsmit", "divpadsmit","trïspadsmitt"," četrpadsmit", "piecpadsmit", "sešpadsmit", "septinpadsmit","astonpadsmit","devinpadsmit"],
        feminin : ["nulle", "viena", "divas", "trïs", "četras", "piecas", "sešas", "septinas", "astonas", "devinas", "desmit", "vienpadsmit", "divpadsmit","trïspadsmitt"," četrpadsmit", "piecpadsmit", "sešpadsmit", "septinpadsmit","astonpadsmit","devinpadsmit"],
        neutre: [],
        dizaines : ["divdesmit", "trïsdesmit", "četrdesmit", "piecdesmit", "sešdesmit", "septindesmit", "astondesmit", "devindesmit"],
        centaines : ["simts"],
        mille :  ("tūkstoš","tūkstoši"),
        grands : [("miljon","miljoni"), ("miljard","miljardi"), ("triljon","triljoni"), ("kvadriljon","kvadriljoni")]
        //   moins = "mīnus"
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
