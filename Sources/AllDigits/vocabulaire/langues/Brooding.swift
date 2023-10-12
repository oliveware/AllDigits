//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Brooding: Languedata{
    
    let ecriture = Ecriture (
        langue: Langue.Code.bro,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:" "),
        ordizun: false,
        masculin : ["zromed", "wen", "raich", "schlaum", "draugen", "klaut", "khlobed", "sken", "hoon", "saed", "thlad", "feyeed", "mawg", "braled", "graizeeg", "slathlaan"],
        feminin : [],
        neutre: [],
        dizaines : ["fluhn", "raichfluhn", "schlaumfluhn", "draugenfluhn", "klautfluhn", "khlobedfluhn", "skenfluhn", "hoonfluhn", "saedfluhn", "thladfluhn","feyeedfluhn","mawgfluhn","braledfluhn","graizeegfluhn", "slathlaanfluhn"],
        centaines : ["tegen"],
        mille :  ("stooraen",nil),
        grands : [("sezmeg",nil), ("sixhuitera",nil)]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
}
