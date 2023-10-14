//
//  File.swift
//  
//
//  Created by Herve Crespel on 07/10/2023.
//

import Foundation

struct Arabe: Languedata {
    
    let romanise = Ecriture (
        langue: Langue.Code.ar,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["sifr", "wahid", "ithnan", "thalatha", "arba'a", "khamsa", "sitta", "sab'a", "thamaniya", "tis'a",
                    "'ashra", "ahada 'ashar", "ithna 'ashar","thalatha 'ashar", "arba'a 'ashar", "khamsa 'ashar", "sitta 'ashar", "sab'a 'ashar", "thamaniya 'ashar", "tis'a 'ashar"],
        feminin : ["sifr", "wahid", "ithnan", "thalatha", "arba'a", "khamsa", "sitta", "sab'a", "thamaniya", "tis'a",
                   "'asharat", "ahada 'asharat", "ithna 'asharat","thalatha 'asharat", "arba'a 'asharat", "khamsa 'asharat", "sitta 'asharat", "sab'a 'asharat", "thamaniya 'asharat", "tis'a 'asharat"],
        neutre: [],
        dizaines : ["'ishrun", "thalathun", "arba'un", "khamsun", "sittun", "sab'un", "thamanun", "tis'un"],
       /* centaines : ["mi'a", "miayatayn", "thalathimia", "'arbae mia", "khamsumiaya", "situmiaya", "sabeumiaya", "thamanimiaya", "tise miaya"],*/
        centaines : ["mi'a", "ithnan mi'a", "thalatha mi'a", "'arba'a' mi'a", "khamsa mi'a", "sitta mi'a", "sab'a mi'a", "thamaniya mi'a", "tis'a mi'a"],
        mille : ("alf", "alaaf"),
        grands : [("malioun", "malâyîn"), ("maliâr","maliâr")]
    )
    let ecriture:Ecriture
    
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {
        ecriture = romanise
    }
    
    // traitement des cas particuliers
    func special(_ mcdu: Groupe.Mcdu) -> Ecriture.Special {
        var sp = Ecriture.Special()
        if mcdu.mil == 2 { sp.mil = "alfain" }  // forme duelle de mille
        if mcdu.diz > 1 { sp.diz = "wa-" + ecriture.dizaines[mcdu.diz-2].singulier }
        return sp
    }
    
}
