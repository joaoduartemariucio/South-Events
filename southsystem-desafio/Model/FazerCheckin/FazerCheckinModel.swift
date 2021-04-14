//
//  FazerCheckinModel.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 14/04/21.
//

import Foundation

class FazerCheckinModel {
    
    var eventId: String
    var name: String
    var email: String
    
    init(eventId: String, name: String, email: String) {
        self.eventId = eventId
        self.name = name
        self.email = email
    }
    
    init() {
        self.eventId = ""
        self.name = ""
        self.email = ""
    }

    func setEventId(_ id: String) {
        self.eventId = id
    }
    
    func setName(_ name: String) {
        self.name = name
    }
    
    func setEmail(_ email: String) {
        self.email = email
    }
    
    var description: String {
        return "<\(type(of: self)): eventId = \(eventId) name = \(name) email = \(email)>"
    }
}
