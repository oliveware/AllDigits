//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Bulgare : Languedata {
    
    let romanise = Ecriture (
        langue: Langue.Code.bg,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:" i "),
        ordizun: false,
        masculin : ["nula", "edin", "dva", "tri", "chetiri", "pet", "shest", "sedem", "osem", "devet", "deset", "edinadeset", "dvanadeset","trinadeset","chetirinadeset", "petnadeset", "shestnadeset", "sedemnadeset","osemnadeset","devetnadeset" ],
        // un et deux ont un féminin
        feminin : ["nula", "edno", "dve", "tri", "chetiri", "pet", "shest", "sedem", "osem", "devet", "deset", "edinadeset", "dvanadeset","trinadeset","chetirinadeset", "petnadeset", "shestnadeset", "sedemnadeset","osemnadeset","devetnadeset"],
        neutre: [],
        dizaines : ["dvadeset", "trideset", "chetirideset", "petdeset", "shestdeset", "sedemdeset", "osemdeset", "devetdeset"],
        centaines : ["sto", "dvesta", "trista", "chetiristotin", "petstotin", "sheststotin", "sedenstotin", "osemstotin", "devetstotin"],
        mille : ("hilyada","hilyadi"),
        grands : [("milion","milliona"), ("miliard","miliarda")]
    )
     let cyrillic = Ecriture (
        langue: Langue.Code.bg,
        ecriture:.cyrillic,
         liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:" и "),
         ordizun: false,
         masculin : ["нула", "еднн", "двa", "три", "четири", "пет", "шест", "седем", "осем", "девет", "десет", "еднонадесет", "двенадесет", "тринадесет", "четиринадесет", "петнадесет", "шестнадесет", "седемнадесет", "осемнадесет", "деветнадесет"],
         // un et deux ont un féminin
         feminin : ["нула", "едио", "двe", "три", "четири", "пет", "шест", "седем", "осем", "девет", "десет", "еднонадесет", "двенадесет", "тринадесет", "четиринадесет", "петнадесет", "шестнадесет", "седемнадесет", "осемнадесет", "деветнадесет"],
         neutre: [],
         dizaines : ["двадесет", "тридесет", "четиридесет", "петдесет", "шестдесет", "седемдесет", "осемдесет", "деветдесет"],
         centaines : ["сто","двеста","триста", "четиристотин", "петстотин", "шестстотин", "седемстотин", "осемстотин", "деветстотин"],
         mille : ("хиляда","хиляди"),
         grands : [("милион","милиона"), ("милиард","милиарда")]
         //     moins = "минус"
     )
    
    let ecriture:Ecriture
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {
        if kind == .native {
            ecriture = cyrillic
        } else {
            ecriture = romanise
        }
    }
    
    // traitement des cas particuliers
    func special(_ mcdu: Groupe.Mcdu) -> Ecriture.Special {
        var sp = Ecriture.Special()

        return sp
    }
}
