//
//  DetalhesEventoViewModel.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import Foundation

class DetalhesEventoViewModel: BaseViewModel {
    
    var disposable: DisposeBag = DisposeBag()
    
    var mostrarMensagem: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var isLoad: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    var model: DetalhesEventoModel = DetalhesEventoModel()
    
    var detalhes: BehaviorRelay<EventoModelElement> = BehaviorRelay<EventoModelElement>(value: EventoModelElement())
    
    func viewDidLoad() {
        buscarDetalhesDoEvento()
    }
    
    func setEventoId(_ eventoId: String){
        model.setEventoId(id: eventoId)
    }
    
    func getEventoId()-> String {
        return model.eventoId
    }
    
    func getLongitude() -> Double {
        return detalhes.value.longitude
    }
    
    func getLatitude() -> Double {
        return detalhes.value.latitude
    }
    
    func buscarDetalhesDoEvento(){
        isLoad.accept(true)
        EventosClient.buscarDetalhesEvento(id: model.eventoId)
            .asObservable()
            .subscribe(
                onNext: { result in
                    self.isLoad.accept(false)
                    self.detalhes.accept(EventoModelElement(codable: result))
                },
                onError: { error in
                    self.isLoad.accept(false)
                    if let erro = error as? APIError {
                        let message = APIErrorMessageHelper.instance.retornaMensagemErroAPI(erro: erro)
                        self.mostrarMensagem.accept(message)
                    }
                }
            ).disposed(by: disposable)
    }
}
