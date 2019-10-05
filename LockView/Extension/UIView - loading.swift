//
//  UIView - loading.swift
//  PerceptHR
//
//  Created by Steven Curtis on 23/08/2019.
//  Copyright © 2019 Steven Curtis. All rights reserved.
//

import UIKit

extension UIViewController {
    private static let association = ObjectAssociation<UIActivityIndicatorView>()
    
    var thisActivityIndicator: UIActivityIndicatorView {
        set { UIViewController.association[self] = newValue }
        get {
            if let indicator = UIViewController.association[self] {
                return indicator
            } else {
                UIViewController.association[self] = UIActivityIndicatorView.customIndicator(at: self.view.center)
                return UIViewController.association[self]!
            }
        }
    }
    
    // MARK: - Acitivity Indicator
    
    public func startIndicatingActivity() {
        DispatchQueue.main.async {
            self.view.addSubview(self.thisActivityIndicator)
            self.thisActivityIndicator.startAnimating()
        }
    }
    
    public func stopIndicatingActivity() {
        DispatchQueue.main.async {
            self.thisActivityIndicator.removeFromSuperview()
            self.thisActivityIndicator.stopAnimating()
        }
    }
}
