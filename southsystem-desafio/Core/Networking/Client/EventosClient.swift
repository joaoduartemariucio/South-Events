//
//  EventosClient.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import Foundation

class EventosClient: APIClient {
    
    static func buscarEventos() -> Observable<EventosCodable> {
        return request(EventosRouter.buscarEventos)
    }
    
    static func buscarDetalhesEvento(id: String) -> Observable<DetalhesEventoCodable> {
        return request(EventosRouter.buscarDetalhesEvento(id: id))
    }
}
