//
//  DetalhesEventoViewController.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import UIKit
import MapKit

class DetalhesEventoViewController: UIViewController, BaseViewController {
    
    typealias View = DetalhesEventoView
    typealias ViewModel = DetalhesEventoViewModel
    typealias Navigation = TelaInicialCoordinator
    
    var coordinator: TelaInicialCoordinator?
    var disposable: DisposeBag = DisposeBag()
    var presentationView: DetalhesEventoView = DetalhesEventoView()
    var viewModel: DetalhesEventoViewModel = DetalhesEventoViewModel()
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let btnCompartilharEvento = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(compartilharEvento))
        self.navigationItem.rightBarButtonItem = btnCompartilharEvento
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "detalhes_evento".translate
        
        bindView()
        viewModel.viewDidLoad()
    }
    
    func bindView() {
        
        presentationView.btnParticipar.rx.tap.bind {
            self.coordinator?.fazerCheckinEvento(eventoId: self.viewModel.getEventoId())
        }.disposed(by: disposable)
        
        presentationView.contentComoChegar.rx
            .tapGesture()
            .when(.recognized)
            .bind { tap in
                self.abrirMapaIos()
            }.disposed(by: disposable)
        
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
        
        viewModel.detalhes.bind { value in
            self.presentationView.configViewValue(detalhes: value)
        }.disposed(by: disposable)
    }
    
    @objc func compartilharEvento(){
        
        guard let imagemEvento = presentationView.contentImagemEvento.imagem.image else { return }
        let descricaoEvento = "\(viewModel.getDescricaoEvento())"
        
        let activityViewController = UIActivityViewController(
            activityItems:  [imagemEvento, descricaoEvento],
            applicationActivities: nil
        )
        
        activityViewController.excludedActivityTypes = [
            UIActivity.ActivityType.print,
            UIActivity.ActivityType.postToWeibo,
            UIActivity.ActivityType.copyToPasteboard,
            UIActivity.ActivityType.addToReadingList,
            UIActivity.ActivityType.postToVimeo
        ]
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    func abrirMapaIos(){
        
        let coordinate = CLLocationCoordinate2D(latitude: viewModel.getLatitude(), longitude: viewModel.getLongitude())
        
        let source = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        source.name = "local_do_evento".translate
        
        MKMapItem.openMaps(
          with: [source],
          launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        )
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
