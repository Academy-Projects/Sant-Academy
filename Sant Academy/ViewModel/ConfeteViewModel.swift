//
//  ConfeteViewModel.swift
//  Sant Academy
//
//  Created by kevin marinho on 15/12/22.
//

import Foundation
import SwiftUI
//
//funcao criada para animacao de confetti quando o usuario ganhar o game
// geometryEffect criado para definir o tempo, velocidade e direcao dos efeitos criados
struct ConfettiParticle: GeometryEffect {
    var time: Double
    var speed = Double.random(in: 20 ... 200)
    var direction = Double.random(in: -Double.pi ... Double.pi)
    // get e set criado para definir inicio de fim da animacao
    var animatableData: Double {
        get { time }
        set { time = newValue }
    }
    // funcao para criar setar velocidade, direcao e tempo do efeito na tela
    func effectValue(size: CGSize) -> ProjectionTransform {
        let xTranslation  = speed * cos(direction) * time
        let yTranslation = speed * sin(direction) * time
        let affineTranslation = CGAffineTransform(translationX: xTranslation, y: yTranslation)
        return ProjectionTransform(affineTranslation)
    }
}
//modificao de particular depois da funcao ser chamada
struct ParticlesModifier: ViewModifier {
    //variaveis de escala, tempo e duracao
    @State var time = 0.0
    @State var scale = 0.1
    let duration = 5.0
    // criacao da funcao para que seja chamada como atributo na classe
    func body(content: Content) -> some View {
        ZStack{
            ForEach(0..<80, id: \.self){ index in
                content
                    .hueRotation(Angle(degrees: time * 80))
                    .scaleEffect(scale)
                    .modifier(ConfettiParticle(time: time))
                    .opacity(((duration-time) / duration))
//                    .opacity(duration-time / duration)
            }
        }
        .onAppear{
            withAnimation(.easeOut(duration: duration)){
                self.time = duration
                self.scale = 1.0
            }
        }
    }
}


