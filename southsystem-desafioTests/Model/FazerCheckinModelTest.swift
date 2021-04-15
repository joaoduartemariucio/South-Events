//
//  FazerCheckinModelTest.swift
//  southsystem-desafioTests
//
//  Created by João Vitor Duarte Mariucio on 14/04/21.
//

import XCTest
@testable import southsystem_desafio

class FazerCheckinModelTest: XCTestCase {
    
    // MARK: - Mock Fazer Check-in
    let checkin1 = FazerCheckinModel(eventId: "1", name: "Joao Vitor", email: "joaovitorduartemariucio@gmail.com")
    let checkin2 = FazerCheckinModel()
    
    /// Cenario para testar check-in com dados vazios
    func testCheckinSemInformacoes() {
        XCTAssertTrue(checkin2.eventId.isEmpty)
        XCTAssertTrue(checkin2.name.isEmpty)
        XCTAssertTrue(checkin2.email.isEmpty)
    }
    
    /// Cenario para testar check-in com dados
    func testCheckinComInformacoes() {
        XCTAssertTrue(checkin1.eventId == "1")
        XCTAssertTrue(checkin1.name == "Joao Vitor")
        XCTAssertTrue(checkin1.email == "joaovitorduartemariucio@gmail.com")
    }
    
    /// Cenario para testar função setEventId do check-in
    func testSetEventId() {
        checkin1.setEventId("2")
        XCTAssertTrue(checkin1.eventId == "2")
    }
    
    /// Cenario para testar função setName do check-in
    func testSetName() {
        checkin1.setName("João Vitor")
        XCTAssertTrue(checkin1.name == "João Vitor")
    }
    
    /// Cenario para testar função setEmail do check-in
    func testSetEmail() {
        checkin1.setEmail("jvdmtester@gmail.com")
        XCTAssertTrue(checkin1.email == "jvdmtester@gmail.com")
    }
}
