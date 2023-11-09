//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Eesti: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.esto,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["null", "üks", "kaks", "kolm", "neli", "viis", "kuus", "seitse", "kaheksa", "üheksa", "kümme", "ükteist", "kaksteist", "kolmteist", "neliteist", "viisteist", "kuusteist", "seitseteist", "kaheksateist", "üheksateist"],
        feminin : [],
        neutre: [],
        dizaines : ["kakskümmend", "kolmkümmend", "nelikümmend", "viiskümmend", "kuuskümmend", "seitsekümmend", "kaheksakümmend", "üheksakümmend"],
        centaines : ["sada"],
        mille :  ("tuhat",nil),
        classifieurs : [("miljon","miljonit"), ("miljard","miljardit"), ("triljon","triljonit"), ("kvadriljon","kvadriljonit"), ("kvintiljon","kvintiljonit"), ("sextiljon","sextiljonit")]
        //  moins = "miinus"
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    // traitement des cas particuliers
    func special(_ groupe: Groupe) -> Ecriture.Special {
        var sp = Ecriture.Special()

        return sp
    }
}
