//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Bahasa: Languedata {
    
    let ecriture: Ecriture
    
    let indonesien = Ecriture (
        langue: Langue.Code.id,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["kosong", "satu", "dua", "tiga", "empat", "lima", "enam", "tujuh", "delapan", "sembilan", "sepuluh"],
        feminin : [],
        neutre: [],
        dizaines : ["dua puluh", "tiga puluh", "empat puluh", "lima puluh", "enam puluh", "tujuh puluh", "delapan puluh", "sembilan puluh"],
        centaines : ["seratus", "dua ratus", "tiga ratus", "empat ratus", "lima ratus", "enam ratus", "tujuh ratus", "delapan ratus", "sembilan ratus"],
        mille : ("seribu","ribu"),
        classifieurs : [("sejuta","juta"), ("semilyar","milyar")]
    )
    let malais = Ecriture (
        langue: Langue.Code.mal,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["sifar", "satu", "dua", "tiga", "empat", "lima", "enam", "tujuh", "lapan", "sembilan", "sepuluh", "sebelas", "dua belas", "tiga belas", "empat belas", "lima belas", "enam belas", "tujuh belas", "lapan belas", "sembilan belas"],
        feminin : [],
        neutre: [],
        dizaines : ["dua puluh", "tiga puluh", "empat puluh", "lima puluh", "enam puluh", "tujuh puluh", "lapan puluh", "sembilan puluh"],
        centaines : ["seratus", "dua ratus", "tiga ratus", "empat ratus", "lima ratus", "enam ratus", "tujuh ratus", "lapan ratus", "sembilan ratus"],
        mille : ("seribu","ribu"),
        classifieurs : [("sejuta","juta"), ("semilyar","milyar")]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {
        if kind == .native {
            ecriture = indonesien
        } else {
            ecriture = malais
        }
    }
    
    // traitement des cas particuliers
    func special(_ groupe: Groupe) -> Ecriture.Special {
        var sp = Ecriture.Special()

        return sp
    }
}
