//
//  TelaInicialView.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import UIKit

class TelaInicialView: UIView, BaseView {
    
    var tableView: UITableView = {
        var tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.refreshControl = UIRefreshControl()
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 50))
        tableView.register(TelaInicialViewCell.self, forCellReuseIdentifier: TelaInicialViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        
        setupTableView()
        
        useLoadingDefault()
    }
    
    func setupTableView() {
        
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
