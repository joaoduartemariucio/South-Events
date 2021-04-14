//
//  DetalhesEventoModel.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import Foundation

class DetalhesEventoModel {
    
    var eventoId: String
    var detalhes: DetalhesEventoCodable?
    
    init(eventoId: String) {
        self.eventoId = eventoId
    }
    
    init() {
        eventoId = "0"
    }
    func setEventoId(id: String){
        self.eventoId = id
    }
}
