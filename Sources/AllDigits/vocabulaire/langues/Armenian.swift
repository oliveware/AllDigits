//
//  File.swift
//  
//
//  Created by Herve Crespel on 07/10/2023.
//

import Foundation


struct Armenien : Languedata {
    
    let romanise = Ecriture (
        langue: Langue.Code.hy,
        ecriture : .latin,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:" "),
        ordizun : true,
        masculin : ["zro", "mek", "erkow", "erek'", "čors", "hing", "vec'", "yot'", "owt'", "inë", "tas", "tasnmek", "tasnerkow", "tasnerek'", "tasnčors", "tasnhing", "tasnvec'", "tasnyot'", "tasnowt'", "tasninë"],
        feminin : [],
        neutre: [],
        dizaines : ["k'san", "eresown'", "k'arasown", "hisown", "vat'sown", "yot'anasown", "owt'sown", "innsown"],
        centaines : ["haryowr"],
        mille : ("hazar", nil),
        grands: [("milion", nil), ("miliard", nil), ("trilion", nil)]
    )
    let hayeren = Ecriture (
        langue: Langue.Code.hy,
        ecriture:.armenian,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:" "),
        ordizun : true,
        masculin : ["zero", "մեկ", "երկու", "երեք", "չորս", "հինգ", "վեց", "յոթ", "ութ", "ինը", "տաս", "տասնմեկ", "տասներկու ", "տասներեք", "տասնչորս", "տասնհինգ", "տասնվեց", "տասնյոթ", "տասնութ", "տասնինը"],
        feminin : [],
        neutre: [],
        dizaines : ["քսան", "երեսուն", "քառասուն", "հիսուն", "վաթսուն", "յոթանասուն ", "ութսուն", "իննսուն"],
        centaines : ["հարյուր"],
        mille : ("հազար", nil),
        grands: [("միլիոն", nil), ("միլիարդ", nil), ("տրիլիոն", nil)]
    )
    
    let ecriture:Ecriture
    
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {
        
        if kind == .native {
            ecriture = hayeren
        } else {
            ecriture = romanise
        }
    }

}

