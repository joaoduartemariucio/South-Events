//
//  ContentImageView.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import UIKit
import Nuke

class ContentImageView: UIView {
    
    var imagem: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
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
        addSubview(imagem)
        NSLayoutConstraint.activate([
            imagem.topAnchor.constraint(equalTo: topAnchor),
            imagem.leadingAnchor.constraint(equalTo: leadingAnchor),
            imagem.trailingAnchor.constraint(equalTo: trailingAnchor),
            imagem.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setImage(url: String) {
        if let url = URL(string: url) {
            let options = ImageLoadingOptions(
                placeholder: UIImage(named: Constants.APP.Image.fake_blur_image),
                transition: .fadeIn(duration: 0.25),
                failureImage: UIImage(named: Constants.APP.Image.erro_download_image),
                contentModes: .init(success: .scaleAspectFill, failure: .scaleAspectFill, placeholder: .scaleAspectFill)
            )
            
            Nuke.loadImage(with: url, options: options, into: imagem)
        }
    }
    
    func setImage(named: String){
        if let image = UIImage(named: named) {
            imagem.image = image.withRenderingMode(.alwaysTemplate)
        }
    }
}
