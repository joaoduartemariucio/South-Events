//
//  HomeCoordinator.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import UIKit

class TelaInicialCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        telaInicial()
    }
    
    func telaInicial(){
        let vc = TelaInicialViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
