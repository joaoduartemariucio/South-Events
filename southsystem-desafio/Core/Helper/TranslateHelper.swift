//
//  TranslateHelper.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import Foundation

class TranslateHelper {
    
    class func translate(_ key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
