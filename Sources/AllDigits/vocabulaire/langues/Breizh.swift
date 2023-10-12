//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Breizh: Languedata{
    
    let ecriture = Ecriture (
        langue: Langue.Code.br,
        ecriture:.latin,
        // cas particulier la liaison vingt - unité est "warn" (pris en compte par sp)
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:"ha ", sp:"warn "),
        ordizun: true,
        masculin : ["mann", "unan", "daou", "tri", "pevar", "pemp", "c'hwec'h", "seizh", "eizh", "nav","dek","unnek","daouzek","trizek","pevarzek", "pemzek", "c'hwezek", "seitek","triwec'h","naontek"],
        // 2,3 et quatre ont un féminin
        feminin : ["mann", "unan", "div", "teir", "peder", "pemp", "c'hwec'h", "seizh", "eizh", "nav","dek","unnek","daouzek","trizek","pevarzek", "pemzek", "c'hwezek", "seitek","triwec'h","naontek"],
        neutre: [],
        dizaines : ["ugent", "tregont", "daou-ugent", "hanter-kant", "tri-ugent", "dek ha tri-ugent", "pevar-ugent", "dek ha pevar-ugent"],
        centaines : ["kant", "daou c'hant", "tri c'hant", "pevar c'hant", "pemp kant", "c'hwec'h kant", "seizh kant", "eizh kant", "nav c'hant"],
        mille : ("mil","vil"),
        grands : [("ur million","million"), ("ur milliard","milliard")]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
}
