//
//  APIErrorMessageHelper.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 14/04/21.
//

import Foundation

class APIErrorMessageHelper {
     
    static let instance = APIErrorMessageHelper()
    
    func retornaMensagemErroAPI(erro: APIError) -> String {
        switch erro {
        case .noDecoded:
            return "erro_noDecoded".translate
        case .noContent:
            return "erro_noContent".translate
        case .badRequest:
            return "erro_badRequest".translate
        case .unauthorized:
            return "erro_unauthorized".translate
        case .forbidden:
            return "erro_forbidden".translate
        case .notFound:
            return "erro_notFound".translate
        case .noAllowed:
            return "erro_noAllowed".translate
        case .conflict:
            return "erro_conflict".translate
        case .internalServerError:
            return "erro_internalServerError".translate
        }
    }
}
