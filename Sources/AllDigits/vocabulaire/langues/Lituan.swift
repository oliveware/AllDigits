//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Lituanie: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.litua,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:" "),
        ordizun: false,
        masculin : ["nulis", "vienas", "du", "trys", "keturi", "penki", "šeši", "septyni", "aštuoni", "devyni", "dešimt", "vienuolika", "dvylika","trylika"," keturiolika", "penkiolika", "šešiolika", "septyniolika","aštuoniolika","devyniolika"],
        feminin : ["nulis", "viena", "dvi", "trys", "keturios", "penkios", "šešios", "septynios", "aštunios", "devynios", "dešimt", "vienuolika", "dvylika","trylika"," keturiolika", "penkiolika", "šešiolika", "septyniolika","aštuoniolika","devyniolika"],
        neutre: [],
        dizaines : ["dvidešimt", "trisdešimt", "keturiadešimt", "penkiadešimt", "šešiasdešimt", "septyniadešimt", "astuoniadešimt", "devyniadešimt"],
        centaines : ["šimtas", "du šimtai", "trys šimtai", "keturi šimtai", "penki šimtai", "šeši šimtai", "septyni šimtai", "aštuoni šimtai", "devyni šimtai"],
        mille :  ("tūkstantis","tūkstančiai"),
        grands : [("miljonas","miljonai"), ("miljardas","miljardai"), ("triljonas","triljonai"), ("kvadriljonas","kvadriljonai")]
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
