import SwiftUI
import Digiconf

// Interface du package

// nombre écrit avec les chiffres de la numération
public struct Enchiffres: View {
    var numeration : Numeration
    var chiffres: Chiffres
    var config: Digiconfig
    var graphic = false
    
    public init(_ conf:Digiconfig, _ numeration: Numeration = Numeration(.global, 10),_ chiffres:Chiffres) {
        self.numeration = numeration
        graphic = numeration.graphism != nil
        self.chiffres = chiffres
        config = conf
    }
    
    public var body: some View {
        VStack (alignment:.trailing) {
            HStack {
                ForEach(0..<chiffres.values.count, id:\.self) {
                    power in
                    if graphic {
                        Chiffregraphic(
                            index:chiffres.values[power],
                            graphism:numeration.graphism!,
                            config: config
                        )
                    } else {
                        Chiffreunicode(
                            symbol:numeration.chiffre(chiffres.values.count - 1 , power, chiffres.values[power]),
                            config: config
                        )
                    }
                }
            }.frame(height: config.haut)
            Text("\(chiffres.global10)")
        }
    }
}

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


