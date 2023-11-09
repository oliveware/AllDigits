//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Portuges: Languedata {
    
    var ecriture = Ecriture (
        langue: Langue.Code.pt,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" e ", du:" e "),
        ordizun: true,
        masculin : ["zero", "um", "dois", "três", "quatro", "cinco", "seis", "sete", "oito", "nove","dez","onze","doze","treze","catorze", "quinze", "dezasseis", "dezzasete","dezoito","dezanove"],
        feminin : [],
        neutre: [],
        dizaines : ["vinte", "trinta", "quarenta", "cinquenta", "sessenta", "setenta", "oitenta", "noventa"],
        centaines : ["cento", "duzentos", "trezentos", "quatro cento", "quinhentos", "seis cento", "sete cento", "oito cento", "nove cent0"],
        mille :  ("mil",nil),
        classifieurs : [("milhão","milhões"), ("mil milhão","mil milhões"), ("bilhão","bilhões"), ("mil bilhão","mil bilhões")]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    
    // traitement des cas particuliers
    func special(_ groupe: Groupe) -> Ecriture.Special {
        let mcdu = groupe.mcdu
        var sp = Ecriture.Special()
        if mcdu.unit == 0 && mcdu.diz == 0 { sp.cent = "cem" }
        return sp
    }
}


