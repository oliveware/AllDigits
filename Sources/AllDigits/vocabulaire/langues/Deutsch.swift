//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Deutsch: Languedata{
    
    let ecriture = Ecriture (
        langue: Langue.Code.de,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:"und", sp:"einund"),
        ordizun: true,
        // quand il est suivi d'une dizaine, eins perd son s final (traité par sp:einund)
        masculin : ["null", "eins", "zwei", "drei", "vier", "fünf", "sechs", "sieben", "acht", "neun","zehn","elf","zwölf","dreizehn","vierzehn", "fünfzehn", "sechzehn", "siebenzehn","achtzehn","neunzehn"],
        feminin : [],
        neutre: [],
        dizaines : ["zwanzig", "dreißig", "vierzig", "fünfzig", "sechzig", "siebzig", "achzig", "neunzig"],
        centaines : ["ein hundert","zwei hundert", "drei hundert", "vier hundert", "fünf hundert", "sechs hundert", "sieben hundert", "acht hundert", "neun hundert"],
        mille :  ("ein tausend","tausend"),
        grands : [("eine Million","Millionen"), ("eine Milliarde","Milliarden"), ("eine Billion","Billionen"), ("eine Billiarde","Billiarden"), ("eine Trillion","Trillionen"), ("eine Trilliarde","Billiarden")]
        //  moins = "minus"
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
}
