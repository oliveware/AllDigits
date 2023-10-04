//
//  File.swift
//  
//
//  Created by Herve Crespel on 15/06/2023.
//

import Foundation

// chiffres des numérations décimales
struct Dekaval {
    
static let codes : [Numicode] = [.arab, .bali, .bengali, .burmese, .devanagari, .farsi, .gujarati, .gurmukhi, .javanese, .kannada, .khmer, .lao, .maithili, .malayalam, .meitei, .modi, .mongolian, .nagari, .odia, .santali, .sharada, .tamil, .telugu, .thai, .tibetan]

 static let arab = ["\u{660}", "\u{661}", "\u{662}", "\u{663}", "\u{664}", "\u{665}", "\u{666}", "\u{667}", "\u{668}", "\u{669}"]
 static let balinese = ["᭐","᭑", "᭒", "᭓", "᭔", "᭕", "᭖", "᭗", "᭘", "᭙"]
 static let bengali = ["০","১","২","৩","৪","৫","৬","৭","৮","৯"]
 // static let birman = ["၀","၁","၂","၃","၄","၅","၆","၇","၈","၉"]
 static let brahmi = ["\u{11066}", "\u{11067}", "\u{11068}", "\u{11069}", "\u{1106A}", "\u{1106B}", "\u{1106C}", "\u{1106D}", "\u{1106E}", "\u{1106F}"]
 static let burmese = ["၀", "၁", "၂", "၃", "၄", "၅", "၆", "၇", "၈", "၉"]    // birman
 static let devanagari = ["\u{0966}", "\u{0967}", "\u{0968}", "\u{0969}","\u{096A}", "\u{096B}", "\u{096C}", "\u{096D}", "\u{096E}", "\u{096F}"]
 static let farsi = ["۰", "۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹"]      // idem urdu
 static let gujarati = ["૦", "૧", "૨", "૩", "૪", "૫", "૬", "૭", "૮", "૯"]
 static let gurmukhi = ["੦", "੧", "੨", "੩", "੪", "੫", "੬", "੭", "੮", "੯"]
 static let javanese = ["꧐", "꧑", "꧒", "꧓", "꧔", "꧕", "꧖", "꧗", "꧘", "꧙"]
 static let kannada = ["೦", "೧", "೨", "೩", "೪", "೫", "೬", "೭", "೮", "೯"]
 static let khmer = ["០","១", "២", "៣", "៤", "៥", "៦", "៧", "៨", "៩"]
 static let lao = ["໐","໑", "໒", "໓", "໔", "໕", "໖", "໗", "໘", "໙"]
 static let maithili = ["𑓐", "𑓑" , "𑓒" , "𑓓" , "𑓔", "𑓕" , "𑓖" , "𑓗", "𑓘", "𑓙‎"]
 static let malayalam = ["൦", "൧", "൨", "൩", "൪", "൫", "൬", "൭", "൮", "൯"]
 static let meitei = ["꯰", "꯱", "꯲", "꯳", "꯴", "꯵", "꯶", "꯷", "꯸", "꯹"]
 static let modi = ["𑙐" , "𑙑", "𑙒", "𑙓" , "𑙔" , "𑙕", "𑙖", "𑙗", "𑙘", "𑙙"]
 static let mongolian = ["᠐", "᠑", "᠒", "᠓", "᠔", "᠕", "᠖", "᠗", "᠘", "᠙"]
 static let nagari = ["০", "১", "২", "৩", "৪", "৫", "৬", "৭", "৮", "৯"]
 static let odia = ["୦", "୧", "୨", "୩", "୪", "୫", "୬", "୭", "୮", "୯"]
 static let santali = ["᱐", "᱑", "᱒", "᱓", "᱔", "᱕", "᱖", "᱗", "᱘", "᱙"]
 static let sharada = ["𑇐", "𑇑", "𑇒", "𑇓", "𑇔", "𑇕", "𑇖", "𑇗", "𑇘",   "𑇙"]
 static let tamil = ["௦", "௧", "௨", "௩", "௪", "௫", "௬", "௭", "௮", "௯"]
 static let telugu = ["౦","౧","౨","౩","౪","౫","౬","౭","౮","౯"]
 static let thai = ["๐","๑", "๒", "๓", "๔", "๕", "๖", "๗", "๘", "๙"]
 static let tibetan = ["༠", "༡", "༢", "༣", "༤", "༥", "༦", "༧", "༨", "༩"]
 // static let urdu = ["۰", "۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹"]
}

