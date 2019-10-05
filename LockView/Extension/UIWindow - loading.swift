//
//  UIWindow - loading.swift
//  ExtensionStoredProperties
//
//  Created by Steven Curtis on 23/08/2019.
//  Copyright © 2019 Steven Curtis. All rights reserved.
//

import UIKit

extension UIWindow {
    private static let association = ObjectAssociation<UIActivityIndicatorView>()
    
    var activityIndicator: UIActivityIndicatorView {
        set { UIWindow.association[self] = newValue }
        get {
            if let indicator = UIWindow.association[self] {
                return indicator
            } else {
                UIWindow.association[self] = UIActivityIndicatorView.customIndicator(at: self.center)
                return UIWindow.association[self]!
            }
        }
    }
    
    // MARK: - Acitivity Indicator
    public func startIndicatingActivity(_ ignoringEvents: Bool? = true) {
        DispatchQueue.main.async {
            self.addSubview(self.activityIndicator)
            self.activityIndicator.startAnimating()
            if ignoringEvents! {
                UIApplication.shared.beginIgnoringInteractionEvents()
            }
        }
    }
    
    public func stopIndicatingActivity() {
        DispatchQueue.main.async {
            self.activityIndicator.removeFromSuperview()
            self.activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
    
}
