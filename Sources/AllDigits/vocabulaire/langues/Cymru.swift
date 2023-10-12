//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Cymru: Languedata{
    
    let ecriture = Ecriture (
        langue: Langue.Code.wag,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" a ", du:" ", sp:" ac "),
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
}
