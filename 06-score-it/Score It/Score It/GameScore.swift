//
//
// GameScore.swift
// Score It
//
// Created by Solygambas on 28/04/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import Foundation

class GameScore: ObservableObject {
    @Published var score = 0
    @Published var pieces = 0
}
