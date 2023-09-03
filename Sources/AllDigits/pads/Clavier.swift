//
//  Clavier.swift
//  
//
//  Created by Herve Crespel on 01/09/2023.
//

import SwiftUI

struct Clavier: View {
    
 /*   public enum Kind: String {
        case simple     = "1 chiffre"
        case digit60    = "chiffre composé d'un ou deux glyphes cunéiformes "
        case chinois    = "composition d'un groupe chinois"
        case indien     = "composition d'un groupe indien"
        case additif    = "additif antique"
    }
    public var kind:Kind {
        switch numicode {
        case .babylon, .sumer60:
            return .digit60
        case .hanzi, .kanji, .kor:
            return .chinois
        case .roman, .attic, .aegypt :
            return .additif
        default:
            return .simple
        }
    }*/
    
    init(_ numic:Numicode) {
        numicode = numic
    }
    
    var numicode = Numicode.global
    var mesure = Mesure()
    var linear = false
    
    var body: some View {
        if Mesopotamie.cuneicodes.contains(numicode) {
            Cuneipad()
        } else {
            Unipad(width: mesure.width*0.3, height: linear ? 70 : mesure.height*0.3, linear:linear)
        }
    }
    
    
    /* à corriger et compléter compléter
    public func pave(_ index:Int = 0, _ clavier: Clavier = .simple)->[String] {
        // 0 -> pavé des unités
        let nbp = glyphes.count
        if clavier == .simple {
            return glyphes[nbp-1]
        } else {
            if clavier == .digit60 {
                return glyphes[0]
            } else {
                let p = index % nbp
                return glyphes[nbp-1 - p]
            }
        }

    }
    
    public func glyphe(_ touchvalue:Int, _ touchpower:Int)-> String {
        
        let pave = touches(touchpower)
        if touchvalue < pave.count {
            return pave[touchvalue]
        } else {
            return "?"  // Toucheset incomplet
        }
    }
    public func touches(_ touchpower:Int)->[String] {
        let nbpave = glyphes.count
        if nbpave == 1 {
            return glyphes[0]
        } else {

            if touchpower == 0 {
                return glyphes[nbpave-1]
            } else {
                let set = touchpower % nbpave
                return glyphes[nbpave-set-1]
            }
        }
    }

    
 /*   public var antikzero:[Int] {
        var touches:[Int] = []
        for _ in 0..<glyphes.count {
            touches.append(0)
        }
        return touches
    }*/
    
    public func passlock(_ touchcount:Int)->Bool{
        return touchcount >= glyphes.count
    }
    */
}


