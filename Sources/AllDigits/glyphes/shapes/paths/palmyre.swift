//
//  Somepaths.swift
//  Unicalc
//
//  Created by Herve Crespel on 01/09/2022.
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


// unaire palmyréen,
let palmyre = [
    // unaire d'Hatra, utilisé par les araméens de mésopotamie au début de l'ère chrétienne
        [],[],[],[],
        [Glypath(   //10
            starters : [[0, 0]],
            segments : [
                [0, 0.5],
                [0.5, 1, 0, 1],
                [1, 0.5, 1, 1],
                [1, 0]
            ]
        )]
]

import SwiftUI
#Preview {
    Glyshape(index: 4, color:.blue,
             weight:2,
             set:palmyre)
    .frame(width: 50, height: 50)
    .background(.clear)
}
