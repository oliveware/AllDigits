//
//  File.swift
//  
//
//  Created by Herve Crespel on 15/06/2023.
//

import Foundation

protocol Symbolset {
    enum Kind
    static func symbols(_ kind:Kind) -> [String]
}

struct Mesopotamie: Symbolset {
    enum Kind {
        case gesh2
        case ash
        case dish
        case geshu
        case sumer
    }
    
    let gesh2 = ["", "\u{12415}", "\u{12416}", "\u{12417}", "\u{12418}", "\u{12419}", "\u{1241A}", "\u{1241B}", "\u{1241C}", "\u{1241D}"]// GESH2
    let ash = ["", "\u{12038}", "\u{12400}", "\u{12401}", "\u{12402}", "\u{12403}", "\u{12404}", "\u{12405}", "\u{12406}", "\u{12407}"] // ASH
    let dish = ["", "\u{12470}", "\u{1222B}", "\u{12408}", "\u{12409}", "\u{1240A}", "\u{1240B}", "\u{1240C}", "\u{1240D}", "\u{1240E}"] // DISH
    
    let geshu = ["","\u{1241E}","\u{1241F}","\u{12420}","\u{12421}","\u{12422}"] // geshu
    let sumer = ["","\u{1230B}","\u{12399}","\u{1230D}","\u{1240F}","\u{12410}",
                 "\u{12411}","\u{12412}", "\u{12413}","\u{12414}"]
    
    static func symbols(_ kind:Kind) -> [String] {
        switch kind {
        //glyphes unités
        case .gesh2:
            return gesh2
        case .ash":
            return ash
        case .dish":
            return dish
            
        //glyphes dizaines
        case .geshu:
            return geshu
        case .sumer:
            return sumer
            
        // double sumérien
        case .sumer60:
            return compose(gesh2, sumer)
            /*[ "\u{1244A}", "\u{12415}", "\u{12416}", "\u{12417}", "\u{12418}", "\u{12419}", "\u{1241A}", "\u{1241B}", "\u{1241C}", "\u{1241D}", "\u{1230B}",
             "\u{1230B}"+"\u{12415}", "\u{1230B}"+"\u{12416}", "\u{1230B}"+"\u{12417}", "\u{1230B}"+"\u{12418}", "\u{1230B}"+"\u{12419}", "\u{1230B}"+"\u{1241A}", "\u{1230B}"+"\u{1241B}", "\u{1230B}"+"\u{1241C}", "\u{1230B}"+"\u{1241D}", "\u{12399}",
             "\u{12399}"+"\u{12415}", "\u{12399}"+"\u{12416}", "\u{12399}"+"\u{12417}", "\u{12399}"+"\u{12418}", "\u{12399}"+"\u{12419}", "\u{12399}"+"\u{1241A}", "\u{12399}"+"\u{1241B}", "\u{12399}"+"\u{1241C}", "\u{12399}"+"\u{1241D}",
             "\u{1230D}", "\u{1230D}"+"\u{12415}", "\u{1230D}"+"\u{12416}", "\u{1230D}"+"\u{12417}", "\u{1230D}"+"\u{12418}", "\u{1230D}"+"\u{12419}", "\u{1230D}"+"\u{1241A}", "\u{1230D}"+"\u{1241B}", "\u{1230D}"+"\u{1241C}", "\u{1230D}"+"\u{1241D}",
             "\u{1240F}", "\u{1240F}"+"\u{12415}", "\u{1240F}"+"\u{12416}", "\u{1240F}"+"\u{12417}", "\u{1240F}"+"\u{12418}", "\u{1240F}"+"\u{12419}", "\u{1240F}"+"\u{1241A}", "\u{1240F}"+"\u{1241B}", "\u{1240F}"+"\u{1241C}", "\u{1240F}"+"\u{1241D}",
             "\u{12410}", "\u{12410}"+"\u{12415}", "\u{12410}"+"\u{12416}", "\u{12410}"+"\u{12417}", "\u{12410}"+"\u{12418}", "\u{12410}"+"\u{12419}", "\u{12410}"+"\u{1241A}", "\u{12410}"+"\u{1241B}", "\u{12410}"+"\u{1241C}", "\u{12410}"+"\u{1241D}" ]*/
            // double babylonien
        case .cunei60:
            return compose(gesh2, geshu)
            /*[ "\u{1244A}", "\u{12415}", "\u{12416}", "\u{12417}", "\u{12418}", "\u{12419}", "\u{1241A}", "\u{1241B}", "\u{1241C}", "\u{1241D}", "\u{1241E}",
             "\u{1241E}"+"\u{12415}", "\u{1241E}"+"\u{12416}", "\u{1241E}"+"\u{12417}", "\u{1241E}"+"\u{12418}", "\u{1241E}"+"\u{12419}", "\u{1241E}"+"\u{1241A}", "\u{1241E}"+"\u{1241B}", "\u{1241E}"+"\u{1241C}", "\u{1241E}"+"\u{1241D}", "\u{1241F}",
             "\u{1241F}"+"\u{12415}", "\u{1241F}"+"\u{12416}", "\u{1241F}"+"\u{12417}", "\u{1241F}"+"\u{12418}", "\u{1241F}"+"\u{12419}", "\u{1241F}"+"\u{1241A}", "\u{1241F}"+"\u{1241B}", "\u{1241F}"+"\u{1241C}", "\u{1241F}"+"\u{1241D}", "\u{12420}",
             "\u{12420}"+"\u{12415}", "\u{12420}"+"\u{12416}", "\u{12420}"+"\u{12417}", "\u{12420}"+"\u{12418}", "\u{12420}"+"\u{12419}", "\u{12420}"+"\u{1241A}", "\u{12420}"+"\u{1241B}", "\u{12420}"+"\u{1241C}", "\u{12420}"+"\u{1241D}",
             "\u{12421}", "\u{12421}"+"\u{12415}", "\u{12421}"+"\u{12416}", "\u{12421}"+"\u{12417}", "\u{12421}"+"\u{12418}", "\u{12421}"+"\u{12419}", "\u{12421}"+"\u{1241A}", "\u{12421}"+"\u{1241B}", "\u{12421}"+"\u{1241C}", "\u{12421}"+"\u{1241D}",
             "\u{12422}", "\u{12422}"+"\u{12415}", "\u{12422}"+"\u{12416}", "\u{12422}"+"\u{12417}", "\u{12422}"+"\u{12418}", "\u{12422}"+"\u{12419}", "\u{12422}"+"\u{1241A}", "\u{12422}"+"\u{1241B}", "\u{12422}"+"\u{1241C}", "\u{12422}"+"\u{1241D}",
             "\u{12423}", "\u{12423}"+"\u{12415}", "\u{12423}"+"\u{12416}", "\u{12423}"+"\u{12417}", "\u{12423}"+"\u{12418}", "\u{12423}"+"\u{12419}", "\u{12423}"+"\u{1241A}", "\u{12423}"+"\u{1241B}", "\u{12423}"+"\u{1241C}", "\u{12423}"+"\u{1241D}", "\u{12424}", "\u{12424}"+"\u{12415}", "\u{12424}"+"\u{12416}" ]*/
        }
    }
    func compose(_ units:[String], _ tens:[String]) -> [String] {
        var digits = units
        for d in 1...5 {
            for u in 0...9 {
                digits.append(tens[d] + units[u])
            }
        }
        return digits
    }
}

