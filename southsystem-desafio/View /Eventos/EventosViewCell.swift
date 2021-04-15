//
//  EventosViewCell.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import UIKit
import Nuke

class EventosViewCell: UITableViewCell {
    
    static let identifier = "EventosViewCell"
    
    var cardEvento: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 9
        view.layer.shadowRadius = 9
        view.layer.shadowOpacity = 0.5
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var imagem: ContentImageView = {
        var img = ContentImageView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: UIView.shared.size.width - UIView.shared.size.width * 0.050 ,
                height: UIView.shared.size.height * 0.30
            )
        )
        img.clipsToBounds = true
        img.roundCorners(corners: [.topLeft, .topRight], radius: 9)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
                
    var lblTitle: UILabel = {
        var lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = .darkText
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var lblDia: UILabel = {
        var lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.text = "31"
        lbl.font = UIFont.systemFont(ofSize: 28)
        lbl.textAlignment = .center
        lbl.textColor = .darkText
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var lblMes: UILabel = {
        var lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = .colorPrimaryDark
        lbl.text = "Dec"
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var lblHora: UILabel = {
        var lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = .darkText
        lbl.text = "5:00 PM"
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubViews()
    }
    
    func createSubViews(){
               
        setupCard()
        setupImage()
        setupConteudoTexto()
    }
    
    func setupCard(){
        
        contentView.addSubview(cardEvento)
        NSLayoutConstraint.activate([
            cardEvento.topAnchor.constraint(equalTo: contentView.topAnchor, constant: size.height * 0.015),
            cardEvento.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: size.width * 0.025),
            cardEvento.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.025),
            cardEvento.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -size.height * 0.005)
        ])
    }
    
    func setupImage() {
        
        cardEvento.addSubview(imagem)
        NSLayoutConstraint.activate([
            imagem.topAnchor.constraint(equalTo: cardEvento.topAnchor),
            imagem.leadingAnchor.constraint(equalTo: cardEvento.leadingAnchor),
            imagem.trailingAnchor.constraint(equalTo: cardEvento.trailingAnchor),
            imagem.heightAnchor.constraint(equalToConstant: size.height * 0.25)
        ])
    }
    
    func setupConteudoTexto() {
        
        cardEvento.addSubview(lblDia)
        NSLayoutConstraint.activate([
            lblDia.topAnchor.constraint(equalTo: imagem.bottomAnchor, constant: size.height * 0.025),
            lblDia.widthAnchor.constraint(equalToConstant: 35),
            lblDia.leadingAnchor.constraint(equalTo: cardEvento.leadingAnchor, constant: size.width * 0.050)
        ])
        
        cardEvento.addSubview(lblMes)
        NSLayoutConstraint.activate([
            lblMes.topAnchor.constraint(equalTo: lblDia.bottomAnchor, constant: size.height * 0.010),
            lblMes.centerXAnchor.constraint(equalTo: lblDia.centerXAnchor)
        ])
        
        cardEvento.addSubview(lblTitle)
        NSLayoutConstraint.activate([
            lblTitle.centerYAnchor.constraint(equalTo: lblDia.centerYAnchor),
            lblTitle.leadingAnchor.constraint(equalTo: lblDia.trailingAnchor, constant: size.width * 0.050),
            lblTitle.trailingAnchor.constraint(equalTo: cardEvento.trailingAnchor, constant: -size.width * 0.050)
        ])
        
        cardEvento.addSubview(lblHora)
        NSLayoutConstraint.activate([
            lblHora.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: size.height * 0.010),
            lblHora.leadingAnchor.constraint(equalTo: lblDia.trailingAnchor, constant: size.width * 0.050),
            lblHora.trailingAnchor.constraint(equalTo: cardEvento.trailingAnchor, constant: -size.width * 0.025),
            lblHora.centerYAnchor.constraint(equalTo: lblMes.centerYAnchor),
            lblHora.bottomAnchor.constraint(equalTo: cardEvento.bottomAnchor, constant: -size.height * 0.025)
        ])
    }
    
    func configCell(_ model: EventoModelElement){
        lblTitle.text = model.title
        imagem.setImage(url: model.image)
        
        lblHora.text = model.getDataHoraString(fmtHora: .short, fmtData: .none)
        
        lblDia.text = model.getDataHoraString(formato: "dd")
        lblMes.text = model.getDataHoraString(formato: "MMM")
    }
}
