//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Cymru: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.wag,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:" "),
        ordizun: false,
        masculin : ["sero", "un", "dau", "tri", "pedvar", "pump", "chwech", "saith", "wyth", "naw","deg","undeg un","undeg dau","undeg tri","undeg pedvar", "undeg pump", "undeg chwech", "undeg saith","undeg wyth","undeg naw"],
        feminin : [],
        neutre: [],
        dizaines : ["daudeg", "trideg", "pedwardeg", "pumdeg", "chwedeg", "saithdeg", "wythdeg", "nawdeg"],
        centaines : ["cant", "dau gant", "tri chant", "pedvar cant", "pump cant", "chwech cant", "saith cant", "wyth cant", "naw cant"],
        // pluriel uniquement pour dau vil
        mille :  ("mil",nil),
        grands : [("miliwn","miliynau"), ("biliwn","biliynau")]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    // traitement des cas particuliers
    func special(_ mcdu: Groupe.Mcdu) -> Ecriture.Special {
        var sp = Ecriture.Special()
        if mcdu.mil == 2 { sp.mil = "dau vil"}
        if mcdu.cent > 0 {
            let du = mcdu.unit + 10 * mcdu.diz
            let dizaine = ecriture.dizaines[mcdu.diz].singulier
            if du == 1 { sp.diz = "ac " + dizaine }
            if du > 1 && du < 11 { sp.diz = "a " + dizaine }
        }
        return sp
    }
}
