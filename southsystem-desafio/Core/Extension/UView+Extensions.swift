//
//  UView+Extensions.swift
//  southsystem-desafio
//
//  Created by João Vitor Duarte Mariucio on 13/04/21.
//

import UIKit
import MaterialComponents.MaterialProgressView
import MaterialComponents.MaterialProgressView_Theming

extension UIView {
    
    static var shared = UIView()
    
    var size: CGSize {
        get {
            return UIScreen.main.bounds.size
        }
    }
    
    static var progressView: MDCProgressView = {
        let progres = MDCProgressView()
        progres.mode = .indeterminate
        progres.progress = 0.5
        progres.isHidden = true
        progres.translatesAutoresizingMaskIntoConstraints = false
        return progres
    }()
    
    func useLoadingDefault(){
        let containerScheme = MDCContainerScheme()
        
        addSubview(UIView.progressView)
        NSLayoutConstraint.activate([
            UIView.progressView.topAnchor.constraint(equalTo: topAnchor),
            UIView.progressView.leadingAnchor.constraint(equalTo: leadingAnchor),
            UIView.progressView.trailingAnchor.constraint(equalTo: trailingAnchor),
            UIView.progressView.heightAnchor.constraint(equalToConstant: 5)
        ])
        
        UIView.progressView.applyTheme(withScheme: containerScheme)
        
        UIView.progressView.progressTintColor = .colorPrimaryDark
        UIView.progressView.trackTintColor = .colorPrimaryLight
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber], startPoint: CGPoint, endPoint: CGPoint) {
        let gradient: CAGradientLayer = CAGradientLayer()
    
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
