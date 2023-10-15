//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Dutch: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.nl,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:"n"),
        ordizun: false,
        masculin : ["nul", "één", "twee", "drie", "vier", "vijf", "zes", "zeven", "acht", "negen", "tien", "elf", "twaalf", "dertien", "veertien", "vijftien", "zestien", "zeventien","achttien","negentien"],
        feminin : [],
        neutre: [],
        dizaines : ["twintig", "dertig", "veertig", "vijftig", "zestig", "zeventig", "tachtig", "negentig"],
        centaines : ["honderd", "tweehonderd", "driehonderd", "vierhonderd", "vijfhonderd", "zeshonderd", "zevenhonderd", "achthonderd", "negenhonderd"],
        mille :  ("duizend",nil),
        grands : [("een miljoen","miljoens"), ("een miljard","miljards"), ("een biljoen","biljoens"), ("een biljard","biljards")]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    
    // traitement des cas particuliers
    func special(_ mcdu: Groupe.Mcdu) -> Ecriture.Special {
        var sp = Ecriture.Special()
        if mcdu.diz > 2 {
            let unit = ecriture.unites[mcdu.unit].masculin.singulier
            if mcdu.unit == 2 { sp.unit = unit + "ë"}
            if mcdu.unit > 2 { sp.unit = unit + "e"}
        }
        return sp
    }
}
