//
//  EventosViewController.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import UIKit

class EventosViewController: UIViewController, BaseViewController {

    typealias View = EventosView
    typealias ViewModel = EventosViewModel
    typealias Navigation = TelaInicialCoordinator
    
    var coordinator: TelaInicialCoordinator?
    var disposable: DisposeBag = DisposeBag()
    var viewModel: EventosViewModel = EventosViewModel()
    var presentationView: EventosView = EventosView()
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "title_tela_inicio".translate
        
        bindView()
        viewModel.viewDidLoad()
    }
    
    func bindView() {
        
        viewModel.dataSource
            .bind(
                to: presentationView
                    .tableView
                    .rx
                    .items(
                        cellIdentifier: EventosViewCell.identifier,
                        cellType: EventosViewCell.self
                    )
            ) { row, data, cell in
                cell.selectionStyle = .none
                cell.configCell(data)
            }.disposed(by: disposable)
        
        presentationView.tableView.rx.itemSelected.bind { index in
            let value = self.viewModel.dataSource.value[index.row]
            self.coordinator?.detalhesEvento(value.id)
        }.disposed(by: disposable)
        
        presentationView.tableView.refreshControl?.rx
            .controlEvent(.valueChanged)
            .bind {
                self.viewModel.atualizarTela()
            }.disposed(by: disposable)
        
        viewModel.isLoad.bind { value in
            if value {
                self.startLoadView()
            }else {
                self.presentationView.tableView.refreshControl?.endRefreshing()
                self.stopLoadView()
            }
        }.disposed(by: disposable)
    }
}
