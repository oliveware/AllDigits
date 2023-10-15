//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Islande: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.isl,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["núll", "einn", "tveir", "þrír", "fjórir", "fimm", "sex", "sjö", "átta", "niu", "tíu", "ellefu", "tólf", " þréttán", "fjórtán", "fimmtán", "sextán", "sautján", "átján", "nitján"],
        feminin : ["núll", "ein", "tvær", "þrjár", "fjórar", "fimm", "sex", "sjö", "átta", "niu", "tíu", "ellefu", "tólf", " þréttán", "fjórtán", "fimmtán", "sextán", "sautján", "átján", "nitján"],
        neutre: ["núll", "eitt", "tvö", "þrjú", "fjögur", "fimm", "sex", "sjö", "átta", "niu", "tíu", "ellefu", "tólf", " þréttán", "fjórtán", "fimmtán", "sextán", "sautján", "átján", "nitján"],
        dizaines : ["tuttugu", "þrjátíu", "fjórutíu", "fimmtíu", "sextíu", "sjötíu", "áttatíu", "níutíu"],
        centaines : ["hundrað", "hundruð"],
        mille :  ("þúsund","tusinde"),
        grands : [("ein miljón","millioner"), ("einn miljarður","milliarder"), ("en biljón","billioner"), ("en biljarður","billiarder")]
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
