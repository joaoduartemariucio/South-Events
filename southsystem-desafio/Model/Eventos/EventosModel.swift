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
    var descriptionEvent: String
    var image: String
    var longitude, latitude, price: Double
    var title, id: String
    
    init(id: String, date: Int, descriptionEvent: String, image: String, longitude: Double, latitude: Double, price: Double, title: String) {
        self.id = id
        self.date = date
        self.descriptionEvent = descriptionEvent
        self.image = image
        self.longitude = longitude
        self.latitude = latitude
        self.price = price
        self.title = title
    }
    
    init(codable: EventoCodableElement){
        self.id = codable.id
        self.date = codable.date
        self.descriptionEvent = codable.descriptionEvent
        self.image = codable.image
        self.latitude = codable.latitude
        self.longitude = codable.longitude
        self.price = codable.price
        self.title = codable.title
    }
    
    init(){
        self.id = ""
        self.date = 0
        self.descriptionEvent = ""
        self.image = ""
        self.latitude = 0
        self.longitude = 0
        self.price = 0
        self.title = ""
    }
    
    var description: String {
        return "<\(type(of: self)): id = \(id) title = \(title) description = \(descriptionEvent) image = \(image) price = \(price) latitude = \(latitude) longitude = \(longitude)>"
    }
}

typealias EventosModel = [EventoModelElement]
