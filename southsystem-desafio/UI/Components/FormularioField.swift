//
//  FormularioField.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 14/04/21.
//

import UIKit
import RxGesture

class FormularioField: UIView, BaseView {
    
    let disposable = DisposeBag()
    
    var text: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    var selectedColor = UIColor.colorPrimary
    var unselectedColor = UIColor.lightGray
    
    private var icone: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private var field: UITextField = {
        var text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubViews()
    }
    
    func createSubViews(){
        setupLayer()
        setupIcone()
        setupField()
        setupControleEventos()
    }
    
    func setupLayer(){
        icone.tintColor = unselectedColor
        layer.borderColor = unselectedColor.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 11
    }
    
    func setupIcone(){
        addSubview(icone)
        NSLayoutConstraint.activate([
            icone.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            icone.widthAnchor.constraint(equalToConstant: 24),
            icone.heightAnchor.constraint(equalToConstant: 24),
            icone.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setupField(){
        
        addSubview(field)
        NSLayoutConstraint.activate([
            field.topAnchor.constraint(equalTo: topAnchor),
            field.leadingAnchor.constraint(equalTo: icone.trailingAnchor, constant: 10),
            field.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            field.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupControleEventos() {
        
        field.rx.controlEvent(.editingDidBegin).bind {
            self.setupEditandoTexto()
        }.disposed(by: disposable)
        
        field.rx.controlEvent(.editingDidEnd).bind {
            self.setupEdicaoFinalizada()
        }.disposed(by: disposable)
        
        field.rx.controlEvent(
            [
                .editingDidEndOnExit,
                .touchDragOutside
            ]
        ).bind {
            self.field.resignFirstResponder()
        }.disposed(by: disposable)
        
        field.rx
            .text
            .orEmpty
            .bind(to: text)
            .disposed(by: disposable)
    }
    
    func setupEditandoTexto(){
        layer.borderColor = selectedColor.cgColor
        tintColor = selectedColor
        field.textColor = unselectedColor
        icone.tintColor = selectedColor
    }
    
    func setupEdicaoFinalizada(){
        layer.borderColor = unselectedColor.cgColor
        tintColor = unselectedColor
        field.textColor = unselectedColor
        icone.tintColor = unselectedColor
    }
    
    func setIcon(_ named: String){
        let img = UIImage(named: named)?.withRenderingMode(.alwaysTemplate)
        icone.image = img
    }
    
    func setKeyboardType(_ type: UIKeyboardType){
        field.keyboardType = type
    }
    
    func setAutoCorrection(_ active: Bool) {
        field.autocorrectionType = active ? .no : .yes
    }
    
    func setAutocapitalization(_ active: Bool){
        field.autocapitalizationType = !active ? .none : .sentences
    }
    
    func setPlaceHolder(text: String){
        field.attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [
                .foregroundColor: unselectedColor,
                .font: UIFont.boldSystemFont(ofSize: 16)
            ]
        )
    }
}
