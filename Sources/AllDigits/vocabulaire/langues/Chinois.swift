//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Chineese: Languedata {

    let ecriture:Ecriture
    
    let pinyin = Ecriture (
        langue: Langue.Code.zh,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:" "),
        ordizun: false,
        masculin : ["ling", "yī", "èr", "sān", "sì", "wǔ", "liù", "qī", "bā", "jiǔ", "shì"],
        //  paire = "liǎng"  // paire : 两
        feminin : [],
        neutre: [],
        dizaines : [],
        centaines : ["bǎi"],
        mille : ("qiān",nil),
        grands : [("wàn",nil), ("yì",nil),("gòu",nil), ("京",nil),("","垓")]

        //  moins = "jiân"
    )
    let hanzi = Ecriture (
        langue: Langue.Code.zh,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:" "),
        ordizun: false,
        masculin : ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十"],
        //  paire ?
        feminin : [],
        neutre: [],
        dizaines : [],
        centaines : ["百"],
        mille : ("千",nil),
        grands : [("万",nil), ("亿",nil),("兆",nil), ("京",nil),("","垓")]
        //   moins = "減"
    )
    let taiwan = Ecriture (
        langue: Langue.Code.zh,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mu:" ", uc:" ", cd:" ", du:" "),
        ordizun: false,
        masculin : ["?", "chit", "ji", "sam", "su", "ngo", "liok", "chhit", "pat", "kiu", "chap"],
        //  paire ?
        feminin : [],
        neutre: [],
        dizaines : [],
        centaines : ["pah"],
        mille : ("千",nil),
        grands : [("万",nil), ("亿",nil),("兆",nil), ("京",nil),("","垓")]
    )
    let groupement = Groupement.chinois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {
        switch kind {
        case .romanise:
            ecriture = pinyin
        case .native:
            ecriture = hanzi
        case .special:
            ecriture = taiwan
        }
    }
}
