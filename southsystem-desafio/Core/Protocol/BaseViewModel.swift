//
//  BaseViewModel.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import Foundation

protocol BaseViewModel {
    
    var disposable: DisposeBag  { get set }
    var mostrarMensagem: BehaviorRelay<String>  { get set }
    var isLoad: BehaviorRelay<Bool>  { get set }

    func viewDidLoad()
}

extension BaseViewModel {
    
    func viewDidLoad(){ }
}

