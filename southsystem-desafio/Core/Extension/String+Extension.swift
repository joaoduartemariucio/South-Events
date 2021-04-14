//
//  String+Extension.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import Foundation

extension String {
    
    var translate: String {
        get {
            return TranslateHelper.translate(self)
        }
    }
}
