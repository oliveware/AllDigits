//
//  ButtonDesign.swift
//  multikalk
//
//  Created by Herve Crespel on 19/11/2021.
//

import SwiftUI

struct TouchStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    var fore: Color
    var back: Color
    var press: Color
    var width: CGFloat
    var height: CGFloat
    var fonte: Font
    var padding = 7.0
    
      func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: width, height: height)
            .font(fonte)
            .padding(padding)
            .foregroundColor(configuration.isPressed ? press : fore)
            .background(isEnabled ? back : Color("disabled"))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .cornerRadius(8)
      }
}

extension View {
      func styleTouch(
        fore: Color = .white,
        back: Color = .gray,
        press: Color = Color("press"),
        width: CGFloat = 20,
        height: CGFloat = 20,
        fonte : Font = .title,
        padding: CGFloat = 7.0
      ) -> some View {
        self.buttonStyle(
          TouchStyle(
            fore: fore,
            back: back,
            press: press,
            width: width,
            height: height,
            fonte: fonte,
            padding:padding
          )
        )
      }
    func ariop(w:CGFloat,h:CGFloat)->some View {
        styleTouch(fore: Color("arifore"), back: Color("ariback"), width:w, height: h,fonte:.largeTitle)
    }
    func mathop(size:CGFloat)->some View {
        styleTouch(fore: Color("mathfore"), back: Color("mathback"), width: size*1.5, height: size, fonte:.title)
    }
    func trigo(size:CGFloat)->some View {
        styleTouch(fore: Color("trigofore"), back: Color("trigoback"), width: size*1.5, height: size, fonte:.title)
    }
    func modern(w:CGFloat,h:CGFloat)->some View {
        styleTouch(width: w, height: h, fonte:.title)
    }
    func dot(size:CGFloat)->some View {
        styleTouch(fore: Color("touche"), back: Color("glyph"), width: size, height: size, fonte:.title)
    }
    func special(w:CGFloat,h:CGFloat)->some View {
        styleTouch(fore: Color("specialfore"), back: Color("specialback"), width: w, height: h, fonte:.largeTitle)
    }
    func antik(size:CGFloat)->some View {
        styleTouch(fore: Color("glyph"), back: Color("touche"), width: size*1.7, height: size, fonte:.title)
    }
    func pass(size:CGFloat)->some View {
        styleTouch(fore: Color.white, back: Color("touche"), width: size*1, height: size*2.5, fonte:.title2)
    }
    func graphic(size:CGFloat)->some View {
        styleTouch(fore: .green, back: Color("glyph"), width: size, height: size)
    }
    func fond(w:CGFloat,h:CGFloat)->some View {
        styleTouch(fore: Color("glyph"), back: Color("showback"), width:w, height: h,fonte:.title2)
    }
    func plumoins(size:CGFloat)->some View {
        styleTouch(fore: Color.white, back: Color.gray, width:size, height: size*0.4, fonte:.title)
    }
    func blank(size:CGFloat)->some View {
        styleTouch(fore: Color("glyph"), back: Color.clear, width:size, height: size*0.3, fonte:.title)
    }
    func tige(w:CGFloat,h:CGFloat)->some View {
        styleTouch(fore: Color("glyph"), back: Color.clear, width:w, height: h, fonte:.title, padding:0)
    }
    func boule(w:CGFloat,h:CGFloat)->some View {
        styleTouch(back: Color.clear, width:w, height: h, padding:2.0)
    }
    func param(w:CGFloat,h:CGFloat)->some View {
        styleTouch(fore: Color.white, back: Color.gray, width:w, height: h, fonte:.body)
    }
}

struct ButtonDesign: View {
    var body: some View {
        VStack(spacing:7) {
            HStack {
                Text("mathop").frame(width:80,alignment: .leading)
                Button("log", action: { })
                    .mathop(size:25)
                Button("tan", action: { })
                    .trigo(size:25)
            }
            HStack {
                Text("special").frame(width:80,alignment: .leading)
                Button("e", action: { })
                    .special(w:25, h:25)
            }
            HStack {
                Text("modern").frame(width:80,alignment: .leading)
                Button("N", action: { })
                    .modern(w:20,h:20)
                Button(",", action: { })
                    .dot(size:17)
            }
            HStack {
                Text("antik").frame(width:80,alignment: .leading)
                Button("CM", action: { })
                    .antik(size:20)
            }
            HStack(spacing:2) {
                Text("ariop").frame(width:80,alignment: .leading)
                Button("+", action: { })
                    .ariop(w:20,h:20)

                Button("-", action: { })
                    .ariop(w:20,h:20)
            }.frame(alignment:.trailing)
            HStack {
                Text("egal").frame(width:80,alignment: .leading)
                Button("=", action: { })
                    .ariop(w:60,h:20)
            }.frame(alignment:.trailing)
            HStack {
                Text("blank").frame(width:80,alignment: .leading)
                Button(">", action: { })
                    .blank(size:60)
            }.frame(alignment:.trailing)

        }
    }
}

struct ButtonDesign_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDesign()
    }
}
