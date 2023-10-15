//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Amish: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.amh,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:"un"),
        ordizun: false,
        // quand il est suivi d'une dizaine, eens perd son s final (traité par sp:eenun)
        masculin : ["null", "eens", "zwee", "drei", "vier", "fimf", "sex", "siwwe", "acht", "nein","zehe","elf","zwelf","dreizeh","vazen", "fuffzeh", "sechzeh", "siwwezeh","achtzeh","neinzeh"],
        feminin : [],
        neutre: [],
        dizaines : ["zwansich", "dreissich", "vazich", "fuffzich", "sechzich", "siwwezich", "achtzich", "neinzich"],
        centaines : ["hunnert", "zwee hunnert", "drei hunnert", "vier hunnert", "fimf hunnert", "sex hunnert", "siwwe hunnert", "acht hunnert", "nein hunnert"],
        mille :  ("dausend",nil),
        grands : [("en millyon","millyon"), ("en Milliard","Milliard")]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    
    // traitement des cas particuliers
    func special(_ mcdu: Groupe.Mcdu) -> Ecriture.Special {
        var sp = Ecriture.Special()
        if mcdu.diz > 2 && mcdu.unit == 1 { sp.unit = "een" }   // eenun
        if mcdu.cent == 1 { sp.cent = "en" }
        if mcdu.cent > 1 && mcdu.diz == 0 { sp.cent = ecriture.centaines[mcdu.cent].singulier + " un"}
        return sp
    }
}
