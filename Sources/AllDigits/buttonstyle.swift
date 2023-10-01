//
//  SwiftUIView.swift
//  
//
//  Created by Herve Crespel on 01/10/2023.
//

import SwiftUI
import Digiconf

extension View {
   // public func configTouch(_ config:Digiconfig )
    
    public func fond(w:CGFloat, h:CGFloat) -> some View {
        let config = Digiconfig(w,h,0,.black,.clear,.gray )
        return configTouch(config)
    }
    
    public func modern(w:CGFloat, h:CGFloat) -> some View {
        let config = Digiconfig(w,h,0,.black,.clear,.gray )
        return configTouch(config)
    }
    
    public func param(w:CGFloat, h:CGFloat) -> some View {
        let config = Digiconfig(w,h,0,.white,.clear,.gray )
        return configTouch(config)
    }
}



