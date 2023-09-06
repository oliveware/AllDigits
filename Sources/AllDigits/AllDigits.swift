import SwiftUI
import Digiconf

// Interface du package

// nombre écrit avec les chiffres de la numération
public struct Enchiffres: View {
    var config = Conf.show
    var haut : CGFloat = 100
    var numeration : Numeration
    var chiffres: [Int] = []
    
    public var body: some View {
        HStack {
            ForEach(0..<chiffres.count, id:\.self) {
                power in
                Chiffre(
                    index:chiffres[power],
                    numeration:numeration,
                    power:chiffres.count - 1 - power,
                    config: config
                )
            }
        }.frame(height: haut)
    }
}

// nota: la présentation en boules est fournie par Abacus
    
public struct Pad: View {
    @State var chiffres = Chiffres()
    var numeration : Numeration
    var linear = false
    
    public init(_ conf:Digiconfig, _ numic:Numicode = .global,_ base:Int = 10, _ linear:Bool = false) {
        numeration = Numeration(numic, base)
        self.linear = linear
        Conf.pad = conf
    }
    
    public var body: some View {
        VStack {
            Enchiffres(
                haut: Conf.height * 0.2,
                numeration: numeration,
                chiffres:chiffres.values
            )
            Spacer()
            if Mesopotamie.cuneicodes.contains(numeration.numicode) {
                Cuneipad(
                    height:Conf.height * 0.8,
                    chiffres:$chiffres)
            } else {
                Unipad(
                    height: linear ? 80 : Conf.height*0.8,
                    linear:linear,
                    numeration:numeration,
                    chiffres: $chiffres)
            }
        }
    }
}

struct Conf {
    static let width : CGFloat = 1200
    static let height : CGFloat = 800
    
    static var show = Digiconfig()
    static var pad = Digiconfig()
    static var log = Digiconfig()
}


