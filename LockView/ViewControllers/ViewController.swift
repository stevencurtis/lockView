//
//  ViewController.swift
//  LockView
//
//  Created by Steven Curtis on 05/10/2019.
//  Copyright © 2019 Steven Curtis. All rights reserved.
//

import UIKit

enum LockType {
    case none
    case monitor
    case lockView
    case lockWindow
}

class ViewController: UIViewController {
    
    var lock: LockType = .none
    
    @IBAction func goToTableView(_ sender: UIButton) {
        performSegue(withIdentifier: "showTable", sender: nil)
    }
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: lock = .none
        case 1: lock = .monitor
        case 2: lock = .lockView
        case 3: lock = .lockWindow

        default:
            lock = .none
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTable" {
            if let destination = segue.destination as? TableViewController {
                destination.lock = lock
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

