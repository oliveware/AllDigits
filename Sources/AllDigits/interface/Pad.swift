import SwiftUI
import Digiconf



// nota: la présentation en boules est fournie par Abacus
    
public struct Pad: View {
    @Binding var chiffres : Chiffres
    var configtouch: Digiconfig
    var configshow: Digiconfig
    var numeration : Numeration
    var linear = false
    var additif = false
    var width : CGFloat = 600
    var height : CGFloat = 400
    
    public init(_ confshow:Digiconfig, _ conftouch:Digiconfig,
                _ scalar : Binding<Chiffres>,
                _ numeration: Numeration = Numeration(.global, 10),
                _ linear:Bool = false, _ additif : Bool = false,
                _ w : CGFloat = 1200,_ h : CGFloat = 800)
    {
        self.numeration = numeration
        self.linear = linear
        self.additif = additif
        configtouch = conftouch
        configshow = confshow
        width = w
        height = h
        // *** initialisation d'un binding ***
        self._chiffres = scalar
    }
    
    public var body: some View {
        VStack {
            Enchiffres( configshow, numeration, chiffres )
            Spacer()
            if Mesopotamie.cuneicodes.contains(numeration.numicode) {
                Cuneipad(
                    width:width,
                    height:height * 0.8,
                    config:configtouch,
                    doubles:Mesopotamie.symbols(numeration.numicode),
                    tens:Mesopotamie.tens(numeration.numicode),
                    units:Mesopotamie.units(numeration.numicode),
                    chiffres:$chiffres)
            } else {
                HStack {
                    if additif {
                        Button("pass") {
                            chiffres.add(0)
                        }
                    }
                    Unipad(
                        width:width,
                        height: linear ? configtouch.haut : height*0.8,
                        config:configtouch,
                        linear:linear,
                        touches:numeration.clavier(additif ? chiffres.values.count : 0),
                        nbtouches:numeration.base,
                        graphism:numeration.graphism,
                        zeroisknown:numeration.zeroisknown,
                        chiffres: $chiffres)
                }
            }
        }.disabled(numeration.powermax == chiffres.values.count - 1)
    }
}

/*struct Conf {
    static let width : CGFloat = 1200
    static let height : CGFloat = 800
    
    static var show = Digiconfig()
    static var touch = Digiconfig()
}*/


