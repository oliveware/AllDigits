//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Srpski: Languedata {
    
    let ecriture:Ecriture
    
    let romanise = Ecriture (
        langue: Langue.Code.srp,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" i "),
        ordizun: true,
        masculin : ["nula", "jedan", "dva", "tri", "četiri", "pet", "šest", "sedam", "osam", "devet", "deset", "jedanaest", "dvanaest","trinaest", "četrnaest", "petnaest", "šesnaest", "sedamnaest", "osamnaest", "devetnaest"],
        feminin : ["nula", "jedna", "dve", "tri", "četiri", "pet", "šest", "sedam", "osam", "devet", "deset", "jedanaest", "dvanaest","trinaest", "četrnaest", "petnaest", "šesnaest", "sedamnaest", "osamnaest", "devetnaest"],
        neutre: ["nula", "jedno", "dva", "tri", "četiri", "pet", "šest", "sedam", "osam", "devet", "deset", "jedanaest", "dvanaest","trinaest", "četrnaest", "petnaest", "šesnaest", "sedamnaest", "osamnaest", "devetnaest"],
        dizaines : ["dvadeset", "trideset", "četrdeset", "pedeset", "šezdeset", "sedamdeset", "osamdeset", "devedeset"],
        // centaines au masculin
        centaines : ["sto", "dvesta", "trista", "četiristo", "petsto", "šeststo", "sedamsto", "osamsto", "devetsto"],
        mille :  ("hiljada",nil),
        classifieurs : [("milion","miliona"), ("milijarda","milijarde")]
    )
    
    let cyrillic = Ecriture (
        langue: Langue.Code.srp,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" и "),
        ordizun: true,
        masculin : ["нула", "један", "двa", "три", "четири", "пет", "шест", "седaм", "осaм", "девет", "десет", "једанaесет", "двaнaесет", "тринаесет", "четирнаесет", "петнаесет", "шестнаесет", "седaмнаесет", "осaмнаесет", "деветнаесет"],
        feminin : ["нула", "једна", "двe", "три", "четири", "пет", "шест", "седaм", "осaм", "девет", "десет", "једанaесет", "двaнaесет", "тринаесет", "четирнаесет", "петнаесет", "шестнаесет", "седaмнаесет", "осaмнаесет", "деветнаесет"],
        neutre: ["нула", "једно", "двa", "три", "четири", "пет", "шест", "седaм", "осaм", "девет", "десет", "једанaесет", "двaнaесет", "тринаесет", "четирнаесет", "петнаесет", "шестнаесет", "седaмнаесет", "осaмнаесет", "деветнаесет"],
        dizaines : ["dvadeset", "trideset", "četrdeset", "pedeset", "šezdeset", "sedamdeset", "osamdeset", "devedeset"],
        // centaines au masculin
        centaines : ["сто","двеста","триста", "четиристотин", "петстотин", "шестстотин", "седемстотин", "осемстотин", "деветстотин"],
        mille :  ("хиљада",nil),
        classifieurs : [("милион","милиона"), ("милијарда","милиарда"), ("билион","билиона")]
    )

    // centaines au féminin
    let femtaines = ["jedna stotina", "dve stotine", "tri stotine", "četiri stotine", "pet stotina", "šest stotina", "sedam stotina", "osam stotina", "devet stotina"]

    let cyrifemtaines = ["један стотина", "двe стотинe", "три стотинe", "четири стотинe", "пет стотина", "шест стотина", "седaм стотина", "осaм стотина", "девет стотина"]
    
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {
        if kind == .native {
            ecriture = cyrillic
        } else {
            ecriture = romanise
        }
    }
    
    // traitement des cas particuliers
    func special(_ groupe: Groupe) -> Ecriture.Special {
        var sp = Ecriture.Special()

        return sp
    }
}