struct Chinois : Symbolset {
    enum Kind {
        case kanji
        case hanzi
        case hangeul
        case kanji_10
        case hanzi_10
        case hangeul_10
        case kanji_man
        case hanzi_wan
        case hangeul_man
    }
    //====================
    // Numération chinoise
    //====================
    // composition chinoise d'un groupe de quatre chiffres .global
    // dizaines, centaines et milliers sont composés de deux glyphes
    
    
    static func symbols(_ kind:Kind) -> [String] {
        switch kind {
            
        // glyphes représentant une puissance de 10 (1, 10, 100 et 1000)
        case .kanji_10:
            return ["", "十", "百", "千"]
        case .hanzi_10:
            return ["", "十", "百", "千"]
        case .hangeul_10:
            return ["", "십", "백", "천"]
            
        // glyphes des classificateurs de groupes chinois
        // l'index est une puissance de 10 000
        case .kanji_man:
            return ["", "万", "億", "兆", "京", "垓"]
        case .hanzi_wan:
            return ["", "万", "亿", "兆", "京", "垓"]
            // ancien wan 萬
        case .hangeul_man:
            return ["만", "억", "조", "경", "해"]
            
        // glyphes des unités
        case .kanji:
            return ["〇", "一", "二", "三", "四", "五", "六", "七", "八", "九"]
        case .hanzi:
            return ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九"]
        case .hangeul:
            return ["〇", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구"]
        }
    }
}

struct Hieroglyph : Symbolset {
    enum Kind {
        case baton
        case anse
        case corde
        case lotus
        case index
        case rond
        case dieu
    }
    //=============================
    //  hiéroglyphes égyptiens
    //=============================
    static func symbols(_ kind:Kind) -> [String] {
        switch kind {
            // glyphes des unités
        case .baton:
            return ["","\u{133FA}","\u{133FB}","\u{133FC}","\u{133FD}","\u{133FE}","\u{133FF}","\u{13400}","\u{13401}","\u{13402}"]
            // dizaines
        case .anse:
            return ["","\u{13386}","\u{13387}","\u{13388}","\u{13389}","\u{1338A}","\u{1338B}","\u{1338C}","\u{1338D}","\u{1338E}"]
            // centaines
        case .corde:
            return ["","\u{13362}","\u{13363}","\u{13364}","\u{13365}","\u{13366}","\u{13367}","\u{13368}","\u{13369}","\u{1336A}"]
            // milliers
        case .lotus:
            return ["","\u{131BC}","\u{131BD}","\u{131BE}","\u{131BF}","\u{131C0}","\u{131C1}","\u{131C2}","\u{131C3}","\u{131C4}"]
            // myriades
        case .index:
            return ["","\u{130AD}","\u{130AE}","\u{130AF}","\u{130B0}","\u{130B1}","\u{130B2}","\u{130B3}","\u{130B4}","\u{130B5}"]
            // 100 000
        case .rond: // remplace le tétard qui n'existe pas dans les hiéroglyphes unicode
            return ["","\u{130C9}","\u{130CA}","\u{130CB}","\u{130CC}","\u{130CD}","\u{130CE}","\u{130CF}","\u{130D0}","\u{130D1}"]
            // million
        case.dieu:
            return ["","\u{13068}","\u{13068}"+"\u{13068}","\u{13068}"+"\u{13068}"+"\u{13068}"]
        }
    }
}
struct Grec : Symbolset {
    enum Kind {
        case unit
        case diz
        case cent
        case mil
        case myr
        case centmil
    }
    //=============================
    // lettres-chiffres de la Grèce antique
    //=============================
    static func symbols(_ kind:Kind) -> [String] {
        switch kind {
            // glyphes des unités
        case .unit:
            return ["","\u{03B1}","\u{03B2}","\u{03B3}","\u{03B4}","\u{03B5}","\u{03DD}","\u{03B6}","\u{03B7}","\u{03B8}"]
        case .diz:
            return ["","\u{03B9}","\u{03BA}","\u{03BB}","\u{03BC}","\u{03BD}","\u{03BE}","\u{03BF}","\u{03C0}","\u{03DF}"]
        case .cent:
            return ["","\u{03C1}","\u{03C2}","\u{03C3}","\u{03C4}","\u{03C5}","\u{03C6}","\u{03C7}","\u{03C8}","\u{03E1}"]
        case .mil:
            return ["","\u{0375}\u{03B1}","\u{0375}\u{03B2}","\u{0375}\u{03B3}","\u{0375}\u{03B4}","\u{0375}\u{03B5}","\u{0375}\u{03DB}","\u{0375}\u{03B6}","\u{0375}\u{03B7}","\u{0375}\u{03B8}"]
        }
    }
    
}
struct Romain : Symbolset {
    enum Kind {
        case unit
        case diz
        case cent
        case mil
        case myr
        case centmil
    }
    //=============================
    //chiffres romains
    //=============================
    static func symbols(_ kind:Kind) -> [String] {
        switch kind {
            // glyphes des unités
        case .unit:
            return ["","I","II","III","IV","V","VI","VII","VIII","IX"]
        case .diz:
            return ["","X","XX","XXX","XL","L","LX","LXX","LXXX","XC"]
        case .cent:
            return ["","C","CC","CCC","CD","D","DC","DCC","DCCC","CM"]
        case .mil:
            return ["","M","MM","MMM","M\u{2181}","\u{2181}","\u{2181}M","\u{2181}MM","\u{2181}MMM","M\u{2182}"]
        case .myr:
            // u{2187}, le glyphe unicode pour 50 000 est inopérant. Il est remplacé ici par le D encadré 1F133
            // u{2188}, le glyphe unicode pour 100 000 est inopérant. Il est remplacé ici par le M encadré 1F13C
            return ["","\u{2182}","\u{2182}\u{2182}","\u{2182}\u{2182}\u{2182}","\u{2182}\u{1F133}","\u{1F133}","\u{1F133}\u{2182}","\u{1F133}\u{2182}\u{2182}","\u{1F133}\u{2182}\u{2182}\u{2182}","\u{2182}\u{1F13C}"]
        case .centmil:
            // unique chiffre romain 100000
            // u{2188}, le glyphe unicode pour 100 000 est inopérant. Il est remplacé ici par le M encadré 1F13C
            return ["","\u{1F13C}","\u{1F13C}\u{1F13C}","\u{1F13C}\u{1F13C}\u{1F13C}","","","","","",""]
        }
    }
}
    
struct Shadok : Symbolset {
    enum Kind {
        case base4
        case base5
    }
    //=============================
    // satire shadok
    //=============================
    static func symbols(_ kind:Kind) -> [String] {
        switch kind {
        case .base4:
            return ["Ga","Bu","Zo","Meu"]
        case .base5 :
            // avec zérobinet
            return ["\u{1F6B0}","Ga","Bu","Zo","Meu"]
        }
    }
}
    
struct Graphic : Symbolset {
    enum Kind {
        case bibi
        case maya
        case yiking
        case h64
    }

