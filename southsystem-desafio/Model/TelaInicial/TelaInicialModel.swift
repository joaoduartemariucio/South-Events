//
//  TelaInicialModel.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import Foundation

// MARK: - EventosCodableElement
class EventoModelElement {
    
    var date: Int
    var description: String
    var image: String
    var longitude, latitude, price: Double
    var title, id: String
    
    init(id: String, date: Int, description: String, image: String, longitude: Double, latitude: Double, price: Double, title: String) {
        self.id = id
        self.date = date
        self.description = description
        self.image = image
        self.longitude = longitude
        self.latitude = latitude
        self.price = price
        self.title = title
    }
    
    init(codable: EventoCodableElement){
        self.id = codable.id
        self.date = codable.date
        self.description = codable.description
        self.image = codable.image
        self.latitude = codable.latitude
        self.longitude = codable.longitude
        self.price = codable.price
        self.title = codable.title
    }
    
    init(codable: DetalhesEventoCodable){
        self.id = codable.id
        self.date = codable.date
        self.description = codable.description
        self.image = codable.image
        self.latitude = codable.latitude
        self.longitude = codable.longitude
        self.price = codable.price
        self.title = codable.title
    }
    
    init(){
        self.id = ""
        self.date = 0
        self.description = ""
        self.image = ""
        self.latitude = 0
        self.longitude = 0
        self.price = 0
        self.title = ""
    }
}

typealias EventosModel = [EventoModelElement]
