//
//  ChiffreHexa64.swift
//  multikalk
//
//  Created by Herve Crespel on 23/11/2021.
//

import SwiftUI

struct ChiffreHexa64: View {
    var value = 15
    var size: CGFloat = 5
    var color = Color("glyph")
    
    var body: some View {
        VStack(spacing:size/2) {
            TrigramIcon(value: yins(value%8), size: size)
            TrigramIcon(value: yins((value - value%8)/8), size:size)
        }.background(color)
            .padding(size/3)
    }
    
    func yins(_ val:Int)->[Int]{
        var tabint : [Int] = []
        var reduce : Int = val
        for _ in 0...2 {
            let yin = reduce%2
            tabint.append(yin)
            reduce = (reduce - yin)/2
        }
        return tabint.reversed()
    }
}

struct ChiffreHexa64_Previews: PreviewProvider {
    static var previews: some View {
        ChiffreHexa64()
        ChiffreHexa64(size:3)
    }
}
