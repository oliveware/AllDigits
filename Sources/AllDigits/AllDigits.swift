import SwiftUI
import Digiconf

// nombre écrit avec les chiffres de la numération
public struct Enchiffres: View {
    var config:Digiconfig
    var numeration : Numeration
    var chiffres: [Int] = []
    
    public var body: some View {
        HStack {
            ForEach(0..<chiffres.count, id:\.self) {
                power in
                Chiffre(
                    index:chiffres[power],
                    symbols:numeration.symbols(power),
                    graphism:numeration.graphism,
                    config: config
                )
            }
        }
    }
}
    
public struct Pad: View {
    var chiffres: Chiffres
    
    public var body: some View {
        VStack {
            
        }
        
    }

}


