//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Nicolas Ströbel on 24.05.25.
//

import SwiftUI


class HomeViewModel: ObservableObject {
    
    var calories: Int = 123
    var active: Int = 52
    var stand: Int = 8
    
    @Published var mockActivities = [
        Activity(id: 0, title: "Heute", subtitle: "Schritte", image: "figure.walk", tintColor: .blue, amount: "10,000"),
        Activity(id: 1, title: "Morgen", subtitle: "Joggen", image: "figure.run", tintColor: .red, amount: "584"),
        Activity(id: 2, title: "Gestern", subtitle: "Pausen", image: "figure.stand", tintColor: .orange, amount: "3"),
        Activity(id: 3, title: "Übermorgen", subtitle: "Sex", image: "figure.socialdance.circle", tintColor: .green, amount: "5h")
    ]
    
    @Published var mockWorkouts = [
        Workout(id: 0, title: "Running", image: "figure.run", tintColor: .green, duration: "23 mins", date: "Aug 8", calories: "312 kcal"),
        Workout(id: 1, title: "Weight Lifting", image: "dumbbell", tintColor: .black, duration: "90 mins", date: "Aug 9", calories: "564 kcal"),
        Workout(id: 2, title: "Basketball", image: "figure.basketball", tintColor: .orange, duration: "90 mins", date: "Aug 20", calories: "684 kcal"),
        Workout(id: 3, title: "Fußball", image: "figure.soccer", tintColor: .blue, duration: "120 mins", date: "Aug 11", calories: "884 kcal")
    ]
}
