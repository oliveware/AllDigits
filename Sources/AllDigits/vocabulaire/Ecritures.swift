//
//  File.swift
//  
//
//  Created by Herve Crespel on 08/10/2023.
//

import Foundation

// mots qui nomment les chiffres et qu'une langue assemble pour nommer les nombres
struct Ecriture {
    // ensemble des graphèmes pour écrire les mots
        
    let codelangue: Langue.Code
    let code:Code
    
    enum Code {
        // codes définis par Locale.Script
        case adlam
        case arabic
        case arabicNastaliq
        case armenian
        case bangla
        case cherokee
        case cyrillic
        case devanagari
        case ethiopic
        case georgian
        case greek
        case gujarati
        case gurmukhi
        case hanifiRohingya
        case hanSimplified
        case hanTraditional
        case hebrew
        case hiragana
        case japanese
        case kannada
        case katakana
        case khmer
        case korean
        case lao
        case latin
        case malayalam
        case meiteiMayek
        case myanmar
        case odia
        case olChiki
        case sinhala
        case syriac
        case tamil
        case telugu
        case thaana
        case thai
        case tibetan
        
        // codes inconnus de Locale.Script
        case bibi
        case tifinagh
    }
        
    // les chiffres décimaux de zéro à 19 ou les chiffres d'une base non décimale
    // beaucoup de langues ont un féminin pour les petits nombres
    // tifinagh-tamazight a un féminin de 1 à 19
    // quelques langues ont un neutre.
    let unites:     [NomChiffre]
    //  20 à 90
    let dizaines:    [Mot]
    //  100 à 900
    let centaines:   [Mot]
    let mille:        Mot
    //  puissances supérieures au singulier et pluriel
    let classifiers:  [Mot]

    struct Liaison {
        let mu: String   // millier - unité (- centaine)
        let uc: String   // unité - centaine
        let cd: String   // centaine - dizaine
        let du: String   // dizaine - unité
        init(mu: String, uc: String, cd: String, du: String) {
            self.mu = mu
            self.uc = uc
            self.cd = cd
            self.du = du
        }
    }
    let liaison: Liaison
    
    // ordre dizaine unité
    // true = dizaine séparateur unité (vingt-et-un)
    // false = unité séparateur dizaine (einundzwantzig)
    let ordizun : Bool
        
    init(langue: Langue.Code, ecriture: Code,
         liaison:Liaison, ordizun: Bool,
         masculin: [String], feminin: [String], neutre: [String],
         dizaines: [String], centaines: [String],
         mille: (String,String?), grands: [(String,String?)]
         
        ) {
        codelangue = langue
        code = ecriture
        self.liaison = liaison
        self.ordizun = ordizun
        
        var units :[NomChiffre] = []
        for index in 0..<masculin.count {
            let m:(String,String?) = (masculin[index],nil)
            if feminin != [] {
                let f:(String,String?) = (feminin[index],nil)
                if neutre != [] {
                    let n:(String,String?) = (neutre[index],nil)
                    units.append(NomChiffre([m ,f, n]))
                } else {
                    units.append(NomChiffre([m ,f]))
                }
            } else {
                units.append(NomChiffre([m]))
            }
        }
        unites = units
        self.dizaines = enmots(dizaines)
        self.centaines = enmots(centaines)
        self.mille = Mot(mille)
        
        var classif: [Mot] = []
        for index in 0..<grands.count {
            let m:(String,String?) = (grands[index])
           classif.append(Mot(m))
        }
        classifiers = classif
        
        func enmots(_ strings:[String]) -> [Mot] {
            var mots: [Mot] = []
            for index in 0..<strings.count {
                let m:(String,String?) = (strings[index],nil)
               mots.append(Mot(m))
            }
            return mots
        }
    }

  /*  public func ecrit(_ chiffres:Chiffres, _ genre:Genre = .m) -> String {
         var texte = ""
        if chiffres.values == [] {
            texte = unites[0][genre]
        } else {
            if chiffres.values.count == 1 && chiffres.values[0] == 0 {
                texte = unites[0][genre]
            } else {
                switch groupement {
                case .indien:
                    texte = indien(chiffres, genre)
                case .chinois:
                    texte = chinois(chiffres, genre)
                case .partrois:
                    texte = partrois(chiffres, genre)
                }
            }
        }
        return texte
     }
    
    func indien(_ chiffres:Chiffres, _ genre:Genre = .m) -> String {
        var lettres = ""
        let groupes = chiffres.engroupes(.indien)
        let nbg = groupes.count
        for g in 0..<nbg  {
            if g == nbg - 1 {
                lettres.append(centdizunit(groupes[g],genre) )
            } else {
                lettres.append(dizunit(groupes[g],genre) + groupes[g].classifier(classifiers))
            }
        }
        return lettres
    }
    
    func chinois(_ chiffres:Chiffres, _ genre:Genre = .m) -> String {
        var lettres = ""
        for groupe in chiffres.engroupes(.chinois) {
            lettres.append(mil(groupe,genre) + groupe.classifier(classifiers))
        }
        return lettres
    }
    
    func partrois(_ chiffres:Chiffres, _ genre:Genre = .m) -> String {
        var lettres = ""
        for groupe in chiffres.engroupes(.partrois) {
            lettres.append(centdizunit(groupe,genre) + groupe.classifier(classifiers))
        }
        return lettres
    }*/
    // préparation des cas particuliers
    struct Special {
        var unit: String? = nil
        var diz: String? = nil
        var cent: String? = nil
        var mil: String? = nil
    }
    
