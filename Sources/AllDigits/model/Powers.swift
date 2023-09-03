//
//  File.swift
//  
//
//  Created by Herve Crespel on 19/11/2021.
//

import Foundation

public struct Powers {
    public var group: [String] = []  //["1000","10 000", "100 000"]
    public var digit: [String] = []   //["1","10","100"]
    
    private var power = 1
    
    public init(_ base:Int, _ groupby:Int,_ nb:Int = 3) {
        for _ in 1...groupby {
            digit.append(String(power))
            power *= base
        }
        digit.reverse()
        let groupower = power
        for i in 1...nb {
            group.append(String(power))
            // pour éviter un overflow !
            if i < nb && power < 100000000 {
                power *= groupower
            }
        }
        group.reverse()
        print(digit)
    }
}
    
   
