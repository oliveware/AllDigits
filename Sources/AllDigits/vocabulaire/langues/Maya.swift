//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Maya: Languedata {
    let ecriture:Ecriture
    
    let maya = Ecriture (
        langue: Langue.Code.maya,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: false,
        masculin : ["", "hun", "ca", "ox", "can", "ho", "uac", "uuc", "uaxac", "bolon", "lahun", "buluc", "lahca", "ox-lahun", "can-lahun", "ho-lahun", "uac-lahun", "uuc-lahun", "uaxac-lahun", "bolon-lahun"],
        feminin : [],
        neutre: [],
        // vingtaines
        dizaines : ["kal", "ca kal", "ox kal", "can kal", "ho kal", "uac kal", "uuc kal", "uaxac kal", "bolon kal", "lahun kal","buluc kal", "ox-lahun kal", "can-lahun kal", "ho-lahun kal", "uac-lahun kal", "uuc-lahun kal", "uaxac-lahun kal", "bolon-lahun kal"],
        // quatrecentaines
        centaines : ["bak", "ca bak", "ox bak", "can bak", "ho bak", "uac bak", "uuc bak", "uaxac bak", "bolon bak", "lahun bak","buluc bak", "ox-lahun bak", "can-lahun bak", "ho-lahun bak", "uac-lahun bak", "uuc-lahun bak", "uaxac-lahun bak", "bolon-lahun bak"],
        // huitmille
        mille :  ("pic",nil),
        classifieurs : [("calab",nil), ("","")]
    )
    let chol = Ecriture (
        langue: Langue.Code.maya,
        ecriture:.latin,
        
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" i "),
        ordizun: false,
        masculin : ["", "jump'ej", "cha'p'ej", "uxp'ej", "chänp'ej", "jo'p'ej", "wäcp'ej", "wucp'ej", "waxäp'ej", "bolomp'ej", "lujump'ej", "junlujump'ej", "lajchämp'ej", "uxlujump'ej", "chänlujump'ej", "jo'lujump'ej", "wäclujump'ej", "wuclujump'ej", "waxälujump'ej", "bolomlujump'ej"],
        feminin : [],
        neutre: [],
        // vingtaines
        dizaines : ["junk'al", "cha'c'al", "uxc'al", "chänc'al", "jo'c'al", "wäcc'al", "wucc'al", "waxäc'al", "bolomc'al", "lujumc'al", "junlujumc'al", "lajchämc'al", "uxlujumc'al", "chänlujumc'al", "jo'lujumc'al", "wäclujumc'al", "wuclujumc'al", "waxälujumc'al", "bolomlujumc'al"],
        // quatrecentaines
        centaines : ["jumbasc'", "cha'bajc'", "uxbajc'", "chänbajc'", "jo'bajc'", "wäcbajc'", "wucbajc'", "waxäbajc'", "bolombajc'", "lujumbajc'", "junlujumbajc'", "lajchämbajc'", "uxlujumbajc'", "chänlujumbajc'", "jo'lujumbajc'", "wäclujumbajc'", "wuclujumbajc'", "waxälujumbajc'", "bolomlujumbajc'"],
        // huitmille
        mille :  ("pic",nil),
        classifieurs : [("calab",nil), ("","")]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    let  powers = [20, 400, 8000, 160000, 3200000, 64000000, 1280000000, 25600000000]
    
    init(_ kind:Langue.KindOfScript = .native) {
        ecriture = maya
    }
    
    // traitement des cas particuliers
    func special(_ mcdu: Groupe.Mcdu) -> Ecriture.Special {
        var sp = Ecriture.Special()
        // à compléter                  ****
        return sp
    }
    // liaisons ch'ol
    let de = " i "          // soustractif
    let et = " yic’ot "     // additif
    
    // classificateurs ch'ol
    let classifiers = [
        "p'ej",     // unité générique
        "c’al",     // paquet de vingt (cha’c’al, deux vingtaines, ou quarante)
        "bajc’",    // zonte, paquet de quatre cents unités (cha’bajc’, huit cent)
        "pic",      // paquet de huit mille unités (junpic, huit mille)
        
        // classificateurs de genre,
        "lijc",     // morceau de tissu (junlijc, un morceau de tissu)
        "lujt",     // épi de maïs      (junlujt, un épi de maïs)
        "p’al",     // mot              (jump’al, un mot)
        "tyejc",    // arbre            (juntyejc, un arbre)
        "ts’ijt",   // crayon           (junts’ijt, un crayon)
     ]
}
