//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Basque: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.bsq,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:", ", cd:" eta ", du:" "),
        ordizun: true,
        masculin : ["zero", "bat", "bi", "hiru", "lau", "bost", "sei", "zazpi", "zortzi", "bederatzi","hamar","hamaika","hamabi","hamahiru","hamalau", "hamabost", "hamasei", "hamazazpi","hemezortzi","hemeretzi"],
        feminin : [],
        neutre: [],
        dizaines : ["hogei", "hogeita hamar", "berrogei", "berrogeita hamar", "hirurogei", "hirurogeita hamar", "laurogei", "laurogeita hamar"],
        centaines : ["ehun","berrehun", "hirurehun", "lauehun", "bostehun", "seiehun", "zazpiehun", "zortziehun", "bederatziehun"],
        mille : ("mila",nil),
        classifieurs : [("milioi",nil), ("miliar","")]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    // traitement des cas particuliers
    func special(_ groupe: Groupe) -> Ecriture.Special {
        var sp = Ecriture.Special()

        return sp
    }
}