    static func symbols(_ kind:Kind) -> [String] {
        switch kind {
            // bibi-binaire base 16
        case .bibi:
            return compose(16)
            // précolombien base 20
        case .maya:
            return compose(20)
            /* les caractères unicode maya ne fonctionnent pas avec Swift
             return ["\u{1D2E0}", "\u{1D2E1}", "\u{1D2E2}", "\u{1D2E3}", "\u{1D2E4}", "\u{1D2E5}", "\u{1D2E6}", "\u{1D2E7}", "\u{1D2E8}", "\u{1D2E9}", "\u{1D2EA}", "\u{1D2EB}", "\u{1D2EC}", "\u{1D2ED}", "\u{1D2EE}", "\u{1D2EF}", "\u{1D2F0}", "\u{1D2F1}", "\u{1D2F2}", "\u{1D2F3}"]
             */
            // chinois base 64
        case .yiking, .h64:
            return compose(64)
        }
    }
    func compose(_ base:Int) -> [String] {
        var symbols = []
        for i in 0..<base {
            symbols.append(String(i))
        }
    }
}
    
struct Decimal : Symbolset {
    enum Kind {
        case arab
        case balinese
        case bengali
        case birman
        case brahmi
        case devanagari
        case farsi
        case khmer
        case lao
        case telegu
        case thai
        
