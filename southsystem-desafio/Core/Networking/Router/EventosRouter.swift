//
//  EventosRouter.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import Foundation

import Foundation
import Alamofire

enum EventosRouter: APIConfiguration {
    
    case buscarEventos
    case buscarDetalhesEvento(id: String)
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    // MARK: - Parameters
    var parameters: RequestParams {
        switch self {
        case .buscarEventos:
            return .url([:])
        case .buscarDetalhesEvento:
            return .url([:])
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .buscarEventos:
            return Constants.API.Routes.buscarEventos
        case .buscarDetalhesEvento(let id):
            var basePath = Constants.API.Routes.buscarEventos
            basePath.append("/")
            basePath.append(id)
            return basePath
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        let url = try Constants.API.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        switch parameters {
        
        case .body(let params):
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            
        case .url(let params):
            let queryParams = params.map { pair  in
                return URLQueryItem(name: pair.key, value: "\(pair.value)")
            }
            var components = URLComponents(string:url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            urlRequest.url = components?.url
        }
        
        return urlRequest
    }
}

