//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct English: Languedata{
    
    let ecriture = Ecriture (
        langue: Langue.Code.en,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" and ", du:"-"),
        ordizun: false,
        masculin : ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine","ten","eleven","twelve","thirteen","fourteen", "fifteen", "sixteen", "seventeen","eighteen","nineteen"],
        feminin : [],
        neutre: [],
        dizaines : ["twenty", "thirty", "fourty", "fifty", "sixty", "seventy", "eighty", "ninety"],
        centaines : ["one hundred", "two hundred", "three hundred", "four hundred", "five hundred", "six hundred", "seven hundred", "eight hundred", "nine hundred"],
        mille :  ("one thousand","thousand"),
        grands : [("one million","millions"), ("one billion","billions")]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
}
