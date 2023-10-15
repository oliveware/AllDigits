//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Afrikaans: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.af,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:"-en-"),
        ordizun: false,
        masculin : ["nul", "een", "twee", "drie", "vier", "vyf", "ses", "sewe", "ag", "nege", "tien", "elf", "twaalf", "dertien", "veertien", "vyftien", "sestien", "sewentien","agtien","negentien"],
        feminin : [],
        neutre: [],
        dizaines : ["twintig", "dertig", "veertig", "vyftig", "sestig", "sewentig", "tagtig", "neëntig"],
        centaines : ["honderd"],
        mille :  ("duisend",nil),
        grands : [("miljoen",nil), ("miljard",""), ("biljoen",nil)]
        //  moins = "minus"
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
