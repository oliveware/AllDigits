//
//  File.swift
//  
//
//  Created by Herve Crespel on 19/11/2021.
//

import Foundation

public var multibasemax = 72

struct Classifierset {
    var high: [String] = []
    var low: [String] = []
    var kot: [String] = []   // kind fo thing
    
    init(_ numicode:Numicode = .global) {
        switch numicode {
        case .hanzi:
            high = Toucheset("hanzi_wan").symbols
            low = Toucheset("hanzi_10").symbols
        case .kanji:
            high = Toucheset("kanji_man").symbols
            low = Toucheset("kanji_10").symbols
        case .kor:
            high = Toucheset("hangeul_man").symbols
            low = Toucheset("hangeul_10").symbols
        default:
            high = []
            low = []
            kot = [""]
        }
    }
}

public struct Powers {
    public var group: [String] = []  //["1000","10 000", "100 000"]
    public var digit: [String] = []   //["1","10","100"]
    
    private var power = 1
    
    public init(_ base:Int, _ groupby:Int,_ nb:Int = 3) {
        for _ in 1...groupby {
            digit.append(String(power))
            power *= base
        }
        digit.reverse()
        let groupower = power
        for i in 1...nb {
            group.append(String(power))
            // pour éviter un overflow !
            if i < nb && power < 100000000 {
                power *= groupower
            }
        }
        group.reverse()
        print(digit)
    }
}

struct Glypheset {
    var symbols:[String]
    
    func symbol(_ index:Int) {
        index < symbols.count ? symbols[index] : "?"
    }
    
    // ghost pad
    public init(t:String, n:Int){
        symbols = []
        for _ in 1...n {
            symbols.append(t)
        }
    }
    // jeu pour clavier multibase -- limite 72
    public init(_ base:Int){
        symbols = ["0","1"]
        let globalset = Toucheset("global").symbols
        let kanjiset  = Toucheset("kanji").symbols
        let greekset1       = ["α", "β", "γ", "δ", "ε", "ζ", "η", "θ", "ι", "λ"]
        let greekset2       = ["μ", "ν", "ξ", "π", "ρ", "σ", "τ", "φ", "ψ", "ω"]
        let cyrillicset     = ["б", "д", "ж", "и", "л", "э", "η", "я", "ι", "κ"]
        let newaset1        = ["𑐀", "𑐂", "𑐄", "𑐆", "𑐊", "𑐎", "𑐐", "𑐒", "𑐔", "𑐕"]
        let newaset2        = ["𑐗", "𑐙", "𑐝", "𑐠", "𑐡", "𑐪", "𑐱", "𑐳", "𑐮", "𑑙"]
        
        symbols.append(kanjiset[4])
        for i in 0...9 {
            symbols.append(globalset[i+2])
            symbols.append(greekset1[i])
            symbols.append(globalset[i+12])
            symbols.append(newaset1[i])
            symbols.append(cyrillicset[i])
            symbols.append(greekset2[i])
            symbols.append(newaset2[i])
        }
        symbols.append(kanjiset[6])

       
    }
    
    // Mésopotamie
    let cuneigesh2 = ["", "\u{12415}", "\u{12416}", "\u{12417}", "\u{12418}", "\u{12419}", "\u{1241A}", "\u{1241B}", "\u{1241C}", "\u{1241D}"]// GESH2
    let cuneiash = ["", "\u{12038}", "\u{12400}", "\u{12401}", "\u{12402}", "\u{12403}", "\u{12404}", "\u{12405}", "\u{12406}", "\u{12407}"] // ASH
    let cuneidish = ["", "\u{12470}", "\u{1222B}", "\u{12408}", "\u{12409}", "\u{1240A}", "\u{1240B}", "\u{1240C}", "\u{1240D}", "\u{1240E}"] // DISH

    let cuneigeshu = ["","\u{1241E}","\u{1241F}","\u{12420}","\u{12421}","\u{12422}"] // geshu
    let sumer = ["","\u{1230B}","\u{12399}","\u{1230D}","\u{1240F}","\u{12410}",
                   "\u{12411}","\u{12412}", "\u{12413}","\u{12414}"]
    
