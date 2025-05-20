//
//  ContentView.swift
//  FitnessApp
//
//  Created by Nicolas Ströbel on 20.05.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "dumbbell.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Fitness jetzt gehts los !!!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