struct Mesopotamie {
 
 static let codes : [Numicode] = [.babyash, .babydish, .babygesh, .sumerash, .sumerdish,.sumergesh]
 
 //glyphes unités
 static let gesh2 = ["", "\u{12415}", "\u{12416}", "\u{12417}", "\u{12418}", "\u{12419}", "\u{1241A}", "\u{1241B}", "\u{1241C}", "\u{1241D}"]// GESH2
 static let ash = ["", "\u{12038}", "\u{12400}", "\u{12401}", "\u{12402}", "\u{12403}", "\u{12404}", "\u{12405}", "\u{12406}", "\u{12407}"] // ASH
 static let dish = ["", "\u{12470}", "\u{1222B}", "\u{12408}", "\u{12409}", "\u{1240A}", "\u{1240B}", "\u{1240C}", "\u{1240D}", "\u{1240E}"] // DISH
 //glyphes dizaines
 static let geshu = ["","\u{1241E}","\u{1241F}","\u{12420}","\u{12421}","\u{12422}"] // geshu
 static let sumer = ["","\u{1230B}","\u{12399}","\u{1230D}","\u{1240F}","\u{12410}",
     "\u{12411}","\u{12412}", "\u{12413}","\u{12414}"]
   
 // les chiffres de la base 60 sont calculés par Numeration
 //static let sumergesh = compose(sumer, gesh2)[0]
 //static let babyash = compose( geshu, ash)[0]
 
// composition des chiffres de la base 60 à partie des unités et dizaines
 
 static func compose(_ tens:[String], _ units:[String]) -> [String] {
  var digits = units
  for d in 1...5 {
   for u in 0...9 {
    digits.append(tens[d] + units[u])
   }
  }
  return digits
 }
 static func symbols(_ numicode:Numicode) -> [String] {
  switch numicode {
  case .babyash:
     return compose(geshu, ash)
  case .babydish:
   return compose(geshu, dish)
  case .babygesh:
   return compose(geshu, gesh2)
  case .ash:
   return ash
  case .dish:
   return dish
  case .gesh2:
   return gesh2
  case .geshu:
   return geshu
  case .sumer:
   return sumer
  case .sumerash:
   return compose(sumer, ash)
  case .sumergesh:
   return compose(sumer, gesh2)
  case .sumerdish:
   return compose(sumer, dish)
  default:
   return []
  }
 }
 static func tens(_ numicode:Numicode) -> [String] {
  switch numicode {
  case .babyash, .babydish, .babygesh:
   return geshu
  case .sumerash, .sumergesh, .sumerdish:
   return sumer
  default:
   return []
  }
 }
 static func units(_ numicode:Numicode) -> [String] {
  switch numicode {
  case .babyash, .sumerash:
   return ash
  case .babydish, .sumerdish:
   return dish
  case .babygesh, .sumergesh:
   return gesh2
  default:
   return []
  }
 }
}

//====================
// Numération chinoise
//====================
struct Chinois {
 
