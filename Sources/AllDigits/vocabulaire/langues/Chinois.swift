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
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["ling", "yī", "èr", "sān", "sì", "wǔ", "liù", "qī", "bā", "jiǔ", "shì", "shì yī", "shì èr", "shì sān", "shì sì", "shì wǔ", "shì liù", "shì qī", "shì bā", "shì jiǔ"],
        //  paire = "liǎng"  // paire : 两
        feminin : [],
        neutre: [],
        dizaines : ["èrshì","sānshì", "sìshì", "wǔshì", "liùshì", "qīshì", "bāshì", "jiǔshì"],
        centaines : ["yībǎi", "èrbǎi", "sānbǎi", "sìbǎi", "wǔbǎi", "liùbǎi", "qībǎi", "bābǎi", "jiǔbǎi"],
        mille : ("qiān",nil),
        classifieurs : [("wàn",nil), ("yì",nil),("gòu",nil), ("京",nil),("","垓")]

        //  moins = "jiân"
    )
    let hanzi = Ecriture (
        langue: Langue.Code.zh,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十"],
        //  paire ?
        feminin : [],
        neutre: [],
        dizaines : [],
        centaines : ["百"],
        mille : ("千",nil),
        classifieurs : [("万",nil), ("亿",nil),("兆",nil), ("京",nil),("","垓")]
        //   moins = "減"
    )
    let taiwan = Ecriture (
        langue: Langue.Code.zh,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["?", "chit", "ji", "sam", "su", "ngo", "liok", "chhit", "pat", "kiu", "chap"],
        //  paire ?
        feminin : [],
        neutre: [],
        dizaines : [],
        centaines : ["pah"],
        mille : ("千",nil),
        classifieurs : [("万",nil), ("亿",nil),("兆",nil), ("京",nil),("","垓")]
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
    
    // traitement des cas particuliers
    func special(_ mcdu: Groupe.Mcdu) -> Ecriture.Special {
        var sp = Ecriture.Special()

        return sp
    }
}
