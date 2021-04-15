//
//  DetalhesEventoView.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import Foundation
import MapKit
import Nuke

class DetalhesEventoView: UIView, BaseView {
    
    var scroll: UIScrollView = {
        var scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    var stack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var contentView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var contentImagemEvento: ContentImageView = {
        var view = ContentImageView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var lblNomeEvento: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .darkText
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var lblDescricaoEvento: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .gray
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var lblLocalizacaoInfo: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .darkText
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.text = "localizacao".translate
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var localizacaoMapa: MKMapView = {
        var map = MKMapView()
        map.layer.cornerRadius = 9
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    var lblDataEvento: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .darkGray
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var lblValorParticipacao: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .darkGray
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var contentComoChegar: ContentImageView = {
        var view = ContentImageView()
        view.clipsToBounds = true
        view.backgroundColor = .systemBlue
        view.imagem.tintColor = .white
        view.layer.cornerRadius = 9
        view.setImage(named: Constants.APP.Image.ic_como_chegar)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var btnParticipar: UIButton = {
        var btn = UIButton()
        btn.setTitle("fazer_checkin".translate, for: .normal)
        btn.backgroundColor = .colorPrimary
        btn.layer.cornerRadius = 9
        btn.layer.shadowRadius = 9
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowColor = UIColor.darkGray.cgColor
        btn.layer.shadowOffset = CGSize(width: 1, height: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubViews()
    }
    
    func createSubViews() {
        
        backgroundColor = .white
        
        setupScroll()
        setupStack()
        setupContentView()
        useLoadingDefault()
    }
    
    func setupScroll(){
        
        addSubview(scroll)
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: topAnchor),
            scroll.leadingAnchor.constraint(equalTo: leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupStack(){
        
        scroll.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: scroll.topAnchor),
            stack.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            stack.widthAnchor.constraint(equalToConstant: size.width)
        ])
    }
    
    func setupContentView(){
        
        stack.addArrangedSubview(contentView)
        
        setupContentImagemEvento()
        setupLabelNomeEvento()
        setupLabelDescricaoEvento()
        setupLabelLocalizacaoInfo()
        setupMapLocalizacao()
        setupLabelDataEvento()
        setupLabelValorParticipacao()
        setupButtonParticipar()
    }
    
    func setupContentImagemEvento(){
        
        contentView.addSubview(contentImagemEvento)
        NSLayoutConstraint.activate([
            contentImagemEvento.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentImagemEvento.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentImagemEvento.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentImagemEvento.heightAnchor.constraint(equalToConstant: size.height * 0.35)
        ])
    }
    
    func setupLabelNomeEvento(){
        
        contentView.addSubview(lblNomeEvento)
        NSLayoutConstraint.activate([
            lblNomeEvento.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: size.width * 0.05),
            lblNomeEvento.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.05),
            lblNomeEvento.topAnchor.constraint(equalTo: contentImagemEvento.bottomAnchor, constant: size.height * 0.025)
        ])
    }
    
    func setupLabelDescricaoEvento(){
        
        contentView.addSubview(lblDescricaoEvento)
        NSLayoutConstraint.activate([
            lblDescricaoEvento.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: size.width * 0.075),
            lblDescricaoEvento.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.075),
            lblDescricaoEvento.topAnchor.constraint(equalTo: lblNomeEvento.bottomAnchor, constant:size.height * 0.025)
        ])
    }
    
    func setupLabelLocalizacaoInfo(){
        
        contentView.addSubview(lblLocalizacaoInfo)
        NSLayoutConstraint.activate([
            lblLocalizacaoInfo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: size.width * 0.075),
            lblLocalizacaoInfo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.075),
            lblLocalizacaoInfo.topAnchor.constraint(equalTo: lblDescricaoEvento.bottomAnchor, constant:size.height * 0.025)
        ])
    }
    
    func setupMapLocalizacao(){
        
        contentView.addSubview(localizacaoMapa)
        NSLayoutConstraint.activate([
            localizacaoMapa.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: size.width * 0.075),
            localizacaoMapa.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.075),
            localizacaoMapa.topAnchor.constraint(equalTo: lblLocalizacaoInfo.bottomAnchor, constant:size.height * 0.025),
            localizacaoMapa.heightAnchor.constraint(equalToConstant: size.height * 0.20)
        ])
        
        contentView.addSubview(contentComoChegar)
        NSLayoutConstraint.activate([
            contentComoChegar.trailingAnchor.constraint(equalTo: localizacaoMapa.trailingAnchor, constant: -size.width * 0.025),
            contentComoChegar.bottomAnchor.constraint(equalTo: localizacaoMapa.bottomAnchor, constant: -size.height * 0.010),
            contentComoChegar.heightAnchor.constraint(equalToConstant: 36),
            contentComoChegar.widthAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    func setupLabelDataEvento(){
        
        contentView.addSubview(lblDataEvento)
        NSLayoutConstraint.activate([
            lblDataEvento.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: size.width * 0.075),
            lblDataEvento.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.075),
            lblDataEvento.topAnchor.constraint(equalTo: localizacaoMapa.bottomAnchor, constant:size.height * 0.025)
        ])
    }
    
    func setupLabelValorParticipacao(){
        
        contentView.addSubview(lblValorParticipacao)
        NSLayoutConstraint.activate([
            lblValorParticipacao.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: size.width * 0.075),
            lblValorParticipacao.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.075),
            lblValorParticipacao.topAnchor.constraint(equalTo: lblDataEvento.bottomAnchor, constant:size.height * 0.010)
        ])
    }
    
    func setupButtonParticipar(){
        
        contentView.addSubview(btnParticipar)
        NSLayoutConstraint.activate([
            btnParticipar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: size.width * 0.075),
            btnParticipar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.075),
            btnParticipar.heightAnchor.constraint(equalToConstant: 50),
            btnParticipar.topAnchor.constraint(equalTo: lblValorParticipacao.bottomAnchor, constant:size.height * 0.025),
            btnParticipar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -size.width * 0.075)
        ])
    }
    
    func configViewValue(detalhes: EventoModelElement) {
        
        lblNomeEvento.text = detalhes.title
        lblDescricaoEvento.text = detalhes.descriptionEvent
        contentImagemEvento.setImage(url: detalhes.image)
                
        let localizacaoEvento = CLLocationCoordinate2D(latitude: detalhes.latitude, longitude: detalhes.longitude)
        
        let region = MKCoordinateRegion(center: localizacaoEvento, latitudinalMeters: 100, longitudinalMeters: 100)
        
        localizacaoMapa.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = localizacaoEvento
        
        localizacaoMapa.addAnnotation(annotation)
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        let date = detalhes.date
        lblDataEvento.text = "\("data_evento".translate)\(dateFormatter.string(from: date))"
        lblValorParticipacao.text = "\("valor_contribuicao".translate)R$\(detalhes.price)"
    }
}
