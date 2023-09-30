//
//  Collection.swift
//  Unicalc
//
//  Created by Herve Crespel on 04/09/2022.
//

import SwiftUI
import AVFoundation
import Digiconf


public struct DigitCollection: View {
    //var mesure = Mesure()
    var width:CGFloat = 1200
    var height:CGFloat = 800
    var cote:CGFloat = 40
    var config = Digiconfig(50,50,0,.brown,.clear)
    
    @State var value = 7
    @State var start = false
    
    var antik: [Numeration] { Numeration.set(.antik, [.global]) }
    var live: [Numeration] { Numeration.set(.live, [.global]) }

    public init(w:CGFloat = 1200, h:CGFloat = 800) {
        width = w
        height = h
        start = true
    }
    public var body: some View {

        ZStack(alignment: .top) {
            if start {
                VStack {
                    Text("digicollectitre")
                    .frame(height: 70, alignment: .center)
                    .font(.title).padding(20)
                    
                    Button(action:reset) { Image(systemName: "play") }
                        .fond(w: 100, h: cote)
                }
            } else {
                VStack(alignment: .center,spacing:25) {
                    Text("\(value)")
                        .font(config.scale(3).font)
                        .fontWeight(Font.Weight.bold)
                        .offset(x:-10, y:-30)
                    
                }.frame(width:width, height:height, alignment: .center)
                    .foregroundColor(Color.green)
                ForEach (crown([190], antik.count), id: \.self) { point in
                    HStack {
                        if antik[point.i].isgraphic {
                            Chiffregraphic(
                                index:value,
                                graphism:antik[point.i].graphism!,
                                config: config
                            )
                        } else {
                            Chiffreunicode(
                                symbol:antik[point.i].chiffre(0 , 0, value),
                                config: config
                            )
                        }
                    }
                    .offset(x: point.x, y: point.y)
                }
                ForEach (crown([280], live.count), id: \.self) { point in
                    HStack {
                        if live[point.i].isgraphic {
                            Chiffregraphic(
                                index:value,
                                graphism:live[point.i].graphism!,
                                config: config
                            )
                        } else {
                            Chiffreunicode(
                                symbol:live[point.i].chiffre(0 , 0, value),
                                config: config
                            )
                        }
                    }
                    .offset(x: point.x, y: point.y)
                }
                
                HStack {
                    if value > 0 {
                        Button(action: dec)
                        {Image(systemName: "chevron.left").scaledToFill()}
                            .padding(.leading, 15)
                            .fond(w: cote, h: cote)
                    }
                    Spacer()
                    Button(action: inc)
                    { Image(systemName: "chevron.right").scaledToFill() }
                        .padding(.trailing, 15)
                        .fond(w: cote, h: cote)
                }
                .padding(10)
            }
        }.frame(minWidth:width, minHeight:height, alignment: .center)
       

    }
    
    func reset() {
        value = 0
        start = false
    }
    
    func dec() {
        if value == 0 {
            value = 9
        } else {
            value -= 1
        }
    }
    
    func inc() {
        if value == 9 {
            value = 0
        } else {
            value += 1
        }
    }
    
    struct Point:Hashable {
        let x:Double
        let y:Double
        let i:Int
    }
    
    func crown(_ rayons:[Int], _ nbp:Int)-> [Point] {
        let pointsparcercle = Int(Double(nbp) / Double(rayons.count))
        let arc = 2 * 3.14 / Double(pointsparcercle)
        let origin = Point (x:-10, y: height/2-30, i:0)
        var result : [Point] = []
        var cercle = 0
        for rayon in rayons {
            for i in 0..<pointsparcercle {
                let x = origin.x  + cos(arc * Double(i)) * Double(rayon) * 1.5
                let y = origin.y  + sin(arc * Double(i)) * Double(rayon)
                result.append(Point(x:x, y:y, i:cercle*pointsparcercle+i))
            }
            cercle += 1
        }
     //   print(arc, result)
        return result
    }
    

}

#Preview {
    DigitCollection()
}

