//
//  FazerCheckinClient.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 14/04/21.
//

import Foundation

class FazerCheckinClient: APIClient {
    
    static func fazerCheckin(dadosCheckin: FazerCheckinModel) -> Observable<FazerCheckinCodable> {
        return request(FazerCheckinRouter.fazerCheckin(dadosCheckin: dadosCheckin))
    }
}
