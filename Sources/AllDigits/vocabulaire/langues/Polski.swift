//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Polski: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.pol,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["zero", "jeden", "dwa", "trzy", "cztery", "pięć", "sześć", "siedem", "osiem", "dziewięć", "dziesięć", "jedenaście", "dwanaście", "trzynaście", "czterynaście", "piętnaście", "sześnaście", "siedemnaście", "osiemnaście", "dziewiętnaście"],
        feminin : [],
        neutre: [],
        dizaines : ["dwadzieścia", "trzydzieści", "czterdzieści", "pięćdziesiąt", "sześćdziesiąt", "siedemdziesiąt", "osiemdziesiąt", "dziewięćdziesiąt"],
        centaines : ["sto", "dwieście", "trzysta", "czterysta", "pięćset", "sześćset", "siedemset", "osiemset", "dziewięćset"],
        mille :  ("tysiąc","tysiące"),
        grands : [("milion",nil), ("miliard",""), ("bilion",nil), ("biliard",""), ("trilion",nil), ("tryliard",""), ("kwadrylion",nil), ("kwadryliard","")]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    // traitement des cas particuliers
    func special(_ mcdu: Groupe.Mcdu) -> Ecriture.Special {
        var sp = Ecriture.Special()
        if mcdu.mil > 4 { sp.mil = ecriture.unites[mcdu.mil].masculin.singulier + "tysięcy" }
        return sp
    }
}
