//
//  File.swift
//  
//
//  Created by Herve Crespel on 11/10/2023.
//

import Foundation

struct Ellinika: Languedata {
    
    let ecriture: Ecriture
    let grec = Ecriture (
        langue: Langue.Code.el,
        ecriture:.latin,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["midén", "éna", "dýo", "tria'", "téssera", "pénte", "éxi", "eptá", "októ", "néos", "déka", "énteka", "dódeka", "dekatria'", "dekatéssera", "dekapénte", "dekaéxi", "dekaeptá", "dekaochtó", "dekaennéa"],
        feminin : [],
        neutre: [],
        dizaines : ["eíkosi", "triánta", "saránta", "penínta", "exínta", "evdomínta", "ogdónta", "enenínta"],
        centaines : ["ekató", "diakósia", "triakósia", "tetrakósia", "pentakósia", "exakósia", "eftakósia", "ochtakósia", "enniakósia"],
        mille :  ("chília",nil),
        classifieurs : [("ekatommýrio","ekatommýria"), ("disekatommýrio","disekatommýria"), ("trisekatommýrio","trisekatommýria")]
    )
    let ellinika = Ecriture (
        langue: Langue.Code.el,
        ecriture:.greek,
        liaison: Ecriture.Liaison(mc:" ", cd:" ", du:" "),
        ordizun: true,
        masculin : ["μηδέν", "ένα", "δύο", "τρία", "τέσσερα", "πέντε", "έξι", "επτά", "οκτώ", "νέος", "δέκα", "έντεκα", "δώδεκα", "δεκατρία", "δεκατέσσερα", "δεκαπέντε", "δεκαέξι", "δεκαεπτά", "δεκαοχτώ", "δεκαεννέα"],
        feminin : [],
        neutre: [],
        dizaines : ["είκοσι", "τριάντα", "σαράντα", "πενήντα", "εξήντα", "εβδομήντα", "ογδόντα", "ενενήντα"],
        centaines : ["εκατό", "διακόσια", "τριακόσια", "τετρακόσια", "πεντακόσια", "εξακόσια", "εφτακόσια", "οχτακόσια", "εννιακόσια"],
        mille :  ("χίλια","χιλιάδες"),
        classifieurs : [("εκατομμύριο","εκατομμύρια"), ("δισεκατομμύριο","δισεκατομμύρια"), ("τρισεκατομμύριο","τρισεκατομμύρια")]
    )
    let groupement = Groupement.partrois
    let greatest = 1000000 * 1000000 * 1000000
    
    init(_ kind:Langue.KindOfScript = .native) {
        ecriture = kind == .native ? ellinika : grec
    }
    
    // traitement des cas particuliers
    func special(_ mcdu: Groupe.Mcdu) -> Ecriture.Special {
        var sp = Ecriture.Special()

        return sp
    }
}
