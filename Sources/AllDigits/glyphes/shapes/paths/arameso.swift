//
//  File.swift
//  
//
//  Created by Herve Crespel on 02/10/2023.
//

import Foundation

/*  explication de la structure d'initialisation d'un glyphe
 un glyphe se compose de un ou plusieurs Glypath
 un Glypath se compose d'un point de départ et d'une liste de segments qui tracent un motif continu
 un Glypath peut avoir des offsets qui permettent de répéter son motif
 starters[0] est le point de départ
 starters[i>0] est un offset qui sert à translater le point de départ et les segments
 un segment droit est défini par deux nombres [x, y]
 un segment courbe est défini par quatre nombres [x, y, cx, cy]
 le point (x, y) est l'extrémité du segment courant et l'origine du segment suivant
 (cx,cy) définit la courbure
 */



// unaire d'Hatra, utilisé par les araméens de mésopotamie au début de l'ère chrétienne
let arameso = [
    [],
    [Glypath(   //1
        starters : [[0.1, 0.2]],
        segments : [
            [0.1, 0.8],
            [0.11, 0.2],
            [0.11, 0.8],
            [0.12, 0.2],
            [0.12, 0.8],
            [0.13, 0.2],
            [0.13, 0.8]
        ]
    )],
    [Glypath(
        starters : [[0.1, 0.2],[0.13, 0]],
        segments : [
            [0.1, 0.8],
            [0.11, 0.2],
            [0.11, 0.8],
            [0.12, 0.2],
            [0.12, 0.8],
            [0.13, 0.2],
            [0.13, 0.8]
        ]
    )],
    [Glypath(   //3
        starters : [[0.1, 0.2],[0.13, 0],[0.26, 0]],
        segments : [
            [0.1, 0.8],
            [0.11, 0.2],
            [0.11, 0.8],
            [0.12, 0.2],
            [0.12, 0.8],
            [0.13, 0.2],
            [0.13, 0.8]
        ]
    )],
    [Glypath(   //4
        starters : [[0.1, 0.2],[0.13, 0],[0.26, 0],[0.39, 0]],
        segments : [
            [0.1, 0.8],
            [0.11, 0.2],
            [0.11, 0.8],
            [0.12, 0.2],
            [0.12, 0.8],
            [0.13, 0.2],
            [0.13, 0.8]
        ]
    )],
    [Glypath(   //5
         starters : [[0.65, 0.2]],
         segments : [
             [1, 0.5],
             [0.65, 0.8],
             [0.99, 0.5],
             [0.65, 0.21],
             [0.98, 0.5],
             [0.65, 0.79],
             [0.97, 0.5],
             [0.65, 0.22],
             [0.96, 0.5],
             [0.65, 0.78]
         ]
     )],
    [Glypath(   //6
        starters : [[0.5, 0.2]],
        segments : [
            [0.5, 0.8],
            [0.51, 0.2],
            [0.51, 0.8],
            [0.52, 0.2],
            [0.52, 0.8],
            [0.53, 0.2],
            [0.53, 0.8]
        ]
    ),
     Glypath(
         starters : [[0.65, 0.2]],
         segments : [
             [1, 0.5],
             [0.65, 0.8],
             [0.99, 0.5],
             [0.65, 0.21],
             [0.98, 0.5],
             [0.65, 0.79],
             [0.97, 0.5],
             [0.65, 0.22],
             [0.96, 0.5],
             [0.65, 0.78]
         ]
     )],
    [Glypath(
        starters : [[0.5, 0.2],[-0.14, 0]],
        segments : [
            [0.5, 0.8],
            [0.51, 0.2],
            [0.51, 0.8],
            [0.52, 0.2],
            [0.52, 0.8],
            [0.53, 0.2],
            [0.53, 0.8]
        ]
    ),
     Glypath(
         starters : [[0.65, 0.2]],
         segments : [
             [1, 0.5],
             [0.65, 0.8],
             [0.99, 0.5],
             [0.65, 0.21],
             [0.98, 0.5],
             [0.65, 0.79],
             [0.97, 0.5],
             [0.65, 0.22],
             [0.96, 0.5],
             [0.65, 0.78]
         ]
     )],
    [Glypath(
        starters : [[0.5, 0.2],[-0.14, 0],[-0.28, 0]],
        segments : [
            [0.5, 0.8],
            [0.51, 0.2],
            [0.51, 0.8],
            [0.52, 0.2],
            [0.52, 0.8],
            [0.53, 0.2],
            [0.53, 0.8]
        ]
    ),
     Glypath(
         starters : [[0.65, 0.2]],
         segments : [
             [1, 0.5],
             [0.65, 0.8],
             [0.99, 0.5],
             [0.65, 0.21],
             [0.98, 0.5],
             [0.65, 0.79],
             [0.97, 0.5],
             [0.65, 0.22],
             [0.96, 0.5],
             [0.65, 0.78]
         ]
     )],
    [Glypath(
        starters : [[0.1, 0.2],[0.13, 0],[0.26, 0],[0.39, 0]],
        segments : [
            [0.1, 0.8],
            [0.11, 0.2],
            [0.11, 0.8],
            [0.12, 0.2],
            [0.12, 0.8],
            [0.13, 0.2],
            [0.13, 0.8]
        ]
    ),
     Glypath(
         starters : [[0.65, 0.2]],
         segments : [
             [1, 0.5],
             [0.65, 0.8],
             [0.99, 0.5],
             [0.65, 0.21],
             [0.98, 0.5],
             [0.65, 0.79],
             [0.97, 0.5],
             [0.65, 0.22],
             [0.96, 0.5],
             [0.65, 0.78]
         ]
     )],

]
import SwiftUI
#Preview {
    VStack{
        ForEach (0..<1, id:\.self) {
            line in
            HStack {
                ForEach (1..<10, id:\.self)  {
                    i in
                    Glyshape(index: i + line*5, color:.blue,
                             weight:2,
                             set:arameso)
                    .frame(width: 50, height: 50)
                    .background(.clear)
                }
            }
        }
    }
}
