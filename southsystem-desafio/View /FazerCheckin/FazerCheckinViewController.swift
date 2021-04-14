//
//  FazerCheckinViewController.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 14/04/21.
//

import UIKit

class FazerCheckinViewController: UIViewController, BaseViewController {
    
    typealias View = FazerCheckinView
    typealias ViewModel = FazerCheckinViewModel
    typealias Navigation = TelaInicialCoordinator
    
    var coordinator: TelaInicialCoordinator?
    var disposable: DisposeBag = DisposeBag()
    var viewModel: FazerCheckinViewModel = FazerCheckinViewModel()
    var presentationView: FazerCheckinView = FazerCheckinView()
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "fazer_checkin".translate
        
        bindView()
        viewModel.viewDidLoad()
    }
    
    func bindView() {
        
        presentationView.txtNome
            .text
            .bind(to: viewModel.txtNomeObserver)
            .disposed(by: disposable)
        
        presentationView.txtEmail
            .text
            .bind(to: viewModel.txtEmailObserver)
            .disposed(by: disposable)
        
        presentationView.btnConfirmar.rx.tap.bind {
            self.viewModel.fazerCheckinEvento()
        }.disposed(by: disposable)
        
        viewModel.isFormularioPreenchido
            .bind(to: presentationView.isFormularioPreenchido)
            .disposed(by: disposable)
        
        viewModel.mostrarMensagem.bind { value in
            if !value.isEmpty {
                self.mostrarMensagem(value)
            }
        }.disposed(by: disposable)
        
        viewModel.isLoad.bind { value in
            if value {
                self.startLoadView()
            }else {
                self.stopLoadView()
            }
        }.disposed(by: disposable)
        
        viewModel.feedback.bind { value in
            self.tratarStatus(value)
        }.disposed(by: disposable)
    }
    
    func tratarStatus(_ status: FazerCheckinStatus) {
        switch status {
        case .checkin_realizado:
            self.mostrarMensagem("check_in_realizado_sucesso".translate) { _ in
                self.navigationController?.popViewController(animated: true)
            }
            break
        case .default:
            break
        }
    }
}