    static let codes : [Numicode] = [.hanzi,.kanji,.kor]
    
// clavier
 // l'index est la valeur du chiffre
 static let kanjiset = ["〇", "一", "二", "三", "四", "五", "六", "七", "八", "九"]
 static let hanziset = ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九"]
 static let hangeulset = ["〇", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구"]
 
// chiffres
 // dizaines, centaines et milliers sont composés de deux glyphes
 static func hanzi(_ maxpower:Int, _ power:Int, _ index:Int) -> String {
  if index == 0 {
   return ""
  } else {
   let classifier = classifier(maxpower - power, hanzi_10, hanzi_wan)
   return hanziset[index] + classifier
  }
 }
 static func kanji(_ maxpower:Int, _ power:Int, _ index:Int) -> String {
  if index == 0 {
   return ""
  } else {
   let classifier = classifier(maxpower - power, kanji_10, kanji_man)
   return kanjiset[index] + classifier
  }
 }
 static func hangeul(_ maxpower:Int, _ power:Int, _ index:Int) -> String {
  if index == 0 {
   return ""
  } else {
   let classifier = classifier(maxpower - power, hangeul_10, hangeul_man)
   return hangeulset[index] + classifier
  }
 }
 
 static func classifier(_ power: Int,_ bas:[String],_ myr:[String]) -> String {
  var classifier = ""
  let low = power % 4
  let high = ( power - low ) / 4
  if low == 0 {
   if high > 0 { classifier = myr[high] }
  } else {
   classifier = bas[low]
  }
  return classifier
 }
 
 // glyphes des puissances de 10 (1, 10, 100 et 1000)
 // l'index est une puissance de 10
 static let kanji_10 = ["", "十", "百", "千"]
 static let hanzi_10 = ["", "十", "百", "千"]
 static let hangeul_10 = ["", "십", "백", "천"]
 
 // glyphes des puissances de myriade
 // l'index est une puissance de 10 000
 static let kanji_man = ["", "万", "億", "兆", "京", "垓"]
 static let hanzi_wan = ["", "万", "亿", "兆", "京", "垓"]
 // ancien wan 萬
 static let hangeul_man = ["", "만", "억", "조", "경", "해"]
}


//=============================
//  hiéroglyphes égyptiens
//=============================
struct Hieroglyph {
 // glyphes des unités
 static let baton = ["","\u{133FA}","\u{133FB}","\u{133FC}","\u{133FD}","\u{133FE}","\u{133FF}","\u{13400}","\u{13401}","\u{13402}"]
  // dizaines
 static let anse = ["","\u{13386}","\u{13387}","\u{13388}","\u{13389}","\u{1338A}","\u{1338B}","\u{1338C}","\u{1338D}","\u{1338E}"]
  // centaines
 static let corde = ["","\u{13362}","\u{13363}","\u{13364}","\u{13365}","\u{13366}","\u{13367}","\u{13368}","\u{13369}","\u{1336A}"]
  // milliers
 static let lotus = ["","\u{131BC}","\u{131BD}","\u{131BE}","\u{131BF}","\u{131C0}","\u{131C1}","\u{131C2}","\u{131C3}","\u{131C4}"]
  // myriades
 static let index = ["","\u{130AD}","\u{130AE}","\u{130AF}","\u{130B0}","\u{130B1}","\u{130B2}","\u{130B3}","\u{130B4}","\u{130B5}"]
  // 100 000 - dizaines de myriades
 static let rond =
  // remplace le tétard qui n'existe pas dans les hiéroglyphes unicode
  ["","\u{130C9}","\u{130CA}","\u{130CB}","\u{130CC}","\u{130CD}","\u{130CE}","\u{130CF}","\u{130D0}","\u{130D1}"]
  // million
 static let dieu = ["","\u{13068}","\u{13068}"+"\u{13068}","\u{13068}"+"\u{13068}"+"\u{13068}"]
  
 static let claviers : [[String]] = [ baton, anse, corde, lotus, index, rond]
  
 static func clavier(_ power:Int) -> [String] {
  let max = claviers.count
  return claviers[power % max]
 }
 
 static func chiffre(_ maxpower:Int, _ power:Int, _ index:Int) -> String {
  return clavier(maxpower - power)[index]
 }
}

//=============================
//  Grèce antique
//=============================

struct Grec {
    
    static let codes : [Numicode] = [.alpha,.attic]
    
// numération acrophonique ou attique
    static let images = ["penta", "dekapenta", "hectopenta", "kilopenta", "myrapenta" ]
    // penta est trop petit, les autres penta ne s'affichent pas => on les remplace par des images
     static let penta = ["\u{10143}","\u{10144}","\u{10145}","\u{10146}","\u{10147}"]
     static let una = ["Ι","Δ","Η","Χ","M"]
 
    static let units = ["","I","II","III","IIII","\u{10143}","\u{10143}I","\u{10143}II","\u{10143}III","\u{10143}IIII"]
 static let tens = ["","Δ","ΔΔ","ΔΔΔ","ΔΔΔΔ","\u{10144}","\u{10144}Δ","\u{10144}ΔΔ","\u{10144}ΔΔΔ","\u{10144}ΔΔΔΔ"]
 static let cents = ["","H","HH","HHH","HHHH","\u{10145}","\u{10145}H","\u{10145}HH","\u{10145}HHH","\u{10145}HHHH"]
 static let mil = ["","X","XX","XXX","XXXX","\u{10146}","\u{10146}X","\u{10146}XX","\u{10146}XXX","\u{10146}XXXX"]
 static let myr = ["","M","MM","MMM","MMMM","\u{10147}","\u{10147}M","\u{10147}MM","\u{10147}MMM","\u{10147}MMMM"]
 
