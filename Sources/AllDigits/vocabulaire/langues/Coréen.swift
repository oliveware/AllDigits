//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Hangug: Languedata {
    
    let ecriture:Ecriture
    
    let hanja = Ecriture (
        langue: Langue.Code.kor,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["komé", "il", "i", "sam", "sa", "o", "yuk", "chil", "pal", "gu", "sip"],
        //  paire = "liǎng"  // paire : 两
        feminin : [],
        neutre: [],
        dizaines : [],
        centaines : ["baek"],
        mille : ("cheon",nil),
        classifieurs : [("man",nil), ("eok",nil),("jo",nil), ("gyeong",nil),("hae","")]

        //  moins = "jiân"
    )
    let hangeul = Ecriture (
        langue: Langue.Code.kor,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["〇", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구", "십"],
        //  paire ?
        feminin : [],
        neutre: [],
        dizaines : [],
        centaines : ["백"],
        mille : ("천",nil),
        classifieurs : [("만",nil), ("억",nil),("조",nil), ("경",nil),("해",nil)]
        //   moins = "減"
    )
    let groupement = Groupement.chinois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {
        if kind == .native {
            ecriture = hangeul
        } else {
            ecriture = hanja
        }
    }
    
    // traitement des cas particuliers
    func special(_ groupe: Groupe) -> Ecriture.Special {
        var sp = Ecriture.Special()

        return sp
    }
}
