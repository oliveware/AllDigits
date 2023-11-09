//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Dansk: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.dan,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:"og"),
        ordizun: false,
        masculin : ["null", "en", "to", "tre", "fire", "fem", "seks", "syv", "otte", "ni", "ti", "elleve", "tolv", "tretten", "fjorten", "femten", "seksten", "sytten", "atten", "nitten"],
        feminin : [],
        neutre: [],
        dizaines : ["tyve", "tredive", "fyrre", "halvtreds", "tres", "halvfjerds", "firs", "halvfems"],
        centaines : ["hundred", "to hundrede", "tre hundrede", "fire hundrede", "fem hundrede", "seks hundrede", "syv hundrede", "otte hundrede", "ni hundrede"],
        mille :  ("et tusind","tusinde"),
        classifieurs : [("en million","millioner"), ("en milliard","milliarder"), ("en billion","billioner"), ("en billiard","billiarder")]
        //  moins = "minus"
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    // traitement des cas particuliers
    func special(_ mcdu: Groupe.Mcdu) -> Ecriture.Special {
        var sp = Ecriture.Special()

        return sp
    }
}