        case global
        case alphabet
        case base72
    }

    static func symbols(_ kind:Kind) -> [String] {
        switch kind {
        case .arab:
            return ["\u{660}", "\u{661}", "\u{662}", "\u{663}", "\u{664}", "\u{665}", "\u{666}", "\u{667}", "\u{668}", "\u{669}"]
        case .balinese:
            return ["᭐","᭑", "᭒", "᭓", "᭔", "᭕", "᭖", "᭗", "᭘", "᭙"]
        case .bengali:
            return ["০","১","২","৩","৪","৫","৬","৭","৮","৯"]
        case .birman:
            return ["၀","၁","၂","၃","၄","၅","၆","၇","၈","၉"]
        case .brahmi:
            return ["\u{11066}", "\u{11067}", "\u{11068}", "\u{11069}", "\u{1106A}", "\u{1106B}", "\u{1106C}", "\u{1106D}", "\u{1106E}", "\u{1106F}"]
        case .devanagari:
            return ["\u{0966}", "\u{0967}", "\u{0968}", "\u{0969}","\u{096A}", "\u{096B}", "\u{096C}", "\u{096D}", "\u{096E}", "\u{096F}"]
        case .farsi:
            return ["۰", "۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹"]
        case .khmer:
            return ["០","១", "២", "៣", "៤", "៥", "៦", "៧", "៨", "៩"]
        case .lao:
            return ["໐","໑", "໒", "໓", "໔", "໕", "໖", "໗", "໘", "໙"]
        case .telugu:
            return ["౦","౧","౨","౩","౪","౫","౬","౭","౮","౯"]
        case .thai:
            return ["๐","๑", "๒", "๓", "๔", "๕", "๖", "๗", "๘", "๙"]
            
            // chiffres décimaux étendus de la numération moderne multibase
        case .global:
            return ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
            
            // lettre O pour zéro
        case .alphabet:
            return ["O","A","B","C","D","E","F","G","H","I","J","K","L","M","N","P","Q","R","S","T", "U", "V", "W", "X", "Y", "Z"]
            
        case .base72:
            return ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","aA","aB","aC","aD","aE","aF","aG","aH","aI","aJ","aK","aL","aM","aN","aO","aP","aQ","aR","aS","aT","aU","aV","aW","aX","aY","aZ"]
            
            //return ["\u{A8E0}","\u{A8E1}","\u{A8E2}","\u{A8E3}","\u{A8E4}","\u{A8E5}","\u{A8E6}","\u{A8E7}","\u{A8E8}","\u{A8E9}"]
        }
    }
}
