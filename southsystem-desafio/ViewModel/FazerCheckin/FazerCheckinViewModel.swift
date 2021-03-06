//
//  FazerCheckinViewModel.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 14/04/21.
//

import Foundation

enum FazerCheckinStatus {
    case checkin_realizado, `default`
}

class FazerCheckinViewModel: NSObject, BaseViewModel {
    
    var disposable: DisposeBag = DisposeBag()
    
    var feedback: BehaviorRelay<FazerCheckinStatus> = BehaviorRelay<FazerCheckinStatus>(value: .default)
    
    var isFormularioPreenchido: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    var isLoad: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    let model = FazerCheckinModel()
    
    var mostrarMensagem: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    var txtNomeObserver: BehaviorSubject<String> = BehaviorSubject<String>(value: "")
    var txtEmailObserver: BehaviorSubject<String> = BehaviorSubject<String>(value: "")

    func viewDidLoad() {
        
        txtNomeObserver.asObserver()
            .subscribe(
                onNext: { value in
                    self.model.setName(value)
                }
            ).disposed(by: disposable)
        
        txtEmailObserver.asObserver()
            .subscribe(
                onNext: { value in
                    self.model.setEmail(value)
                }
            ).disposed(by: disposable)
        
        Observable.combineLatest(txtNomeObserver, txtEmailObserver)
            .observe(on: MainScheduler.instance)
            .map { (nome, email) -> Bool in
                return nome.count > 4    &&
                    email.isValidEmail
            }
            .bind(to: isFormularioPreenchido)
            .disposed(by: disposable)
    }
    
    func setEventoId(_ id: String) {
        self.model.setEventId(id)
    }
    
    func fazerCheckinEvento(){
        isLoad.accept(true)
        FazerCheckinClient.fazerCheckin(dadosCheckin: model)
            .asObservable()
            .subscribe(
                onNext: { result in
                    self.isLoad.accept(false)
                    self.feedback.accept(.checkin_realizado)
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
