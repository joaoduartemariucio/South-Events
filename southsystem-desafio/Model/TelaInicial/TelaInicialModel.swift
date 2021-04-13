//
//  TelaInicialModel.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import Foundation

// MARK: - EventosCodableElement
class EventoModelElement {
    
    let date: Int
    let eventosCodableDescription: String
    let image: String
    let longitude, latitude, price: Double
    let title, id: String
    
    init(id: String, date: Int, eventosCodableDescription: String, image: String, longitude: Double, latitude: Double, price: Double, title: String) {
        self.id = id
        self.date = date
        self.eventosCodableDescription = eventosCodableDescription
        self.image = image
        self.longitude = longitude
        self.latitude = latitude
        self.price = price
        self.title = title
    }
    
    init(codable: EventoCodableElement){
        self.id = codable.id
        self.date = codable.date
        self.eventosCodableDescription = codable.eventosCodableDescription
        self.image = codable.image
        self.latitude = codable.latitude
        self.longitude = codable.longitude
        self.price = codable.price
        self.title = codable.title
    }
}

typealias EventosModel = [EventoModelElement]
