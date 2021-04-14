//
//  FazerCheckinRouter.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 14/04/21.
//

import Foundation
import Alamofire

enum FazerCheckinRouter: APIConfiguration {
    
    case fazerCheckin(dadosCheckin: FazerCheckinModel)
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        default:
            return .post
        }
    }
    
    // MARK: - Parameters
    var parameters: RequestParams {
        switch self {
        case .fazerCheckin(let dadosCheckin):
            return .body([
                Constants.API.ParametersKeys.eventId: dadosCheckin.eventId,
                Constants.API.ParametersKeys.name: dadosCheckin.name,
                Constants.API.ParametersKeys.email: dadosCheckin.email
            ])
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .fazerCheckin:
            return Constants.API.Routes.fazerCheckin
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

