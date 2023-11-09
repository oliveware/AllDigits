//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Espana: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.sp,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["cero", "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho", "nueve","diez","once","doce","trece","catorce", "quince", "dieciséis", "diecisiete","dieciocho","diecinueve"],
        feminin : [],
        neutre: [],
        dizaines : ["veinte", "treinta", "cuarenta", "cincuenta", "sesenta", "setenta", "ochenta", "noventa"],
        centaines : ["cien", "dos cientos", "tres cientos", "cuatro cientos", "cinco cientos", "seis cientos", "siete cientos", "ocho cientos", "nueve cientos"],
        mille :  ("mil",nil),
        classifieurs : [("un millon","millones"), ("mil millones",nil), ("un billon","billones"), ("mil billones",nil)]
        //moins = "menos"
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    // traitement des cas particuliers
    func special(_ groupe: Groupe) -> Ecriture.Special {
        var sp = Ecriture.Special()
        let mcdu = groupe.mcdu
        if mcdu.diz == 2 {
            if mcdu.unit == 1 { sp.diz = "veintiuno" }
            if mcdu.unit == 3 { sp.diz = "veintidós" }
            if mcdu.unit == 3 { sp.diz = "veintitrés" }
            if mcdu.unit == 6 { sp.diz = "veintiséis" }
        }
        if mcdu.diz > 2 && mcdu.unit > 0 {
            sp.diz = ecriture.dizaines[mcdu.diz-2].singulier + " y"
        }
        return sp
    }
}
