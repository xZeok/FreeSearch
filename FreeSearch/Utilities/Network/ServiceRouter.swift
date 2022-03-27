//
//  Router.swift
//  FreeSearch
//
//  Created by Jaime Capponi Zerene on 26-03-22.
//

enum ServiceRouter {
    
    enum Constants {
        static let baseURL = "https://api.mercadolibre.com/"
    }
    
    public typealias Parameters = [String: Any]

    case getItems(parameters: Parameters)
    
    enum Method: String {
        case get = "GET"
        case post = "POST"
        case delete = "DELETE"
    }
    
    var method: Method {
        switch self {
        case .getItems:
            return .get
        }
    }
    
    var url: String {
        var endpoint = ""
        switch self {
        case .getItems:
            endpoint = "sites/MLC/search"
        }
        return "\(Constants.baseURL)\(endpoint)"
    }
    
    var parameters: Parameters {
        switch self {
        case .getItems(let params):
            return params
        }
    }
}
