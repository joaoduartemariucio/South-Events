//
//  EventosCodable.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import Foundation

// MARK: - EventosCodableElement
struct EventoCodableElement: Codable {
    
    let id: String
    let date: Double
    let descriptionEvent: String
    let image: String
    let longitude, latitude, price: Double
    let title: String

    enum CodingKeys: String, CodingKey {
        case date
        case descriptionEvent = "description"
        case image, longitude, latitude, price, title, id
    }

    var description: String {
        return "<\(type(of: self)): id = \(id) title = \(title) description = \(descriptionEvent) image = \(image) price = \(price) latitude = \(latitude) longitude = \(longitude)>"
    }
}

typealias EventosCodable = [EventoCodableElement]
