//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Bokmal: Languedata {
    // bokmal
    let ecriture = Ecriture (
        langue: Langue.Code.bok,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["nul", "én", "to", "tre", "fire", "fem", "seks", "sju", "åtte", "ni", "ti", "elleve", "tolv", "tretten", "fjorten", "femten", "seksten", "sytten", "atten", "nitten"],
        feminin : [],
        neutre: [],
        dizaines : ["tjue", "tretti", "førti", "femti", "seksti", "sytti", "åtti", "nitti"],
        centaines : ["hundre"],
        mille :  ("tusen",nil),
        grands : [("million","millioner"), ("milliard","milliarder"), ("billion","billioner"), ("billiard","billiarder")]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    // traitement des cas particuliers
    func special(_ mcdu: Groupe.Mcdu) -> Ecriture.Special {
        var sp = Ecriture.Special()
        if mcdu.cent == 1 { sp.cent = "ett hundre" }
        if mcdu.mil == 1 { sp.mil = "ett tusen og " }
        return sp
    }
}