 static let acroclaviers = [units, tens, cents, mil, myr]
 
 static func acrophoniclavier(_ power:Int) -> [String] {
  let max = acroclaviers.count
  return acroclaviers[power % max]
 }
 static func acrochiffre(_ maxpower:Int, _ power:Int, _ index:Int) -> String {
  return acrophoniclavier(maxpower - power)[index]
 }

// lettres-chiffres de la numération alphabétique
 static let kerea = "\u{0374}"
 static let aristerikerea = "\u{0375}"
 
 static func alphachiffre(_ maxpower:Int, _ power:Int, _ index:Int) -> String {
  let prefix = power == 0  && maxpower > 2 ? aristerikerea : ""
  let suffix = power == maxpower ? kerea : ""
  return prefix + alphabeticlavier(maxpower - power)[index] + suffix
 }
 
 static func alphabeticlavier(_ power:Int) -> [String] {
  let max = alphaclaviers.count
    return alphaclaviers[power % max]
 }
 static let alphaclaviers = [alpha, deka, hekto, kilo, myriad, dekamyr]
 
   
 // glyphes des unités
 static let alpha = ["","\u{03B1}","\u{03B2}","\u{03B3}","\u{03B4}","\u{03B5}","\u{03DD}","\u{03B6}","\u{03B7}","\u{03B8}"]
 // glyphes des dizaines
 static let deka = ["","\u{03B9}","\u{03BA}","\u{03BB}","\u{03BC}","\u{03BD}","\u{03BE}","\u{03BF}","\u{03C0}","\u{03DF}"]
 // glyphes des centaines
 static let hekto = ["","\u{03C1}","\u{03C2}","\u{03C3}","\u{03C4}","\u{03C5}","\u{03C6}","\u{03C7}","\u{03C8}","\u{03E1}"]
 // glyphes des milliers
 static let kilo = ["","\u{03B1}","\u{03B2}","\u{03B3}","\u{03B4}","\u{03B5}","\u{03DB}","\u{03B6}","\u{03B7}","\u{03B8}"]
 // glyphes des myriades
 static let myriad = deka
 // glyphes des dizaines de myriades
 static let dekamyr = hekto
}

//=============================
//chiffres romains
//=============================
struct Romain {
 
 static let claviers = [unit, diz, cent, mil, myr, dizmyr]
 
 static func clavier(_ power:Int) -> [String] {
  let max = claviers.count
  return claviers[power % max]
 }
 
 // glyphes des unités
 static let unit = ["","I","II","III","IV","V","VI","VII","VIII","IX"]
 static let diz = ["","X","XX","XXX","XL","L","LX","LXX","LXXX","XC"]
 static let cent = ["","C","CC","CCC","CD","D","DC","DCC","DCCC","CM"]
 static let mil = ["","M","MM","MMM","M\u{2181}","\u{2181}","\u{2181}M","\u{2181}MM","\u{2181}MMM","M\u{2182}"]
 static let myr =
   // u{2187}, le glyphe unicode pour 50 000 est inopérant. Il est remplacé ici par le D encadré 1F133
   // u{2188}, le glyphe unicode pour 100 000 est inopérant. Il est remplacé ici par le M encadré 1F13C
["","\u{2182}","\u{2182}\u{2182}","\u{2182}\u{2182}\u{2182}","\u{2182}\u{1F133}","\u{1F133}","\u{1F133}\u{2182}","\u{1F133}\u{2182}\u{2182}","\u{1F133}\u{2182}\u{2182}\u{2182}","\u{2182}\u{1F13C}"]
 static let dizmyr =
   // unique chiffre romain 100000
   // u{2188}, le glyphe unicode pour 100 000 est inopérant. Il est remplacé ici par le M encadré 1F13C
  ["","\u{1F13C}","\u{1F13C}\u{1F13C}","\u{1F13C}\u{1F13C}\u{1F13C}","","","","","",""]
 
