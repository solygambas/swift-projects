//
//
// Item.swift
// Todo List
//
// Created by Solygambas on 27/04/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import Foundation
        

struct Item: Identifiable {
    let id = UUID()
    var todo: String
}
