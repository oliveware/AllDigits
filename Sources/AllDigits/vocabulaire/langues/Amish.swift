//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Amish: Languedata{
    
    let ecriture = Ecriture (
        langue: Langue.Code.amh,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:"un", sp:"eenun"),
        ordizun: true,
        // quand il est suivi d'une dizaine, eens perd son s final (traité par sp:eenun)
        masculin : ["null", "eens", "zwee", "drei", "vier", "fimf", "sex", "siwwe", "acht", "nein","zehe","elf","zwelf","dreizeh","vazen", "fuffzeh", "sechzeh", "siwwezeh","achtzeh","neinzeh"],
        feminin : [],
        neutre: [],
        dizaines : ["zwansich", "dreissich", "vazich", "fuffzich", "sechzich", "siwwezich", "achtzich", "neinzich"],
        centaines : ["hunnert"],
        mille :  ("dausend",nil),
        grands : [("en millyon","millyon"), ("en Milliard","Milliard")]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
}
