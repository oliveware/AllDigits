//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Dutch: Languedata{
    
    let ecriture = Ecriture (
        langue: Langue.Code.nl,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:"en", sp:"ën"),
        ordizun: true,
        masculin : ["nul", "één", "twee", "drie", "vier", "vijf", "zes", "zeven", "acht", "negen", "tien", "elf", "twaalf", "dertien", "veertien", "vijftien", "zestien", "zeventien","achttien","negentien"],
        feminin : [],
        neutre: [],
        dizaines : ["twintig", "dertig", "veertig", "vijftig", "zestig", "zeventig", "tachtig", "negentig"],
        centaines : ["honderd"],
        mille :  ("duizend",nil),
        grands : [("een miljoen","miljoens"), ("een miljard","miljards"), ("een biljoen","biljoens"), ("een biljard","biljards")]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
}
