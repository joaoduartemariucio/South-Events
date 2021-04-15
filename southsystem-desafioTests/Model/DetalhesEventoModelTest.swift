//
//  DetalhesEventoModelTest.swift
//  southsystem-desafioTests
//
//  Created by João Vitor Duarte Mariucio on 14/04/21.
//

import XCTest
@testable import southsystem_desafio

class DetalhesEventoModelTest: XCTestCase {
    
    // MARK: - Mock Detalhes Evento
    let evento1 = EventoModelElement(
        id: "1",
        date: 1618450531,
        descriptionEvent: "Decricao do evento tan tan tan tan...",
        image: "https://southsystem.files.wordpress.com/2018/10/captura-de-tela-2018-10-19-acc80s-11-41-39.png",
        longitude: -49.7231291,
        latitude: -22.2307617,
        price: 50,
        title: "Nome do evento"
    )
    
    let evento2 = EventoModelElement()
    
    let detalhes1 = DetalhesEventoModel(eventoId: "1")
    let detalhes2 = DetalhesEventoModel(eventoId: "0")

    /// Cenario para testar evento com dados vazios
    func testEventoSemInformacoes() {
        
        detalhes2.setEventoDetalhes(evento2)
        
        XCTAssertTrue(detalhes2.detalhes?.id.isEmpty == true)
        XCTAssertTrue(detalhes2.detalhes?.title.isEmpty == true)
        XCTAssertTrue(detalhes2.detalhes?.date.timeIntervalSince1970 == 0)
        XCTAssertTrue(detalhes2.detalhes?.descriptionEvent.isEmpty == true)
        XCTAssertTrue(detalhes2.detalhes?.image.isEmpty == true)
        XCTAssertTrue(detalhes2.detalhes?.latitude == 0)
        XCTAssertTrue(detalhes2.detalhes?.longitude == 0)
        XCTAssertTrue(detalhes2.detalhes?.price == 0)
    }
    
    /// Cenario para testar evento com dados
    func testEventoComInformacoes() {
        
        detalhes2.setEventoDetalhes(evento1)
        
        XCTAssertFalse(detalhes2.detalhes?.id.isEmpty == true)
        XCTAssertFalse(detalhes2.detalhes?.title.isEmpty == true)
        XCTAssertFalse(detalhes2.detalhes?.date.timeIntervalSince1970 == 0)
        XCTAssertFalse(detalhes2.detalhes?.descriptionEvent.isEmpty == true)
        XCTAssertFalse(detalhes2.detalhes?.image.isEmpty == true)
        XCTAssertFalse(detalhes2.detalhes?.latitude == 0)
        XCTAssertFalse(detalhes2.detalhes?.longitude == 0)
        XCTAssertFalse(detalhes2.detalhes?.price == 0)
    }
    
    /// Cenario para testar evento com dados vazios
    func testEventoIdPreenchimento() {
        XCTAssertTrue(detalhes1.eventoId == "1")
        XCTAssertTrue(detalhes2.eventoId == "0")
    }
}
