//
//  EventosCodable.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import Foundation

// MARK: - EventosCodableElement
struct EventoCodableElement: Codable {
    
    let date: Int
    let eventosCodableDescription: String
    let image: String
    let longitude, latitude, price: Double
    let title, id: String

    enum CodingKeys: String, CodingKey {
        case date
        case eventosCodableDescription = "description"
        case image, longitude, latitude, price, title, id
    }
}

typealias EventosCodable = [EventoCodableElement]