    public init(_ name:String = ""){
        
        switch name {
            
    //=============================
            // glyphes pour composer
            // un chiffre babylonien est formé de 1 ou 2 glyphes
            // glyphes unités
            case "cunei1":
                symbols = cuneigesh2
            case "cuneiash":
                symbols = cuneiash
            case "cuneidish":
                symbols = cuneidish
            //glyphes dizaines
            case "cunei10":
                symbols = cuneigeshu
            case "sumer":
                symbols = sumer
            
            // composition chinoise d'un groupe de quatre chiffres .global
            // dizaines, centaines et milliers sont composés de deux glyphes
            // glyphes représentant une puissance de 10 (10, 100 et 1000)
            case "kanji_10":
                symbols = ["", "十", "百", "千"]
            case "hanzi_10":
                symbols = ["", "十", "百", "千"]
            case "hangeul_10":
            symbols = ["", "십", "백", "천"]

            // glyphes des classificateurs de groupes chinois
            // l'index est une puissance de 10 000
            case "kanji_man":
                symbols = ["", "万", "億", "兆", "京", "垓"]
            case "hanzi_wan":
                symbols = ["", "万", "亿", "兆", "京", "垓"]
                // ancien wan 萬
            case "hangeul_man":
                symbols = ["만", "억", "조", "경", "해"]
            
    //=============================
        // glyphes unitaires ( un glyphe représente un chiffre)
            //hiéroglyphes
            case "baton":
                symbols = ["","\u{133FA}","\u{133FB}","\u{133FC}","\u{133FD}","\u{133FE}","\u{133FF}","\u{13400}","\u{13401}","\u{13402}"]
            case "anse":
                symbols = ["","\u{13386}","\u{13387}","\u{13388}","\u{13389}","\u{1338A}","\u{1338B}","\u{1338C}","\u{1338D}","\u{1338E}"]
            case "corde":
                symbols = ["","\u{13362}","\u{13363}","\u{13364}","\u{13365}","\u{13366}","\u{13367}","\u{13368}","\u{13369}","\u{1336A}"]
            case "lotus":       // 1000
                symbols = ["","\u{131BC}","\u{131BD}","\u{131BE}","\u{131BF}","\u{131C0}","\u{131C1}","\u{131C2}","\u{131C3}","\u{131C4}"]
            case "index":          // 10 000
                symbols = ["","\u{130AD}","\u{130AE}","\u{130AF}","\u{130B0}","\u{130B1}","\u{130B2}","\u{130B3}","\u{130B4}","\u{130B5}"]
            case "rond": // remplace le tétard qui n'existe pas dans les hiéroglyphes unicode
                symbols = ["","\u{130C9}","\u{130CA}","\u{130CB}","\u{130CC}","\u{130CD}","\u{130CE}","\u{130CF}","\u{130D0}","\u{130D1}"]
            case "dieu":
                symbols = ["","\u{13068}","\u{13068}"+"\u{13068}","\u{13068}"+"\u{13068}"+"\u{13068}"]
            
            // lettres-chiffres de la Grèce antique
            case "grec1":
                symbols = ["","\u{03B1}","\u{03B2}","\u{03B3}","\u{03B4}","\u{03B5}","\u{03DD}","\u{03B6}","\u{03B7}","\u{03B8}"]
            case "grec10":
                symbols = ["","\u{03B9}","\u{03BA}","\u{03BB}","\u{03BC}","\u{03BD}","\u{03BE}","\u{03BF}","\u{03C0}","\u{03DF}"]
            case "grec100":
                symbols = ["","\u{03C1}","\u{03C2}","\u{03C3}","\u{03C4}","\u{03C5}","\u{03C6}","\u{03C7}","\u{03C8}","\u{03E1}"]
            case "grec1000":
                symbols = ["","\u{0375}\u{03B1}","\u{0375}\u{03B2}","\u{0375}\u{03B3}","\u{0375}\u{03B4}","\u{0375}\u{03B5}","\u{0375}\u{03DB}","\u{0375}\u{03B6}","\u{0375}\u{03B7}","\u{0375}\u{03B8}"]
            
            //chiffres romains
            case "roman1":
                symbols = ["","I","II","III","IV","V","VI","VII","VIII","IX"]
            case "roman10":
                symbols = ["","X","XX","XXX","XL","L","LX","LXX","LXXX","XC"]
            case "roman100":
                symbols = ["","C","CC","CCC","CD","D","DC","DCC","DCCC","CM"]
            case "roman1000":
                symbols = ["","M","MM","MMM","M\u{2181}","\u{2181}","\u{2181}M","\u{2181}MM","\u{2181}MMM","M\u{2182}"]
            case "roman10000":
                // u{2187}, le glyphe unicode pour 50 000 est inopérant. Il est remplacé ici par le D encadré 1F133
                // u{2188}, le glyphe unicode pour 100 000 est inopérant. Il est remplacé ici par le M encadré 1F13C
                symbols = ["","\u{2182}","\u{2182}\u{2182}","\u{2182}\u{2182}\u{2182}","\u{2182}\u{1F133}","\u{1F133}","\u{1F133}\u{2182}","\u{1F133}\u{2182}\u{2182}","\u{1F133}\u{2182}\u{2182}\u{2182}","\u{2182}\u{1F13C}"]
            case "roman100000":
            // unique chiffre romain 100000
            // u{2188}, le glyphe unicode pour 100 000 est inopérant. Il est remplacé ici par le M encadré 1F13C
            symbols = ["","\u{1F13C}","\u{1F13C}\u{1F13C}","\u{1F13C}\u{1F13C}\u{1F13C}","","","","","",""]
            
            // satire shadok
            case "shadok":
                symbols = ["Ga","Bu","Zo","Meu"]
            case "shadok5":
            // avec zérobinet
                symbols = ["\u{1F6B0}","Ga","Bu","Zo","Meu"]
            
            // sumérien
            case "sumer60":
                symbols = compose60(cuneigesh2, sumer)
            /*[ "\u{1244A}", "\u{12415}", "\u{12416}", "\u{12417}", "\u{12418}", "\u{12419}", "\u{1241A}", "\u{1241B}", "\u{1241C}", "\u{1241D}", "\u{1230B}",
                    "\u{1230B}"+"\u{12415}", "\u{1230B}"+"\u{12416}", "\u{1230B}"+"\u{12417}", "\u{1230B}"+"\u{12418}", "\u{1230B}"+"\u{12419}", "\u{1230B}"+"\u{1241A}", "\u{1230B}"+"\u{1241B}", "\u{1230B}"+"\u{1241C}", "\u{1230B}"+"\u{1241D}", "\u{12399}",
                    "\u{12399}"+"\u{12415}", "\u{12399}"+"\u{12416}", "\u{12399}"+"\u{12417}", "\u{12399}"+"\u{12418}", "\u{12399}"+"\u{12419}", "\u{12399}"+"\u{1241A}", "\u{12399}"+"\u{1241B}", "\u{12399}"+"\u{1241C}", "\u{12399}"+"\u{1241D}",
                    "\u{1230D}", "\u{1230D}"+"\u{12415}", "\u{1230D}"+"\u{12416}", "\u{1230D}"+"\u{12417}", "\u{1230D}"+"\u{12418}", "\u{1230D}"+"\u{12419}", "\u{1230D}"+"\u{1241A}", "\u{1230D}"+"\u{1241B}", "\u{1230D}"+"\u{1241C}", "\u{1230D}"+"\u{1241D}",
                    "\u{1240F}", "\u{1240F}"+"\u{12415}", "\u{1240F}"+"\u{12416}", "\u{1240F}"+"\u{12417}", "\u{1240F}"+"\u{12418}", "\u{1240F}"+"\u{12419}", "\u{1240F}"+"\u{1241A}", "\u{1240F}"+"\u{1241B}", "\u{1240F}"+"\u{1241C}", "\u{1240F}"+"\u{1241D}",
                    "\u{12410}", "\u{12410}"+"\u{12415}", "\u{12410}"+"\u{12416}", "\u{12410}"+"\u{12417}", "\u{12410}"+"\u{12418}", "\u{12410}"+"\u{12419}", "\u{12410}"+"\u{1241A}", "\u{12410}"+"\u{1241B}", "\u{12410}"+"\u{1241C}", "\u{12410}"+"\u{1241D}" ]*/
            // babylonien
            case "cunei60":
                symbols = compose60(cuneigesh2, cuneigeshu)
            /*[ "\u{1244A}", "\u{12415}", "\u{12416}", "\u{12417}", "\u{12418}", "\u{12419}", "\u{1241A}", "\u{1241B}", "\u{1241C}", "\u{1241D}", "\u{1241E}",
                    "\u{1241E}"+"\u{12415}", "\u{1241E}"+"\u{12416}", "\u{1241E}"+"\u{12417}", "\u{1241E}"+"\u{12418}", "\u{1241E}"+"\u{12419}", "\u{1241E}"+"\u{1241A}", "\u{1241E}"+"\u{1241B}", "\u{1241E}"+"\u{1241C}", "\u{1241E}"+"\u{1241D}", "\u{1241F}",
                    "\u{1241F}"+"\u{12415}", "\u{1241F}"+"\u{12416}", "\u{1241F}"+"\u{12417}", "\u{1241F}"+"\u{12418}", "\u{1241F}"+"\u{12419}", "\u{1241F}"+"\u{1241A}", "\u{1241F}"+"\u{1241B}", "\u{1241F}"+"\u{1241C}", "\u{1241F}"+"\u{1241D}", "\u{12420}",
                    "\u{12420}"+"\u{12415}", "\u{12420}"+"\u{12416}", "\u{12420}"+"\u{12417}", "\u{12420}"+"\u{12418}", "\u{12420}"+"\u{12419}", "\u{12420}"+"\u{1241A}", "\u{12420}"+"\u{1241B}", "\u{12420}"+"\u{1241C}", "\u{12420}"+"\u{1241D}",
                    "\u{12421}", "\u{12421}"+"\u{12415}", "\u{12421}"+"\u{12416}", "\u{12421}"+"\u{12417}", "\u{12421}"+"\u{12418}", "\u{12421}"+"\u{12419}", "\u{12421}"+"\u{1241A}", "\u{12421}"+"\u{1241B}", "\u{12421}"+"\u{1241C}", "\u{12421}"+"\u{1241D}",
                    "\u{12422}", "\u{12422}"+"\u{12415}", "\u{12422}"+"\u{12416}", "\u{12422}"+"\u{12417}", "\u{12422}"+"\u{12418}", "\u{12422}"+"\u{12419}", "\u{12422}"+"\u{1241A}", "\u{12422}"+"\u{1241B}", "\u{12422}"+"\u{1241C}", "\u{12422}"+"\u{1241D}",
                    "\u{12423}", "\u{12423}"+"\u{12415}", "\u{12423}"+"\u{12416}", "\u{12423}"+"\u{12417}", "\u{12423}"+"\u{12418}", "\u{12423}"+"\u{12419}", "\u{12423}"+"\u{1241A}", "\u{12423}"+"\u{1241B}", "\u{12423}"+"\u{1241C}", "\u{12423}"+"\u{1241D}", "\u{12424}", "\u{12424}"+"\u{12415}", "\u{12424}"+"\u{12416}" ]*/
            
            // bibi-binaire base 16
            case "bibi":
                symbols = []
                for i in 0...15 {
                    symbols.append(String(i))
                }
            // précolombien base 20
            case "maya":
                symbols = []
                for i in 0...19 {
                    symbols.append(String(i))
                }
              /* les caractères unicode maya ne fonctionnent pas avec Swift
               symbols = ["\u{1D2E0}", "\u{1D2E1}", "\u{1D2E2}", "\u{1D2E3}", "\u{1D2E4}", "\u{1D2E5}", "\u{1D2E6}", "\u{1D2E7}", "\u{1D2E8}", "\u{1D2E9}", "\u{1D2EA}", "\u{1D2EB}", "\u{1D2EC}", "\u{1D2ED}", "\u{1D2EE}", "\u{1D2EF}", "\u{1D2F0}", "\u{1D2F1}", "\u{1D2F2}", "\u{1D2F3}"]
               */
            // chinois base 64
            case "yiking":
                symbols = []
                for i in 0...63 {
                    symbols.append(String(i))
                }
            
            //  unités
            case "kanji":
                symbols = ["〇", "一", "二", "三", "四", "五", "六", "七", "八", "九"]
            case "hanzi":
                symbols = ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九"]
            case "hangeul":
                symbols = ["〇", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구"]
            
            case "arabe":
                symbols = ["\u{660}", "\u{661}", "\u{662}", "\u{663}", "\u{664}", "\u{665}", "\u{666}", "\u{667}", "\u{668}", "\u{669}"]
            case "farsi":
                symbols = ["۰", "۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹"]
            case "balinese":
                symbols = ["᭐","᭑", "᭒", "᭓", "᭔", "᭕", "᭖", "᭗", "᭘", "᭙"]
            case "khmer":
                symbols = ["០","១", "២", "៣", "៤", "៥", "៦", "៧", "៨", "៩"]
            case "lao":
                symbols = ["໐","໑", "໒", "໓", "໔", "໕", "໖", "໗", "໘", "໙"]
            case "thai":
                symbols = ["๐","๑", "๒", "๓", "๔", "๕", "๖", "๗", "๘", "๙"]
            
            // indien
            case "brahmi":
                symbols = ["\u{11066}", "\u{11067}", "\u{11068}", "\u{11069}", "\u{1106A}", "\u{1106B}", "\u{1106C}", "\u{1106D}", "\u{1106E}", "\u{1106F}"]
            case "devanagari":
                symbols = ["\u{0966}", "\u{0967}", "\u{0968}", "\u{0969}","\u{096A}", "\u{096B}", "\u{096C}", "\u{096D}", "\u{096E}", "\u{096F}"]
                //symbols = ["\u{A8E0}","\u{A8E1}","\u{A8E2}","\u{A8E3}","\u{A8E4}","\u{A8E5}","\u{A8E6}","\u{A8E7}","\u{A8E8}","\u{A8E9}"]
            case "bengali":
                symbols = ["০","১","২","৩","৪","৫","৬","৭","৮","৯"]
            case "birman":
                symbols = ["၀","၁","၂","၃","၄","၅","၆","၇","၈","၉"]
            case "telugu":
                symbols = ["౦","౧","౨","౩","౪","౫","౬","౭","౮","౯"]
            
            
            
            // chiffres décimaux étendus de la numération moderne multibase
            case "global":
                symbols = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
            
            // lettre O pour zéro
            case "alphabet":
                symbols = ["O","A","B","C","D","E","F","G","H","I","J","K","L","M","N","P","Q","R","S","T", "U", "V", "W", "X", "Y", "Z"]
            
            default:
                symbols = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","aA","aB","aC","aD","aE","aF","aG","aH","aI","aJ","aK","aL","aM","aN","aO","aP","aQ","aR","aS","aT","aU","aV","aW","aX","aY","aZ"]
        }
        
        func compose60(_ units:[String], _ tens:[String]) -> [String] {
            var digits = units
            for d in 1...5 {
                for u in 0...9 {
                    digits.append(tens[d] + units[u])
                }
            }
            return digits
        }
    }
}

/*
enum Digitset {
    case decimal
    case nondecimal
    case arab
    case farsi
    case brahmi
    case devanagari
    case roman
    case greek
    case graphic
    case hieroglyph
    case shadok
    case babylon
}*/
