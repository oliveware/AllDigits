//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Afrikaans: Languedata{
    
    let ecriture = Ecriture (
        langue: Langue.Code.nl,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:"-en-"),
        ordizun: true,
        masculin : ["nul", "een", "twee", "drie", "vier", "vyf", "ses", "sewe", "ag", "nege", "tien", "elf", "twaalf", "dertien", "veertien", "vyftien", "sestien", "sewentien","agtien","negentien"],
        feminin : [],
        neutre: [],
        dizaines : ["twintig", "dertig", "veertig", "vyftig", "sestig", "sewentig", "tagtig", "neëntig"],
        centaines : ["honderd"],
        mille :  ("duisend",nil),
        grands : [("miljoen",nil), ("miljard",""), ("biljoen",nil)]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
}
