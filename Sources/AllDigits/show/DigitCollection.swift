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
    var cote:CGFloat = 30
    var config = Digiconfig(70,50,0,.brown,.clear)
    var greatest: Int = 59
    
    @State var value = 0
    @State var start = false
    
    var antik: [Numeration] { Numeration.set(.antik, [.global]) }
    var live: [Numeration] { Numeration.set(.live, [.global]) }
    var zero: [Numeration] { Numeration.set(.zero, [.global]) }

    public init(w:CGFloat = 1200, h:CGFloat = 800, maxi:Int = 59) {
        width = w
        height = h
        start = true
        greatest = maxi
    }
    public var body: some View {

        ZStack(alignment: .top) {
            if start {
                VStack {
                    Text("digicollectitre")
                    .frame(height: 70, alignment: .center)
                    .font(.title).padding(20)
                    
                    Button(action:reset) { Image(systemName: "play") }
                        .play(w: 100, h: 40)
                }
            } else {
                VStack(alignment: .center,spacing:25) {
                    HStack(spacing:25) {
                        if value > 0 {
                            VStack {
                                Enchiffres(config, Chiffres(value, 20), Numeration(.maya,20), false)
                                Text("maya").font(.caption)
                            }
                        }
                        Text("\(value)")
                            .font(config.scale(3).font)
                            .fontWeight(Font.Weight.bold)
                        .offset(x:0, y:10)
                        .foregroundColor(Color.green)
                        if value > 0 {
                            VStack {
                                Enchiffres(config, Chiffres(value, 20), Numeration(.aztek,20), false)
                                Text("aztek").font(.caption)
                            }
                        }
                    }
                    
                }.frame(width:width, height:height, alignment: .center)
                    
                if value == 0 {
                    ForEach (crown([300], zero.count), id: \.self) { point in
                        VStack {
                            if zero[point.i].numicode == .cister {
                                Cistercien([0,0,0,0], config)
                            } else {
                                if zero[point.i].isgraphic {
                                    Chiffregraphic(index: 0, graphism: zero[point.i].graphism!, config: config)
                                } else {
                                    Text(zero[point.i].clavier(0)[0]).font(config.font)
                                        .foregroundColor(config.fore)
                                }
                            }
                            Text(zero[point.i].numicode.rawValue).font(.caption)
                        }.offset(x: point.x, y: point.y)
                    }
                } else {
                    ForEach (crown([210], antik.count), id: \.self) { point in
                        VStack {
                            Enchiffres(config, Chiffres(value, antik[point.i].base), antik[point.i], false)
                            Text(antik[point.i].numicode.rawValue).font(.caption)
                        }
                        .offset(x: point.x, y: point.y)
                    }
                    ForEach (crown([340], live.count), id: \.self) { point in
                        VStack {
                            Enchiffres(config, Chiffres(value, live[point.i].base), live[point.i], false)
                            Text(live[point.i].numicode.rawValue).font(.caption)
                        }
                        .offset(x: point.x, y: point.y)
                    }
                }
                
                HStack {
                    
                    Button(action: dec)
                    {Image(systemName: "chevron.left").scaledToFill()}
                        .padding(.leading, 15)
                        .play(w: cote, h: cote)
                   
                    Spacer()
                    
                    Button(action: inc)
                    { Image(systemName: "chevron.right").scaledToFill() }
                        .padding(.trailing, 15)
                        .play(w: cote, h: cote)
                    
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
            value = greatest
        } else {
            value -= 1
        }
    }
    
    func inc() {
        if value == greatest {
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
        let origin = Point (x:15, y: height/2-25, i:0)
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

