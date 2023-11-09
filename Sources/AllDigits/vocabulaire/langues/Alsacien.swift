//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Alsacien: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.als,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:"a"),
        ordizun: false,
        // quand il est suivi d'une dizaine, eins perd son s final (traité par sp:eina)
        masculin : ["null", "eins", "zwei", "drèï", "viar", "femf", "sex", "sewwa", "ååcht", "nîn","zeh","elf","zwelf","drize","viarze", "fùffze", "sæchze", "sewweze","åchtze","ninzeh"],
        feminin : [],
        neutre: [],
        dizaines : ["zwånzig", "drissig", "viarzig", "fùffzig", "sæchzig", "sewwezig", "åchzig", "nînzig"],
        centaines : ["hùnd’rt"],
        mille :  ("toisig",nil),
        classifieurs : [("e Million","Millione"), ("Milliard","Milliarde")]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    // traitement des cas particuliers
    func special(_ groupe: Groupe) -> Ecriture.Special {
        let mcdu = groupe.mcdu
        var sp = Ecriture.Special()
        if mcdu.diz > 2 && mcdu.unit == 1 { sp.unit = "ein" }   // eina
        return sp
    }
}
