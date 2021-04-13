//
//  AppDelegate.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var coordinator: MainCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // MARK: Customiza barra de navegação
        settingNavigationBar()
        
        // MARK: Iniciando clico de navegação
        let navController = UINavigationController()
        coordinator = MainCoordinator(navigationController: navController)
        coordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func settingNavigationBar(){
            
            let tabBarAppearance = UITabBar.appearance()
            tabBarAppearance.tintColor = .colorPrimary
            
            let navBarAppearance = UINavigationBar.appearance()
            navBarAppearance.tintColor = .white
            navBarAppearance.barTintColor = .colorPrimary
            
            navBarAppearance.layer.shadowColor = UIColor.white.cgColor
            navBarAppearance.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            navBarAppearance.layer.shadowRadius = 2.0
            navBarAppearance.layer.shadowOpacity = 1.0
            
            navBarAppearance.barStyle = .black
            navBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)
            ]
            
            navBarAppearance.isTranslucent = false
        }
}

