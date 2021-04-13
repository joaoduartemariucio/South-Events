//
//  TelaInicialViewModel.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import Foundation

class TelaInicialViewModel: NSObject, BaseViewModel {
    
    var disposable: DisposeBag = DisposeBag()

    var mostrarMensagem: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var isLoad: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    func viewDidLoad() {
        
    }
}
