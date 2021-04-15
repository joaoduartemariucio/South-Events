//
//  TelaInicialModel.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import Foundation

// MARK: - EventoModelElement
class EventoModelElement {
    
    let dateFormatterr = DateFormatter()
    
    private (set) var id: String
    private (set) var date: Date
    private (set) var descriptionEvent: String
    private (set) var image: String
    private (set) var longitude, latitude, price: Double
    private (set) var title: String
    
    init(id: String, date: Double, descriptionEvent: String, image: String, longitude: Double, latitude: Double, price: Double, title: String) {
        self.id = id
        self.date = Date(timeIntervalSince1970: date)
        self.descriptionEvent = descriptionEvent
        self.image = image
        self.longitude = longitude
        self.latitude = latitude
        self.price = price
        self.title = title
    }
    
    init(codable: EventoCodableElement){
        self.id = codable.id
        self.date = Date(timeIntervalSince1970: codable.date)
        self.descriptionEvent = codable.descriptionEvent
        self.image = codable.image
        self.latitude = codable.latitude
        self.longitude = codable.longitude
        self.price = codable.price
        self.title = codable.title
    }
    
    init(){
        self.id = ""
        self.date = Date(timeIntervalSince1970: 0)
        self.descriptionEvent = ""
        self.image = ""
        self.latitude = 0
        self.longitude = 0
        self.price = 0
        self.title = ""
    }
    
    func getDataHoraString(formato: String) -> String {
        dateFormatterr.dateFormat = formato
        return dateFormatterr.string(from: self.date)
    }
    
    func getDataHoraString(fmtHora: DateFormatter.Style, fmtData: DateFormatter.Style) -> String {
        dateFormatterr.timeStyle = fmtHora
        dateFormatterr.dateStyle = fmtData
        return dateFormatterr.string(from: self.date)
    }
    
    var description: String {
        return "<\(type(of: self)): id = \(id) title = \(title) description = \(descriptionEvent) image = \(image) price = \(price) latitude = \(latitude) longitude = \(longitude)>"
    }
}

typealias EventosModel = [EventoModelElement]
