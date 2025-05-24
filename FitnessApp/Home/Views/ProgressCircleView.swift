//
//  ProgressCircleView.swift
//  FitnessApp
//
//  Created by Nicolas Ströbel on 20.05.25.
//

import SwiftUI


struct ProgressCircleView: View {
    
    @Binding var progress: Int
    
    var color: Color
    var goal: Int
    private let width: CGFloat = 20
    
    var body: some View {
        
        ZStack {
            Circle()
                .stroke(color.opacity(0.3), lineWidth: width)   // sorgt für Kreis ohne Füllung
            
            Circle()
                .trim(from: 0, to: CGFloat(progress) / CGFloat(goal))    // Kürzt den Kreis (wie bei Tortendiagramm) -> Zeigt Verhältnis von Fortschritt zu Ziel
                .stroke(
                    color,
                    style: StrokeStyle(lineWidth: width,
                                       lineCap: .round)     // Rundet die enden des gekürzten Kreises
                )
                .rotationEffect(.degrees(-90))                    // Setzt den Startpunkt des Kreises an andere Stelle
                .shadow(radius: 5)
        }
    }
}

#Preview {
    ProgressCircleView(progress: .constant(100), color: .red, goal: 200)
}
