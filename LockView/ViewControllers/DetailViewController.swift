//
//  DetailViewController.swift
//  LockView
//
//  Created by Steven Curtis on 05/10/2019.
//  Copyright © 2019 Steven Curtis. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailLabel: UILabel!
    var detailData: String = ""
    var lock: LockType = .none
    var indicator: UIActivityIndicatorView?
    
    var passedFunc : (() -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()

        detailLabel.text = detailData
        
        if lock == .monitor {
            indicator?.stopAnimating()
        }
        else if lock == .lockView {
            passedFunc?()
        }
        
        else if lock == .lockWindow {
            UIApplication.shared.keyWindow?.stopIndicatingActivity()
        }
       
        
        

    }

}
