//
//  File.swift
//  
//
//  Created by Herve Crespel on 15/10/2023.
//

import Foundation

struct Mapuche: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.litua,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:" "),
        ordizun: false,
        masculin : ["sero", "kiñe", "epu", "küla", "meli", "kechu", "kayu", "reqle", "pura", "aylla", "mari", "mari kiñe", "mari epu", "mari küla", "mari meli", "mari kechu", "mari kayu", "mari reqle", "mari pura", "mari aylla"],
        feminin : [],
        neutre: [],
        dizaines : ["epu mari", "küla mari", "meli mari", "kechu mari", "kayu mari", "reqle mari", "pura mari", "aylla mari"],
        centaines : ["pataka", "epu pataka", "küla pataka", "meli pataka", "kechu pataka", "kayu pataka", "reqle pataka", "pura pataka", "aylla pataka"],
        mille :  ("warangka",nil),
        grands : [("miliünka",nil), ("miliarka",nil), ("biliünka",nil), ("biliarka",nil)]
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
