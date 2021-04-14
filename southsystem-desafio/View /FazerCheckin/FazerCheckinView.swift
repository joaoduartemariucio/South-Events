//
//  FazerCheckinView.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 14/04/21.
//

import UIKit

class FazerCheckinView: UIView, BaseView {
    
    var disposable: DisposeBag = DisposeBag()
    var isFormularioPreenchido: BehaviorSubject<Bool> = BehaviorSubject<Bool>(value: false)
    
    var scroll: UIScrollView = {
        var scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    var stack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var contentView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var lblTitle: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .gray
        lbl.numberOfLines = 0
        lbl.text = "fazer_checkin_instrucoes".translate
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var txtNome: FormularioField = {
        let txt = FormularioField()
        txt.setIcon(Constants.APP.Image.ic_pessoa)
        txt.setPlaceHolder(text: "nome_completo".translate)
        txt.setKeyboardType(.default)
        txt.setAutoCorrection(false)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var txtEmail: FormularioField = {
        let txt = FormularioField()
        txt.setIcon(Constants.APP.Image.ic_arroba)
        txt.setPlaceHolder(text: "email".translate)
        txt.setAutoCorrection(false)
        txt.setAutocapitalization(false)
        txt.setKeyboardType(.emailAddress)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var btnConfirmar: UIButton = {
        var btn = UIButton()
        btn.layer.cornerRadius = 11
        btn.backgroundColor = .colorPrimary
        btn.setTitle("confirmar".translate, for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitleColor(.lightGray, for: .disabled)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
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
    
    deinit {
        disposable = DisposeBag()
    }
    
    func createSubViews() {
        
        backgroundColor = .white
        
        isFormularioPreenchido
            .asObserver()
            .subscribe(
                onNext: { value in
                    self.btnConfirmar.isEnabled = value
                }
            ).disposed(by: disposable)
        
        setupScroll()
        setupStack()
        setupContentView()
        
        useLoadingDefault()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        self.addGestureRecognizer(tap)
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
        
        setupViewTitle()
        setupFormulario()
        setupViewButton()
    }
    
    func setupViewTitle(){
        
        contentView.addSubview(lblTitle)
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: size.height * 0.025),
            lblTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: size.width * 0.05),
            lblTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.05)
        ])
    }
    
    func setupFormulario(){
        
        contentView.addSubview(txtNome)
        NSLayoutConstraint.activate([
            txtNome.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: size.height * 0.050),
            txtNome.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: size.width * 0.05),
            txtNome.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.05),
            txtNome.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        contentView.addSubview(txtEmail)
        NSLayoutConstraint.activate([
            txtEmail.topAnchor.constraint(equalTo: txtNome.bottomAnchor, constant: 20),
            txtEmail.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: size.width * 0.05),
            txtEmail.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.05),
            txtEmail.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupViewButton(){
        
        contentView.addSubview(btnConfirmar)
        NSLayoutConstraint.activate([
            btnConfirmar.topAnchor.constraint(equalTo: txtEmail.bottomAnchor, constant: 50),
            btnConfirmar.widthAnchor.constraint(equalToConstant: size.width * 0.60),
            btnConfirmar.heightAnchor.constraint(equalToConstant: 50),
            btnConfirmar.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            btnConfirmar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
