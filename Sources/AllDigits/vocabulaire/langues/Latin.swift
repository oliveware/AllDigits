//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Latin: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.latin,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["nulla", "unus", "duo", "tres", "quattuor", "quinque", "sex", "septem", "octo", "novem", "decem", "undecim", "duodecim", "tredecim", "quattuordecim", "quindecim", "sedecim", "septendecim", "duodeviginti", "undeviginti"],
        feminin : [],
        neutre: [],
        dizaines : ["viginti", "triginta", "quadraginta", "quinquaginta", "sexaginta", "septuaginta", "octoginta", "nonaginta"],
        centaines : ["centum", "duocenti", "tricenti", "quadrigenti", "quingenti", "sescenti", "septingenti", "octingenti", "nongenti"],
        mille :  ("mille","milia"),
        classifieurs : [("mille miliarum","milia miliarum"), ("mille miliarum miliarum","milia miliarum miliarum")]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    // traitement des cas particuliers
    func special(_ mcdu: Groupe.Mcdu) -> Ecriture.Special {
        var sp = Ecriture.Special()
        
        if mcdu.diz > 2 {
            let dizaine = ecriture.dizaines[mcdu.diz-1].singulier
            if mcdu.unit == 8 { sp.diz = "duode" ; sp.unit = dizaine }
            if mcdu.unit == 9 {
                sp.diz = "unde"
                if mcdu.diz == 9 {
                    sp.unit = ecriture.centaines[mcdu.cent-1].singulier
                } else {
                    sp.unit = dizaine
                }
            }
        }
        if mcdu.mil == 3 {sp.mil = "tria"}
        return sp
    }
}
