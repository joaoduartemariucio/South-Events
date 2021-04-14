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
        self.model.setEventoId(id: eventoId)
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
                    print(error)
                    self.isLoad.accept(false)
                }
            ).disposed(by: disposable)
    }
}
