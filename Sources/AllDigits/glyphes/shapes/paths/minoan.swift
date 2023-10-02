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

// unaire minéen,
let minoan = [
    // unaire d'Hatra, utilisé par les araméens de mésopotamie au début de l'ère chrétienne
        [],
        [Glypath(   //1
            starters : [[0.6, 0.2]],
            segments : [
                [0.6, 0.8],
                [0.61, 0.2],
                [0.61, 0.8],
                [0.62, 0.2],
                [0.62, 0.8],
                [0.63, 0.2],
                [0.63, 0.8]
            ]
        )],
    [Glypath(   //2
        starters : [[0.6, 0.2],[0.13,0]],
        segments : [
            [0.6, 0.8],
            [0.61, 0.2],
            [0.61, 0.8],
            [0.62, 0.2],
            [0.62, 0.8],
            [0.63, 0.2],
            [0.63, 0.8]
        ]
    )],
        [Glypath(   //3
            starters : [[0.6, 0.2],[0.13,0],[0.26,0]],
            segments : [
                [0.6, 0.8],
                [0.61, 0.2],
                [0.61, 0.8],
                [0.62, 0.2],
                [0.62, 0.8],
                [0.63, 0.2],
                [0.63, 0.8]
            ]
        )],
        [Glypath(   //4
            starters : [[0.6, 0.2],[0.13,0],[0.26,0],[0.39,0]],
            segments : [
                [0.6, 0.8],
                [0.61, 0.2],
                [0.61, 0.8],
                [0.62, 0.2],
                [0.62, 0.8],
                [0.63, 0.2],
                [0.63, 0.8]
            ]
        )],
        [Glypath(   //5
            starters : [[0, 0.1]],
            segments : [
                [0, 0.4],
                [0.25, 0.8, 0, 0.8],
                [0.5, 0.4, 0.5, 0.8],
                [0.5, 0.1]
            ]
        ),
         Glypath(
            starters : [[0.25, 0.8]],
             segments : [
                [0.25, 1],
                [0.15, 0.9],
                [0.15, 1.05]
             ]
         )],
        [Glypath(   //6
            starters : [[0, 0.2]],
            segments : [
                [0, 0.4],
                [0.25, 0.8, 0, 0.8],
                [0.5, 0.4, 0.5, 0.8],
                [0.5, 0.2]
            ]
        ),
         Glypath(
            starters : [[0.25, 0.8]],
             segments : [
                [0.25, 1],
                [0.15, 0.9],
                [0.15, 1.05]
             ]
         ),
         Glypath(
             starters : [[0.6, 0.2]],
             segments : [
                 [0.6, 0.8],
                 [0.61, 0.2],
                 [0.61, 0.8],
                 [0.62, 0.2],
                 [0.62, 0.8],
                 [0.63, 0.2],
                 [0.63, 0.8]
             ]
         )],
        [Glypath(   //7
            starters : [[0, 0.2]],
            segments : [
                [0, 0.4],
                [0.25, 0.8, 0, 0.8],
                [0.5, 0.4, 0.5, 0.8],
                [0.5, 0.2]
            ]
        ),
         Glypath(
            starters : [[0.25, 0.8]],
             segments : [
                [0.25, 1],
                [0.15, 0.9],
                [0.15, 1.05]
             ]
         ),
         Glypath(
             starters : [[0.6, 0.2],[0.13,0]],
             segments : [
                 [0.6, 0.8],
                 [0.61, 0.2],
                 [0.61, 0.8],
                 [0.62, 0.2],
                 [0.62, 0.8],
                 [0.63, 0.2],
                 [0.63, 0.8]
             ]
         )],
        [Glypath(   //8
            starters : [[0, 0.2]],
            segments : [
                [0, 0.4],
                [0.25, 0.8, 0, 0.8],
                [0.5, 0.4, 0.5, 0.8],
                [0.5, 0.2]
            ]
        ),
         Glypath(
            starters : [[0.25, 0.8]],
             segments : [
                [0.25, 1],
                [0.15, 0.9],
                [0.15, 1.05]
             ]
         ),
         Glypath(
             starters : [[0.6, 0.2],[0.13,0],[0.26,0]],
             segments : [
                 [0.6, 0.8],
                 [0.61, 0.2],
                 [0.61, 0.8],
                 [0.62, 0.2],
                 [0.62, 0.8],
                 [0.63, 0.2],
                 [0.63, 0.8]
             ]
         )],
        [Glypath(   //9
            starters : [[0, 0.2]],
            segments : [
                [0, 0.4],
                [0.25, 0.8, 0, 0.8],
                [0.5, 0.4, 0.5, 0.8],
                [0.5, 0.2]
            ]
        ),
         Glypath(
            starters : [[0.25, 0.8]],
             segments : [
                [0.25, 1],
                [0.15, 0.9],
                [0.15, 1.05]
             ]
         ),
         Glypath(
             starters : [[0.6, 0.2],[0.13,0],[0.26,0],[0.39,0]],
             segments : [
                 [0.6, 0.8],
                 [0.61, 0.2],
                 [0.61, 0.8],
                 [0.62, 0.2],
                 [0.62, 0.8],
                 [0.63, 0.2],
                 [0.63, 0.8]
             ]
         )]
]

import SwiftUI
#Preview {
    VStack{
        ForEach (0..<2, id:\.self) {
            line in
            HStack {
                ForEach (1..<6, id:\.self)  {
                    i in
                    if  i + line*5 < 10 {
                        Glyshape(index: i + line*5, color:.blue,
                                 weight:2,
                                 set:minoan)
                        .frame(width: 50, height: 50)
                        .background(.clear)
                    }
                }
            }
        }
    }
}
