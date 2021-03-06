//
//  TelaInicialViewModel.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import Foundation

class EventosViewModel: NSObject, BaseViewModel {
    
    var disposable: DisposeBag = DisposeBag()

    var mostrarMensagem: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var isLoad: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    var dataSource: BehaviorRelay<EventosModel> = BehaviorRelay<EventosModel>(value: EventosModel())
    
    func viewDidLoad() {
        buscarEventos()
    }
    
    func atualizarTela(){
        buscarEventos()
    }
    
    func buscarEventos(){
        isLoad.accept(true)
        EventosClient.buscarEventos()
            .asObservable()
            .subscribe(
                onNext: { result in
                    self.isLoad.accept(false)
                    let eventosMapeados = result.map({ EventoModelElement(codable: $0) })
                    self.dataSource.accept(eventosMapeados)
                }, onError: { error in
                    self.isLoad.accept(false)
                    
                    if let erro = error as? APIError {
                        let message = APIErrorMessageHelper.instance.retornaMensagemErroAPI(erro: erro)
                        self.mostrarMensagem.accept(message)
                    }else {
                        self.mostrarMensagem.accept("erro_api_nao_mapeado".translate)
                    }
                }
            ).disposed(by: disposable)
    }
}
