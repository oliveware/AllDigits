//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Francais: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.fr,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:"-"),
        ordizun: true,
        masculin : ["zéro", "un", "deux", "trois", "quatre", "cinq", "six", "sept", "huit", "neuf","dix","onze","douze","treize","quatorze", "quinze", "seize", "dix-sept","dix-huit","dix-neuf"],
        feminin : ["zéro", "une", "deux", "trois", "quatre", "cinq", "six", "sept", "huit", "neuf","dix","onze","douze","treize","quatorze", "quinze", "seize", "dix-sept","dix-huit","dix-neuf"],
        neutre: [],
        dizaines : ["vingt", "trente", "quarante", "cinquante", "soixante", "soixante-dix", "quatre-vingt", "quatre-vingt-dix"],
        centaines : ["cent", "deux cent", "trois cent", "quatre cent", "cinq cent", "six cent", "sept cent", "huit cent", "neuf cent"],
        mille :  ("mille","mille"),
        classifieurs : [("un million","millions"), ("un milliard","milliards"),("un billion","billions"), ("un billiard","billiards"),("un trillion","trillions"), ("un trilliard","trilliards"), ("un quadrillion", "quadrillions"), ("un quadrilliard","quadrilliards"), ("un quintillion","quintillions"), ("un quintilliard","quintilliards")]
        //  moins = "moins"
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    // traitement des cas particuliers
    func special(_ groupe: Groupe) -> Ecriture.Special {
        let mcdu = groupe.mcdu
        var sp = Ecriture.Special()
        if mcdu.unit == 1 && groupe.values.count == 1 { sp.unit = ""}
        if mcdu.diz > 1 && mcdu.unit == 1 { sp.diz =  ecriture.dizaines[mcdu.diz-2].singulier + "-et" }
        if mcdu.diz == 7 || mcdu.diz == 9 {
            let dizaine = ecriture.dizaines[mcdu.diz-3].singulier
            sp.diz = dizaine + "-" + ecriture.unites[10+mcdu.unit].masculin.singulier
            sp.unit = ""
        }
        if mcdu.diz == 8 && mcdu.unit == 0 {
            sp.diz = groupe.power == 0 ? "quatre-vingts" : "quatre-vingt"
        }
        if mcdu.diz == 0 && mcdu.unit == 0 && groupe.power == 0 {
            if mcdu.diz > 0 {
                sp.cent = ecriture.centaines[mcdu.cent - 1].singulier + "s"
            }
        }
        return sp
    }
}
