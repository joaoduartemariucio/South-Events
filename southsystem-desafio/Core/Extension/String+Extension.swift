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
    
    var isValidEmail: Bool {
        get {
            
            let textRegx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let textPred = NSPredicate(format:"SELF MATCHES %@", textRegx)
            
            if textPred.evaluate(with: self) {
                return true
            }else {
                return false
            }
        }
    }
}
