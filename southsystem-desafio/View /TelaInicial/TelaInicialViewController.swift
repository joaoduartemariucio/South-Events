//
//  TelaInicialViewController.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import UIKit

class TelaInicialViewController: UIViewController, BaseViewController {

    typealias View = TelaInicialView
    typealias ViewModel = TelaInicialViewModel
    typealias Navigation = TelaInicialCoordinator
    
    var coordinator: TelaInicialCoordinator?
    var disposable: DisposeBag = DisposeBag()
    var viewModel: TelaInicialViewModel = TelaInicialViewModel()
    var presentationView: TelaInicialView = TelaInicialView()
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
        viewModel.viewDidLoad()
    }
    
    func bindView() {
        
    }
}
