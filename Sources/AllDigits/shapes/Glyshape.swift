//
//  Glyshape.swift
//  Unicalc (iOS)
//
//  Created by Herve Crespel on 01/09/2022.
//

import SwiftUI

struct Glyshape: View {
    var value = 1
    var size :CGFloat = 3
    var weight :CGFloat = 1
    var set:[[Glypath]] = bibibinaire
    
    var shapath : Shapath {
        Shapath(value, set)
    }
    
    var body: some View {
          GeometryReader { geometry in
              Path { path in
                  var width: CGFloat = min(geometry.size.width, geometry.size.height)
                  let scale: CGFloat = 0.7
                  let offset = (width * (1.0 - scale)) / 2.0
                  width *= scale
                  let height = width
                  for part in shapath.parts {
                      path.move(
                        to:CGPoint(
                            x: width * part.start.x + offset,
                            y: height * part.start.y + offset
                          )
                      )
                      part.segments.forEach { segment in
                          switch segment.type {
                          case .line :
                              path.addLine(
                                  to: CGPoint(
                                      x: width * segment.line.x + offset,
                                      y: height * segment.line.y + offset
                                  )
                              )
                          case .curve:
                              path.addQuadCurve(
                                  to: CGPoint(
                                      x: width * segment.curve.x  + offset,
                                      y: height * segment.curve.y + offset
                                  ),
                                  control: CGPoint(
                                      x: width * segment.control.x  + offset,
                                      y: height * segment.control.y + offset
                                  )
                              )
                          }
                      }
                  }
              }.stroke(lineWidth:weight)
              .foregroundColor(Color("glyph"))
          }.aspectRatio(1, contentMode: .fit)
      }
}

struct Glyshape_Previews: PreviewProvider {
    static var previews: some View {

        VStack {
            Text("bibi-binaire")
            HStack {
                ForEach(0...7, id: \.self) {
                    i in
                    Glyshape(value:i)
                }
            }.frame(width: 400, height: 50)
            HStack {
                ForEach(8...15, id: \.self) {
                    i in
                    Glyshape(value:i, weight:2)
                }
            }.frame(width: 400, height: 50)
        }
        VStack {
            Text("araméen Eléphantine")
            HStack {
                ForEach(1...6, id: \.self) {
                    i in
                    Glyshape(value:i,set:aramegypt)
                }
            }.frame(width: 400, height: 70)
            HStack {
                ForEach(7...10, id: \.self) {
                    i in
                    Glyshape(value:i,set:aramegypt)
                }
            }.frame(width: 400, height: 70)
        }
        VStack {
            Text("araméen Hatra")
            HStack {
                ForEach(1...5, id: \.self) {
                    i in
                    Glyshape(value:i,set:arameso)
                }
            }.frame(width: 400, height: 70)
            HStack {
                ForEach(6...9, id: \.self) {
                    i in
                    Glyshape(value:i,set:arameso)
                }
            }.frame(width: 400, height: 70)
        }

    }
}
