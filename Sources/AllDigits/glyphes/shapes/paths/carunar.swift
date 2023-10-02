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

//unaire carré
let carunar = [
    [],
    [Glypath(   //1
        starters : [[0, 1]],
        segments : [
            [0, 0]
        ]
    )],
    [Glypath(   //2
        starters : [[0, 1]],
        segments : [
            [0, 0],
            [1, 0]
        ]
    )],
    [Glypath(   //3
        starters : [[0, 1]],
        segments : [
            [0, 0],
            [1, 0],
            [1, 1]
        ]
    )],
    [Glypath(   //4
        starters : [[0, 1]],
        segments : [
            [0, 0],
            [1, 0],
            [1, 1],
            [0, 1]
        ]
    )],
    [Glypath(   //5
        starters : [[0, 1]],
        segments : [
            [0, 0],
            [1, 0],
            [1, 1],
            [0, 1],
            [1, 0]
        ]
    )]
]
import SwiftUI
#Preview {
    VStack{
        ForEach (0..<1, id:\.self) {
            line in
            HStack {
                ForEach (1..<6, id:\.self)  {
                    i in
                    Glyshape(index: i + line*5, color:.blue,
                             weight:2,
                             set:carunar)
                    .frame(width: 50, height: 50)
                    .background(.clear)
                }
            }
        }
    }
}
