//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Nicolas Ströbel on 24.05.25.
//

import SwiftUI


class HomeViewModel: ObservableObject {
    
    let healthManager = HealthManager.shared
    
    @Published var calories: Int = 123
    @Published var exercise: Int = 52
    @Published var stand: Int = 8
    
    @Published var activities = [Activity]()
    
    @Published var mockActivities = [
        Activity(title: "Heute", subtitle: "Schritte", image: "figure.walk", tintColor: .blue, amount: "10,000"),
        Activity(title: "Morgen", subtitle: "Joggen", image: "figure.run", tintColor: .red, amount: "584"),
        Activity(title: "Gestern", subtitle: "Pausen", image: "figure.stand", tintColor: .orange, amount: "3"),
        Activity(title: "Übermorgen", subtitle: "Sex", image: "figure.socialdance.circle", tintColor: .green, amount: "5h")
    ]
    
    @Published var mockWorkouts = [
        Workout(id: 0, title: "Running", image: "figure.run", tintColor: .green, duration: "23 mins", date: "Aug 8", calories: "312 kcal"),
        Workout(id: 1, title: "Weight Lifting", image: "dumbbell", tintColor: .black, duration: "90 mins", date: "Aug 9", calories: "564 kcal"),
        Workout(id: 2, title: "Basketball", image: "figure.basketball", tintColor: .orange, duration: "90 mins", date: "Aug 20", calories: "684 kcal"),
        Workout(id: 3, title: "Fußball", image: "figure.soccer", tintColor: .blue, duration: "120 mins", date: "Aug 11", calories: "884 kcal")
    ]
    
    init() {
        Task {
            do {
                try await healthManager.requestHealthKitAccess()
                fetchTodayCalories()
                // fetchTodayExerciseTime()     // Geht nur mit Apple Watch !
                fetchTodayStandHours()
                fetchTodaySteps()
                fetchCurrentWeekActivities()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchTodayCalories() {
        healthManager.fetchTodayCaloriesBurned { result in
            switch result {
            case .success(let calories):
                DispatchQueue.main.async {
                    self.calories = Int(calories)
                    let activity = Activity(title: "Calories Burned",
                                            subtitle: "today",
                                            image: "flame",
                                            tintColor: .red,
                                            amount: calories.formattedNumberString())
                    self.activities.append(activity)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchTodayExerciseTime() {
        healthManager.fetchTodayExerciseTime { result in
            switch result {
            case .success(let exercise):
                DispatchQueue.main.async {
                    self.exercise = Int(exercise)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchTodayStandHours() {
        healthManager.fetchTodayStandHours { result in
            switch result {
            case .success(let hours):
                DispatchQueue.main.async {
                    self.stand = hours
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    // MARK: Fitness Activity
    func fetchTodaySteps() {
        healthManager.fetchTodaySteps { result in
            switch result {
            case .success(let activity):
                DispatchQueue.main.async {
                    self.activities.append(activity)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchCurrentWeekActivities() {
        healthManager.fetchCurrentWeekWorkoutStats { result in
            switch result {
            case .success(let activities):
                DispatchQueue.main.async {
                    self.activities.append(contentsOf: activities)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