 static func chiffre(_ maxpower:Int, _ power:Int, _ index:Int) -> String {
  return clavier(maxpower - power)[index]
 }
}

//=============================
// satire shadok
//=============================
struct Shadok {
 
 static func symbols(_ base:Int) -> [String] {
  if base == 4 {
   return ["Ga","Bu","Zo","Meu"]
  } else {
   // avec zérobinet
   return ["\u{1F6B0}","Ga","Bu","Zo","Meu"]
  }
 }
}

// chiffres décimaux étendus de la numération moderne multibase
struct Extended {
    
    static let codes : [Numicode] = [.global,.alphabet,.base72]

 static let global = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
   
 // lettre O pour zéro
 static let alphabet = ["O","A","B","C","D","E","F","G","H","I","J","K","L","M","N","P","Q","R","S","T", "U", "V", "W", "X", "Y", "Z"]
   
 static let base72 = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","aA","aB","aC","aD","aE","aF","aG","aH","aI","aJ","aK","aL","aM","aN","aO","aP","aQ","aR","aS","aT","aU","aV","aW","aX","aY","aZ"]
   
}

// symboles inventés
struct Generic {

 static var car: String = "_"
 enum Kind {
  case ghost
  case gen74
  case digits
 }

   static func symbols(_ kind:Kind,_ nb:Int = 2) -> [String] {
  var symbols:[String] = []
  switch kind {
  case .digits:
   for i in 0..<nb {
    symbols.append(String(i))
   }
  case .ghost:
   for _ in 0...nb {
    symbols.append(car)
   }
  case .gen74:
   symbols = ["0","1"]
   if nb > 2 {
    let kanji  = Chinois.kanjiset
    symbols.append(kanji[4])
    if nb > 3 {
     let global = Extended.global
     let greek1    = ["α", "β", "γ", "δ", "ε", "ζ", "η", "θ", "ι", "λ"]
     let greek2    = ["μ", "ν", "ξ", "π", "ρ", "σ", "τ", "φ", "ψ", "ω"]
     let cyrillic  = ["б", "д", "ж", "и", "л", "э", "η", "я", "ι", "κ"]
     let newar1  = ["𑐀", "𑐂", "𑐄", "𑐆", "𑐊", "𑐎", "𑐐", "𑐒", "𑐔", "𑐕"]
     let newar2  = ["𑐗", "𑐙", "𑐝", "𑐠", "𑐡", "𑐪", "𑐱", "𑐳", "𑐮", "𑑙"]

     for i in 0...9 {
      symbols.append(global[i+2])
      symbols.append(greek1[i])
      symbols.append(global[i+12])
      symbols.append(newar1[i])
      symbols.append(cyrillic[i])
      symbols.append(greek2[i])
      symbols.append(newar2[i])
     }
     if nb == 74 {
      symbols.append(kanji[6])
     }
    }
   }
  }
    return symbols
 }
}

/* chiffres de la base 60
static let sumer60 =
  [ "\u{1244A}", "\u{12415}", "\u{12416}", "\u{12417}", "\u{12418}", "\u{12419}", "\u{1241A}", "\u{1241B}", "\u{1241C}", "\u{1241D}", "\u{1230B}",
   "\u{1230B}"+"\u{12415}", "\u{1230B}"+"\u{12416}", "\u{1230B}"+"\u{12417}", "\u{1230B}"+"\u{12418}", "\u{1230B}"+"\u{12419}", "\u{1230B}"+"\u{1241A}", "\u{1230B}"+"\u{1241B}", "\u{1230B}"+"\u{1241C}", "\u{1230B}"+"\u{1241D}", "\u{12399}",
   "\u{12399}"+"\u{12415}", "\u{12399}"+"\u{12416}", "\u{12399}"+"\u{12417}", "\u{12399}"+"\u{12418}", "\u{12399}"+"\u{12419}", "\u{12399}"+"\u{1241A}", "\u{12399}"+"\u{1241B}", "\u{12399}"+"\u{1241C}", "\u{12399}"+"\u{1241D}",
   "\u{1230D}", "\u{1230D}"+"\u{12415}", "\u{1230D}"+"\u{12416}", "\u{1230D}"+"\u{12417}", "\u{1230D}"+"\u{12418}", "\u{1230D}"+"\u{12419}", "\u{1230D}"+"\u{1241A}", "\u{1230D}"+"\u{1241B}", "\u{1230D}"+"\u{1241C}", "\u{1230D}"+"\u{1241D}",
   "\u{1240F}", "\u{1240F}"+"\u{12415}", "\u{1240F}"+"\u{12416}", "\u{1240F}"+"\u{12417}", "\u{1240F}"+"\u{12418}", "\u{1240F}"+"\u{12419}", "\u{1240F}"+"\u{1241A}", "\u{1240F}"+"\u{1241B}", "\u{1240F}"+"\u{1241C}", "\u{1240F}"+"\u{1241D}",
   "\u{12410}", "\u{12410}"+"\u{12415}", "\u{12410}"+"\u{12416}", "\u{12410}"+"\u{12417}", "\u{12410}"+"\u{12418}", "\u{12410}"+"\u{12419}", "\u{12410}"+"\u{1241A}", "\u{12410}"+"\u{1241B}", "\u{12410}"+"\u{1241C}", "\u{12410}"+"\u{1241D}" ]

static let babylon60 =
 [ "\u{1244A}", "\u{12415}", "\u{12416}", "\u{12417}", "\u{12418}", "\u{12419}", "\u{1241A}", "\u{1241B}", "\u{1241C}", "\u{1241D}", "\u{1241E}",
   "\u{1241E}"+"\u{12415}", "\u{1241E}"+"\u{12416}", "\u{1241E}"+"\u{12417}", "\u{1241E}"+"\u{12418}", "\u{1241E}"+"\u{12419}", "\u{1241E}"+"\u{1241A}", "\u{1241E}"+"\u{1241B}", "\u{1241E}"+"\u{1241C}", "\u{1241E}"+"\u{1241D}", "\u{1241F}",
   "\u{1241F}"+"\u{12415}", "\u{1241F}"+"\u{12416}", "\u{1241F}"+"\u{12417}", "\u{1241F}"+"\u{12418}", "\u{1241F}"+"\u{12419}", "\u{1241F}"+"\u{1241A}", "\u{1241F}"+"\u{1241B}", "\u{1241F}"+"\u{1241C}", "\u{1241F}"+"\u{1241D}", "\u{12420}",
   "\u{12420}"+"\u{12415}", "\u{12420}"+"\u{12416}", "\u{12420}"+"\u{12417}", "\u{12420}"+"\u{12418}", "\u{12420}"+"\u{12419}", "\u{12420}"+"\u{1241A}", "\u{12420}"+"\u{1241B}", "\u{12420}"+"\u{1241C}", "\u{12420}"+"\u{1241D}",
   "\u{12421}", "\u{12421}"+"\u{12415}", "\u{12421}"+"\u{12416}", "\u{12421}"+"\u{12417}", "\u{12421}"+"\u{12418}", "\u{12421}"+"\u{12419}", "\u{12421}"+"\u{1241A}", "\u{12421}"+"\u{1241B}", "\u{12421}"+"\u{1241C}", "\u{12421}"+"\u{1241D}",
   "\u{12422}", "\u{12422}"+"\u{12415}", "\u{12422}"+"\u{12416}", "\u{12422}"+"\u{12417}", "\u{12422}"+"\u{12418}", "\u{12422}"+"\u{12419}", "\u{12422}"+"\u{1241A}", "\u{12422}"+"\u{1241B}", "\u{12422}"+"\u{1241C}", "\u{12422}"+"\u{1241D}",
   "\u{12423}", "\u{12423}"+"\u{12415}", "\u{12423}"+"\u{12416}", "\u{12423}"+"\u{12417}", "\u{12423}"+"\u{12418}", "\u{12423}"+"\u{12419}", "\u{12423}"+"\u{1241A}", "\u{12423}"+"\u{1241B}", "\u{12423}"+"\u{1241C}", "\u{12423}"+"\u{1241D}", "\u{12424}", "\u{12424}"+"\u{12415}", "\u{12424}"+"\u{12416}" ]
 
 static let ? = ["\u{A8E0}","\u{A8E1}","\u{A8E2}","\u{A8E3}","\u{A8E4}","\u{A8E5}","\u{A8E6}","\u{A8E7}","\u{A8E8}","\u{A8E9}"]
 */
