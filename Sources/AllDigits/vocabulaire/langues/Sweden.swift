//
//  File.swift
//  
//
//  Created by Herve Crespel on 15/10/2023.
//

import Foundation

struct Sweden: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.esto,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:" "),
        ordizun: false,
        masculin : ["noll", "en", "två", "tre", "fyra", "fem", "sex", "sju", "åtta", "nio", "tio", "elva", "tolv", "tretton", "fjorton", "femton", "sexton", "sjutton", "arton", "nitton"],
        feminin : [],
        neutre: [],
        dizaines :  ["tjugo", "trettio", "fyrtio", "femtio", "sextio", "sjuttio", "åttio", "nittio"],
        centaines : ["hundra"],
        mille :  ("tusen",nil),
        grands : [("miljon","miljoner"), ("miljard","miljarder"), ("biljon","biljoner")]
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
