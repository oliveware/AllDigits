import SwiftUI
import Digiconf

// Interface du package

// nota: la présentation en boules est fournie par Abacus
    
public struct Pad: View {
    @Binding var chiffres : Chiffres
    var config: Digiconfig
    var numeration : Numeration
    var linear = false
    var additif = false
    var width : CGFloat = 600
    var height : CGFloat = 400
    
    public init(_ conf:Digiconfig,
                _ scalar : Binding<Chiffres>,
                _ numeration: Numeration = Numeration(.global, 10),
                _ linear:Bool = false, _ additif : Bool = false,
                _ w : CGFloat = 1200,_ h : CGFloat = 800)
    {
        self.numeration = numeration
        self.linear = linear
        self.additif = additif
        config = conf
        width = w
        height = h
        // *** initialisation d'un binding ***
        self._chiffres = scalar
    }
    
    public var body: some View {
        VStack {
            if Mesopotamie.codes.contains(numeration.numicode) {
                Cuneipad(
                    width:width,
                    height:height * 0.8,
                    config:config.size(width/6,height/5),
                    doubles:Mesopotamie.symbols(numeration.numicode),
                    tens:Mesopotamie.tens(numeration.numicode),
                    units:Mesopotamie.units(numeration.numicode),
                    graphism:numeration.graphism,
                    chiffres:$chiffres)
            } else {

                Unipad(
                    width:width,
                    height: linear ? config.haut : height*0.8,
                    config:config,
                    linear:linear,
                    additif:additif && numeration.isadditive,
                    touches:numeration.clavier(additif ? chiffres.values.count : 0),
                    nbtouches:numeration.base,
                    graphism:numeration.graphism,
                    zeroisknown:numeration.zeroisknown,
                    chiffres: $chiffres)
                
            }
        }.disabled(numeration.powermax == chiffres.values.count - 1)
    }
}

#Preview {
    Pad(Digiconfig(60, 60), .constant(Chiffres(579, 10)))
}
#Preview {
    Pad(Digiconfig(80, 80), .constant(Chiffres(579, 60)), Numeration(.arab,10), true)
}
#Preview {
    Pad(Digiconfig(60, 60), .constant(Chiffres(579, 60)), Numeration(.babyash,60))
}
#Preview {
    Pad(Digiconfig(80, 80), .constant(Chiffres(579, 60)), Numeration(.maya,20))
}


