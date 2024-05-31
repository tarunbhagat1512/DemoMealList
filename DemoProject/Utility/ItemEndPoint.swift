//
//  ItemEndPoint.swift
//  DemoProject
//
//  Created by Zentech-038 on 31/05/24.
//

import Foundation

enum ItemEndPoint {
    case getAllItems

}

// https://fakestoreapi.com/products
extension ItemEndPoint: EndPointType {

    var path: String {
        switch self {
        case .getAllItems:
            return ""
        }
    }

    var baseURL: String {
        return "https://www.themealdb.com/api/json/v2/1/randomselection.php"

    }

    var url: URL? {
        return URL(string: "\(baseURL)")
    }

    var method: HTTPMethods {
        switch self {
        case .getAllItems:
            return.get
        }
    }

    var body: Encodable? {
        switch self {
        case .getAllItems:
            return nil
        }
    }

    var headers: [String : String]? {
        ApiManager.commonHeaders
    }
}
