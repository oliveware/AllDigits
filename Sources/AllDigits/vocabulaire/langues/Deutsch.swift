//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Deutsch: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.de,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:"und"),
        ordizun: false,
        // quand il est suivi d'une dizaine, eins perd son s final (traité par sp:einund)
        masculin : ["null", "eins", "zwei", "drei", "vier", "fünf", "sechs", "sieben", "acht", "neun","zehn","elf","zwölf","dreizehn","vierzehn", "fünfzehn", "sechzehn", "siebenzehn","achtzehn","neunzehn"],
        feminin : [],
        neutre: [],
        dizaines : ["zwanzig", "dreißig", "vierzig", "fünfzig", "sechzig", "siebzig", "achzig", "neunzig"],
        centaines : ["einhundert","zweihundert", "dreihundert", "vierhundert", "fünfhundert", "sechshundert", "siebenhundert", "achthundert", "neunhundert"],
        mille :  ("eintausend","tausend"),
        grands : [("eine Million","Millionen"), ("eine Milliarde","Milliarden"), ("eine Billion","Billionen"), ("eine Billiarde","Billiarden"), ("eine Trillion","Trillionen"), ("eine Trilliarde","Billiarden")]
        //  moins = "minus"
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    
    // traitement des cas particuliers
    func special(_ mcdu: Groupe.Mcdu) -> Ecriture.Special {
        var sp = Ecriture.Special()
        if mcdu.diz > 2 && mcdu.unit == 1 { sp.unit = "ein"}
        return sp
    }
}
