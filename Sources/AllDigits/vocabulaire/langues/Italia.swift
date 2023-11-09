//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Italia: Languedata {
    
    let ecriture = Ecriture (
        langue: Langue.Code.it,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["zero", "uno", "due", "tre", "quattro", "cinque", "sei", "sette", "otto", "nove","dieci","undici","dodici","tredici","quattordici", "quindici", "sedici", "diciassete","diciotto","diciannove"],
        feminin : [],
        neutre: [],
        dizaines : ["venti", "trenta", "quuaranta", "cinquanta", "sessanta", "settanta", "ottanta", "novanta"],
        centaines : ["cento", "due centi", "tre centi", "quattro centi", "cinque centi", "sei centi", "sette centi", "otto centi", "nove centi"],
        mille :  ("mille","mila"),
        classifieurs : [("un milione","milioni"), ("un miliardo","miliardi"), ("un bilione","bilioni"), ("un biliardo","biliardi"), ("un trilione","trilioni"), ("un triliardo","triliardi"), ("un quattrilione","quattrilioni"), ("un quintiliardo","quintiliardi")]
        //  moins = "meno"
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {}
    
    // traitement des cas particuliers
    func special(_ groupe: Groupe) -> Ecriture.Special {
        var sp = Ecriture.Special()
        let mcdu = groupe.mcdu
        if mcdu.diz == 2 {
            if mcdu.unit == 1 { sp.diz = "ventuno" }
            if mcdu.unit == 3 { sp.diz = "ventitré" }
            if mcdu.unit == 8 { sp.diz = "ventotto" }
            } else {
                var dizaine = ecriture.dizaines[mcdu.diz-2].singulier
                if mcdu.unit == 3 { sp.diz = dizaine + "tré" }
                if mcdu.unit == 1 || mcdu.unit == 8 {
                    sp.diz = String(dizaine.remove(at:dizaine.index(before: dizaine.endIndex)))
                }
            }
        return sp
    }
}
