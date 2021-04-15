//
//  EventoModelElementTest.swift
//  southsystem-desafioTests
//
//  Created by João Vitor Duarte Mariucio on 14/04/21.
//

import XCTest
@testable import southsystem_desafio

class EventoModelElementTest: XCTestCase {
    
    // MARK: - Mock Eventos
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
    
    let evento2 = EventoModelElement(
        id: "1",
        date: 1618450531,
        descriptionEvent: "Decricao do evento tan tan tan tan...",
        image: "https://southsystem.files.wordpress.com/2018/10/captura-de-tela-2018-10-19-acc80s-11-41-39.png",
        longitude: -49.7231291,
        latitude: -22.2307617,
        price: 50,
        title: "Nome do evnto"
    )
    
    let evento3 = EventoModelElement()
    
    /// Cenario para testar evento com dados vazios
    func testEventoSemInformacoes() {
        XCTAssertTrue(evento3.id.isEmpty)
        XCTAssertTrue(evento3.title.isEmpty)
        XCTAssertTrue(evento3.date.timeIntervalSince1970 == 0)
        XCTAssertTrue(evento3.descriptionEvent.isEmpty)
        XCTAssertTrue(evento3.image.isEmpty)
        XCTAssertTrue(evento3.latitude == 0)
        XCTAssertTrue(evento3.longitude == 0)
        XCTAssertTrue(evento3.price == 0)
    }
    
    /// Cenario para testar array de eventos sem eventos
    func testArrayDeEventoSemEventos() {
        let eventos = EventosModel()
        XCTAssertTrue(eventos.isEmpty)
    }
    
    /// Cenario para testar array de eventos sem eventos
    func testArrayDeEventoComEventos() {
        let eventos = [evento1, evento2, evento3]
        XCTAssertFalse(eventos.isEmpty)
        XCTAssertTrue(eventos.count > 0)
        XCTAssertTrue(eventos.count == 3)
    }
    
    /// Cenario para testar conversão para dia de uma data de evento
    func testConversaoDiaDeUmaDataEvento() {
        let dia = evento1.getDataHoraString(formato: "dd")
        XCTAssertTrue(dia == "14")
        XCTAssertTrue(dia.count == 2)
        XCTAssertFalse(dia.isEmpty)
    }
    
    /// Cenario para testar conversão para hora de uma data de evento
    func testConversaoMesDeUmaDataEvento() {
        let mes = evento1.getDataHoraString(formato: "MMM")
        XCTAssertTrue(mes == "Apr")
        XCTAssertTrue(mes.count == 3)
        XCTAssertFalse(mes.isEmpty)
    }
    
    /// Cenario para testar se title está com preenchimento correto
    func testTitlePreenchido() {
        XCTAssertTrue(evento1.title == "Nome do evento")
        XCTAssertFalse(evento1.title.isEmpty)
    }
    
    /// Cenario para testar se descriptionEvent está com preenchimento correto
    func testDescriptionEventPreenchido() {
        XCTAssertTrue(evento1.descriptionEvent == "Decricao do evento tan tan tan tan...")
        XCTAssertFalse(evento1.descriptionEvent.isEmpty)
    }
    
    /// Cenario para testar se image está com preenchimento correto
    func testImagePreenchido() {
        XCTAssertTrue(evento1.image == "https://southsystem.files.wordpress.com/2018/10/captura-de-tela-2018-10-19-acc80s-11-41-39.png")
        XCTAssertFalse(evento1.image.isEmpty)
    }
    
    /// Cenario para testar se price está com preenchimento correto
    func testPricePreenchido() {
        XCTAssertTrue(evento1.price == 50)
    }
    
    /// Cenario para testar se latitude está com preenchimento correto
    func testLatitudePreenchido() {
        XCTAssertTrue(evento1.latitude == -22.2307617)
    }
    
    /// Cenario para testar se longitude está com preenchimento correto
    func testLongitudePreenchido() {
        XCTAssertTrue(evento1.longitude == -49.7231291)
    }
    
    /// Cenario para testar se date está com preenchimento correto
    func testDatePreenchido() {
        XCTAssertTrue(evento1.date.timeIntervalSince1970 == 1618450531)
    }
}
