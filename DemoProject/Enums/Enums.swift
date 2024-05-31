//
//  Enums.swift
//  DemoProject
//
//  Created by Zentech-038 on 31/05/24.
//

import Foundation

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

enum Event {
    case loading
    case stopLoading
    case dataLoaded
    case error(Error?)
}