    // chaque langue fournit les cas particuliers, qui dépendent de values
    func ecrit(_ groupe:Groupe,_ genre:Genre = .m, _ special:Special) -> String {
        let values = groupe.values
        let classifier = groupe.classifier(classifiers)
        switch values.count {
        case 1:
            return unite(values[0], special, genre) + classifier
        case 2:
            return dizunit(values[0],values[1], special, genre) + classifier
        case 3:
            return centdizunit(values[0],values[1],values[2], special, genre) + classifier
        case 4:
            return mil(values[0],values[1],values[2],values[3], special, genre) + classifier
        default:
            return "?\(classifier)?"
        }
    }
    
    // unit est inférieur à la base
    func unite(_ index:Int ,_ special:Special, _ genre: Genre) -> String {
        if index < unites.count {
            if special.unit != nil {
                return special.unit!
            } else {
                let unites = unites
                if index < unites.count {
                    return index == 0 ? "" : unites[index][genre]
                } else {
                    return "!0"
                }
            }
        } else {
            return "u?"
        }
    }
    func dizunit(_ diz:Int, _ unit:Int,_ special:Special,  _ genre: Genre) -> String {
        if unit < unites.count && diz < dizaines.count {
            switch diz {
            case 0:
                return unites[unit][genre]
            case 1:
                return unites[unit + 10][genre]
            default:
                let dizaine = special.diz != nil ? special.diz! : dizaines[diz-2][true]
                switch unit {
                case 0:
                    return dizaine
                default:
                    var lien = liaison.du
                    if ordizun {
                        return dizaine + lien + unite(unit, special, genre)
                    } else {
                        return unite(unit, special,genre) + lien + dizaine
                    }
                }
            }
        } else {
            return "du?"
        }
        
    }
    func centdizunit(_ cent:Int,_ diz:Int, _ unit:Int,_ special:Special, _ genre:Genre) -> String {
        let centaine = special.cent != nil ? special.cent! : centaines[cent-1].singulier
        let dizu = diz == 0 && unit == 0 ? "" : dizunit(diz, unit, special, genre)
            switch cent {
            case 0:
                return dizu
            case 1:
                return centaine + liaison.cd + dizu
            default:
                return unites[cent][.m] + liaison.uc + centaine + liaison.cd + dizu
            }
    }
    
    
    func mil(_ mil:Int, _ cent:Int,_ diz:Int, _ unit:Int,_ special:Special, _ genre:Genre)->String{
        let mille = special.mil != nil ? special.mil! : mille[mil>1]
        switch mil {
        case 0:
            return cent == 0 && diz == 0 && unit == 0 ? "" : centdizunit(cent, diz, unit, special, genre)
        case 1:
            return mille + liaison.mu + centdizunit(cent, diz, unit, special, genre)
        default:
            return mille + liaison.mu + centdizunit(cent, diz, unit, special, genre)
        }
    }
    
}

enum Genre : String {
    case f = "féminin"
    case m = "masculin"
    case n = "neutre"
}

struct Mot {
    let genre : Genre
    let singulier:String
    let pluriel:String?

    init(_ sp: (String,String?), _ g:Genre = .m) {
        singulier = sp.0
        pluriel = sp.1
        genre = g
    }
    
    subscript(_ plu:Bool = false) -> String {
        return plu == true ? pluriel ?? singulier : singulier
    }
}

// dans certaines langues, le nom d'un chiffre peut être à la fois masculin, féminin ou neutre
// en fonction de ce qu'il compte.
struct NomChiffre {
    let masculin:   Mot
    var feminin:    Mot? = nil
    var neutre:     Mot? = nil
    
    init(_ mot: [(String,String?)] ) {
        masculin = Mot(mot[0], .m)
        if mot.count > 1 {
            feminin = Mot(mot[1], .f)
            if mot.count > 2 {
                neutre = Mot(mot[2], .n)
            }
        }
    }
    
    subscript(_ genre:Genre, _ pluriel:Bool = false) -> String {
        switch genre {
        case .m:
            return masculin[pluriel]
        case .f:
            return feminin != nil ? feminin![pluriel] : masculin[pluriel]
        case .n:
            return neutre != nil ? neutre![pluriel] : masculin[pluriel]
        }
    }
}


