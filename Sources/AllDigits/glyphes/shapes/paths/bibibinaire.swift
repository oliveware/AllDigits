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

// bibi-binaire

let bibibinaire = [
    [Glypath(   //0
        starters : [[0, 0.5]],
        segments : [
            [0.5, 0, 0, 0],
            [1, 0.5, 1, 0],
            [0.5, 1, 1, 1],
            [0, 0.5, 0, 1]
        ]
    )],
    [Glypath(   //1
        starters : [[0.25, 0]],
        segments : [
            [0.5, 0.25, 0.5, 0],
            [0.5, 1]
        ]
    )],
    [Glypath(   //2
        starters : [[0.5, 0]],
        segments : [
            [0.5, 0.75],
            [0.25, 1, 0.5, 1]
        ]
    )],
    [Glypath(
        starters : [[0.75, 1]],
        segments : [
            [0.5, 1],
            [0, 0.5, 0, 1],
            [0.5, 0, 0, 0],
            [0.75, 0]
        ]
    )],
    [Glypath(
        starters : [[0.25, 1]],
        segments : [
            [0.25, 0.25],
            [0.5, 0, 0.25, 0]
        ]
    )],
    [Glypath(   //5
        starters : [[0, 1]],
        segments : [
            [0, 0.5],
            [0.5, 0, 0, 0],
            [1, 0.5, 1, 0],
            [1, 1]
        ]
    )],
    [Glypath(
        starters : [[0, 1]],
        segments : [
            [0.5, 0.5, 0, 0.5],
            [1, 0, 1, 0.5]
        ]
    )],
    [Glypath(   //7
        starters : [[0, 1]],
        segments : [
            [1, 0],
            [1, 1]
        ]
    )],
    [Glypath(
        starters : [[0.25, 0]],
        segments : [
            [0.25, 0.75],
            [0.5, 1, 0.25, 1]
        ]
    )],
    [Glypath(
        starters : [[0, 0]],
        segments : [
            [0.5, 0.5, 0, 0.5],
            [1, 1, 1, 0.5]
        ]
    )],
    [Glypath(   //10
        starters : [[0, 0]],
        segments : [
            [0, 0.5],
            [0.5, 1, 0, 1],
            [1, 0.5, 1, 1],
            [1, 0]
        ]
    )],
    [Glypath(
        starters : [[0, 0]],
        segments : [
            [0.75, 0],
            [0.75, 1]
        ]
    )],
    [Glypath(
        starters : [[0.25, 0]],
        segments : [
            [0.5, 0],
            [1, 0.5, 1, 0],
            [0.5, 1, 1, 1],
            [0.25, 1]
        ]
    )],
    [Glypath(
        starters : [[0.25, 0]],
        segments : [
            [0.25, 1],
            [1, 1]
        ]
    )],
    [Glypath(
        starters : [[0, 0]],
        segments : [
            [0, 1],
            [1, 0]
        ]
    )],
    [Glypath(
        starters : [[0, 0]],
        segments : [
            [0, 1],
            [1, 0],
            [1, 1]
        ]
    )]
]

import SwiftUI
#Preview {
    VStack{
        ForEach (0...3, id:\.self) {
            line in
            HStack {
                ForEach (0...3, id:\.self)  {
                    i in
                    Glyshape(index: i + line*4, color:.blue,
                             weight:2,
                             set:bibibinaire)
                    .frame(width: 50, height: 50)
                    .background(.clear)
                }
            }
        }
    }
}
