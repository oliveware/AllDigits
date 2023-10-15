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
        centaines : ["cent", "deux cents", "trois cents", "quatre cents", "cinq cents", "six cents", "sept cents", "huit cents", "neuf cents"],
        mille :  ("mille",nil),
        grands : [("million","millions"), ("milliard","milliards"),("billion","billions"), ("billiard","billiards"),("trillion","trillions"), ("trilliard","trilliards"), ("quadrillion","quadrillions"), ("quadrilliard","quadrilliards"), ("quintillion","quintillions"), ("quintilliard","quintilliards")]
        //  moins = "moins"
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    // traitement des cas particuliers
    func special(_ mcdu: Groupe.Mcdu) -> Ecriture.Special {
        
        var sp = Ecriture.Special()
        if mcdu.diz > 1 && mcdu.unit == 1 { sp.diz =  ecriture.dizaines[mcdu.diz-2].singulier + "-et" }
        if mcdu.diz == 7 || mcdu.unit == 9 {
            let dizaine = ecriture.dizaines[mcdu.diz-1].singulier
            sp.diz = dizaine + "-" + ecriture.unites[10+mcdu.unit].masculin.singulier
        }
        if mcdu.diz == 8 && mcdu.unit == 0 { sp.diz = "quatre-vingts" }
        return sp
    }
}
