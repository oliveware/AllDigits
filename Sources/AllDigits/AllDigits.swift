public struct AllDigits {
    public func chiffre(_ numic:Numicode, _ index:Int, _ power:Int = 0) -> Chiffre {
        
    }
    
    public func clavier(_ numic:Numicode, _ power:Int = 0) -> Clavier {
        
    }
    
    func glyphes(_ numic:Numicode, _ power:Int = 0) -> Glypheset {
        
    }

    public init() {
    }
}

public struct Chiffre: View {

    var index = 7
    var classifier : String = ""
    var graphism = Graphism.none
    
    var size: CGFloat = 20
    
    var body: some View {
        switch graphism {
        case .bibi:
            Glyshape(index: index, set:bibibinaire)
                .frame(width: size*1.5, height: size*2.2)
        case .maya:
            ChiffreMaya(index: index, size: size*0.3)
        case .yiking:
            Chiffre64(index: index, size: size*0.25)
        case .boulier:
            Text("b")
          //  Tigeboule(tige:Tige(face.abacus.type, index),width:size, height:size * 7)
        case .none:
            Chiffretext(index:index, classifier:classifier, size:size)
        }
    }
}

struct Chiffretext: View {
    var index: Int
    var classifier : String = ""
    var size: CGFloat = 20
    
    private var fw = Font.Weight.bold
    private var cf:CTFont {
        CTFontCreateUIFontForLanguage(.system, size*2,  nil)!
    }
    var symbol: String {
        let range = 0..<face.pave.count
        return range.contains(index) ? face.pave[index] : ""
    }
    
    var body : some View {
        Text(symbol + (index == 0 ? "" : classifier))
            .font(Font(cf))
            .fontWeight(fw)
    }
}
