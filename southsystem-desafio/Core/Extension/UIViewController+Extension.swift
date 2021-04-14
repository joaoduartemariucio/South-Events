//
//  UIViewController+Extension.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import UIKit

extension UIViewController {
    
    func mostrarMensagem(_ texto: String, completation: @escaping(Bool) -> Void = {_ in }){
        let alert = UIAlertController(
            title: Constants.APP.name,
            message: texto.translate,
            preferredStyle: UIAlertController.Style.alert
        )

        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { (action: UIAlertAction!) in
                    completation(true)
                }
            )
        )

        present(alert, animated: true, completion: nil)
    }
    
    func startLoadView(){
        UIView.progressView.isHidden = false
        UIView.progressView.startAnimating()
    }

    func stopLoadView(){
        UIView.progressView.isHidden = true
        UIView.progressView.stopAnimating()
    }
}
