//
//  Constants.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import Foundation
import UIKit

struct Constants {
    
    struct API {
        
        struct ProductionServer {
            static let baseURL = "http://5f5a8f24d44d640016169133.mockapi.io/api"
        }
        
        struct Routes {
            static let buscarEventos = "/events"
            static let fazerCheckin = "/checkin"
        }
        
        struct ParametersKeys {
           static let eventId = "eventId"
           static let name = "name"
           static let email = "email"
        }
    }
    
    struct APP {
        
        static let name = "South Events"
        
        struct Key {
            
        }
        
        struct Image {
            static let erro_download_image = "erro_download_image"
            static let fake_blur_image = "fake_blur_image"
            static let ic_voltar = "ic_voltar"
            static let ic_como_chegar = "ic_como_chegar"
            static let ic_arroba = "ic_arroba"
            static let ic_pessoa = "ic_pessoa"
        }
    }
}
