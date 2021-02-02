//
//  FoodModel.swift
//  Mey Food
//
//  Created by IndratS on 01/02/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//

import Foundation

struct FoodModel: Codable {
    let offset, number: Int
    let results: [Results]
    let totalResults: Int
}

// MARK: - Result
struct Results: Codable {
    let id, calories: Int?
    let carbs, fat: String?
    let image: String?
    let imageType, protein, title: String?
}
