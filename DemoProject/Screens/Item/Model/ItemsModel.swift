//
//  ItemsModel.swift
//  DemoProject
//
//  Created by Zentech-038 on 31/05/24.
//

import Foundation

struct Measl: Codable {
    var meals: [ItemsModel]
}

struct ItemsModel: Codable {
    var idMeal: String?
    var strMeal: String?
    var strCategory: String?
    var strInstructions: String?
    var strMealThumb: String?
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?
    
    init(idMeal: String, strMeal: String, strCategory: String, strInstructions: String, strMealThumb: String, strIngredient1: String, strIngredient2: String, strIngredient3: String, strIngredient4: String, strIngredient5: String, strIngredient6: String, strIngredient7: String, strIngredient8: String, strIngredient9: String, strIngredient10: String, strIngredient11: String, strIngredient12: String, strIngredient13: String, strIngredient14: String, strIngredient15: String, strIngredient16: String, strIngredient17: String, strIngredient18: String, strIngredient19: String, strIngredient20: String) {
        self.idMeal = idMeal
        self.strMeal = strMeal
        self.strCategory = strCategory
        self.strInstructions = strInstructions
        self.strMealThumb = strMealThumb
        self.strIngredient1 = strIngredient1
        self.strIngredient2 = strIngredient2
        self.strIngredient3 = strIngredient3
        self.strIngredient4 = strIngredient4
        self.strIngredient5 = strIngredient5
        self.strIngredient6 = strIngredient6
        self.strIngredient7 = strIngredient7
        self.strIngredient8 = strIngredient8
        self.strIngredient9 = strIngredient9
        self.strIngredient10 = strIngredient10
        self.strIngredient11 = strIngredient11
        self.strIngredient12 = strIngredient12
        self.strIngredient13 = strIngredient13
        self.strIngredient14 = strIngredient14
        self.strIngredient15 = strIngredient15
        self.strIngredient16 = strIngredient16
        self.strIngredient17 = strIngredient17
        self.strIngredient18 = strIngredient18
        self.strIngredient19 = strIngredient19
        self.strIngredient20 = strIngredient20
    }
    
    init() {}
    
}
