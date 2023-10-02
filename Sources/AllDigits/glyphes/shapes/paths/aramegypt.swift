//
//  File.swift
//  
//
//  Created by Herve Crespel on 02/10/2023.
//

import Foundation
import SwiftUI

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


// unaire araméen d'Egypte, dit d'éléphantine (entre le 5ème et le 3ème siècle avant JC)
let aramegypt = [
    [],
    [Glypath(
        starters : [[0.8, 0.1]],
        segments : [
            [0.76, 0.9],
            [0.79, 0.11],
            [0.75, 0.9],
            [0.78, 0.12],
            [0.74, 0.9],
            [0.77, 0.13]
        ]
    )],
    [Glypath(
        starters : [[0.8, 0.1],[-0.15, 0]],
        segments : [
            [0.76, 0.9],
            [0.79, 0.11],
            [0.75, 0.9],
            [0.78, 0.12],
            [0.74, 0.9],
            [0.77, 0.13]
        ]
    )],
    [Glypath(
        starters : [[0.8, 0.1],[-0.15, 0],[-0.3, 0]],
        segments : [
            [0.76, 0.9],
            [0.79, 0.11],
            [0.75, 0.9],
            [0.78, 0.12],
            [0.74, 0.9],
            [0.77, 0.13]
        ]
    )],

    [Glypath(
        starters : [[0.38, 0.1]],
        segments : [
            [0.43, 0.9],
            [0.40, 0.11],
            [0.42, 0.9],
            [0.39, 0.10],
            [0.41, 0.9],
            [0.38, 0.09]
        ]
    ),
     Glypath(
         starters : [[0.93, 0.1],[-0.15, 0],[-0.3, 0]],
         segments : [
             [0.89, 0.9],
             [0.92, 0.11],
             [0.88, 0.9],
             [0.91, 0.12],
             [0.87, 0.9],
             [0.90, 0.13]
         ]
     )],
    [Glypath(
        starters : [[0.38, 0.1],[-0.15, 0]],
        segments : [
            [0.43, 0.9],
            [0.40, 0.11],
            [0.42, 0.9],
            [0.39, 0.10],
            [0.41, 0.9],
            [0.38, 0.09]
        ]
    ),
     Glypath(
         starters : [[0.93, 0.1],[-0.15, 0],[-0.3, 0]],
         segments : [
             [0.89, 0.9],
             [0.92, 0.11],
             [0.88, 0.9],
             [0.91, 0.12],
             [0.87, 0.9],
             [0.90, 0.13]
         ]
     )],
    // six
    [Glypath(
        starters : [[0.38, 0.1],[-0.15, 0],[-0.3, 0]],
        segments : [
            [0.43, 0.9],
            [0.40, 0.11],
            [0.42, 0.9],
            [0.39, 0.10],
            [0.41, 0.9],
            [0.38, 0.09]
        ]
    ),
     Glypath(
         starters : [[0.93, 0.1],[-0.15, 0],[-0.3, 0]],
         segments : [
             [0.89, 0.9],
             [0.92, 0.11],
             [0.88, 0.9],
             [0.91, 0.12],
             [0.87, 0.9],
             [0.90, 0.13]
         ]
     )],
    // sept
    [Glypath(
        starters : [[0.2, 0.1]],
        segments : [
            [0.25, 0.9],
            [0.22, 0.11],
            [0.24, 0.9],
            [0.21, 0.10],
            [0.23, 0.9],
            [0.22, 0.09]
        ]
    ),
     Glypath(
         starters : [[1, 0.1],[-0.1, 0],[-0.2, 0],[-0.35, 0],[-0.45, 0],[-0.55, 0]],
         segments : [
             [0.96, 0.9],
             [0.99, 0.11],
             [0.95, 0.9],
             [0.98, 0.12],
             [0.94, 0.9],
             [0.97, 0.13]
         ]
     )],
    [Glypath(
        starters : [[0.2, 0.1],[-0.1, 0]],
        segments : [
            [0.25, 0.9],
            [0.22, 0.11],
            [0.24, 0.9],
            [0.21, 0.10],
            [0.23, 0.9],
            [0.22, 0.09]
        ]
    ),
     Glypath(
         starters : [[1, 0.1],[-0.1, 0],[-0.2, 0],[-0.35, 0],[-0.45, 0],[-0.55, 0]],
         segments : [
             [0.96, 0.9],
             [0.99, 0.11],
             [0.95, 0.9],
             [0.98, 0.12],
             [0.94, 0.9],
             [0.97, 0.13]
         ]
     )],
    [Glypath(
        starters : [[0.2, 0.1],[-0.1, 0],[-0.2, 0]],
        segments : [
            [0.25, 0.9],
            [0.22, 0.11],
            [0.24, 0.9],
            [0.21, 0.10],
            [0.23, 0.9],
            [0.22, 0.09]
        ]
    ),
     Glypath(
         starters : [[1, 0.1],[-0.1, 0],[-0.2, 0],[-0.35, 0],[-0.45, 0],[-0.55, 0]],
         segments : [
             [0.96, 0.9],
             [0.99, 0.11],
             [0.95, 0.9],
             [0.98, 0.12],
             [0.94, 0.9],
             [0.97, 0.13]
         ]
     )],
    // neuf pour value >= 10
    [
     Glypath(
         starters : [[1, 0.1],[-0.1, 0],[-0.2, 0],[-0.35, 0],[-0.45, 0],[-0.55, 0],[-0.7, 0],[-0.8, 0],[-0.9, 0]],
         segments : [
             [0.96, 0.9],
             [0.99, 0.11],
             [0.95, 0.9],
             [0.98, 0.12],
             [0.94, 0.9],
             [0.97, 0.13]
         ]
     )]
]
#Preview {
    VStack{
        ForEach (0..<2, id:\.self) {
            line in
            HStack {
                ForEach (1..<6, id:\.self)  {
                    i in
                    Glyshape(index: i + line*5, color:.blue,
                             weight:2,
                             set:aramegypt)
                    .frame(width: 50, height: 50)
                    .background(.clear)
                }
            }
        }
    }
}
