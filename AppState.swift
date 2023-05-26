//
//  AppState.swift
//  WWDC 2023 Faizal
//
//  Created by Faizal Hudya Rizfianto on 17/04/23.
//  Connecting to github repositories

import Foundation

final class AppState : ObservableObject {
    @Published var rootViewId = UUID()
}
