//
//  File.swift
//  
//
//  Created by Herve Crespel on 07/10/2023.
//

import Foundation



public var parle = true



struct Litteral<Langage:Languedata> {
    
    let codelangue:Langue.Code
    let ecriture:Ecriture
    let groupement:Groupement
    let greatest : Int

    var genre: Genre = .m
    
    private var value: Int = 0
    
    var base: Int = 10
    
    var powers = [100, 1000, 1000000, 1000000000, 1000000000000, 1000000000000000, 1000000000000000000]
    
    public init (_ kind:Langue.KindOfScript = .native){
        let langue = Langage(kind)

        ecriture = langue.ecriture
        groupement = langue.groupement
        greatest = langue.greatest
    }
    
    /*func makepowers() {
        var power = base
        powers = [base]
        for _ in 1...6 {
            power = power * base
            powers.append(power)
        }
    }*/
    
    

}
