//
//  DetalhesEventoCodable.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import Foundation
// MARK: - DetalhesEventoCodable
struct DetalhesEventoCodable: Codable {
    
    let date: Int
    let description: String
    let image: String
    let longitude, latitude, price: Double
    let title, id: String

    enum CodingKeys: String, CodingKey {
        case date
        case description = "description"
        case image, longitude, latitude, price, title, id
    }
}
