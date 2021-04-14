//
//  FazerCheckinCodable.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 14/04/21.
//

import Foundation

// MARK: - FazerCheckinCodable
struct FazerCheckinCodable: Codable {
    
    let code: String?

    enum CodingKeys: String, CodingKey {
        case code
    }

    var description: String {
        return "<\(type(of: self)): code = \(code ?? "nil")>"
    }
}
