//
//  TableViewController.swift
//  LockView
//
//  Created by Steven Curtis on 05/10/2019.
//  Copyright © 2019 Steven Curtis. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    var tableView: UITableView = UITableView()
    var data = ["first", "second", "third", "forth"]
    var lock: LockType = .none
    
    var indicator: UIActivityIndicatorView?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let destination = segue.destination as? DetailViewController {
                destination.detailData = data[(sender as? Int)!]
                destination.lock = lock
                if lock == .monitor {
                    destination.indicator = indicator
                }
                else if lock == .lockView {
                    destination.passedFunc = self.stopIndicatingActivity
                }
            }
        }
    }
                
                
//                if lock == .none {
//                } else if lock == .monitor {
//
//                    destination.detailData = self.data[(sender as? Int)!]
//                    indicator.stopAnimating()
//                } else if lock == .lockView {
//                    self.startIndicatingActivity()
//                    destination.detailData = self.data[(sender as? Int)!]
//                    self.stopIndicatingActivity()
//                } else if lock == .lockWindow {
//                    destination.detailData = self.data[(sender as? Int)!]
//                    destination.lock = lock
//                }
//        }


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.frame = view.frame
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if lock == .monitor {
            indicator = UIActivityIndicatorView.customIndicator(at: self.view.center)
            self.view.addSubview(indicator!)
            indicator!.startAnimating()
        }
            
        else if lock == .lockView {
            self.startIndicatingActivity()
        }
            
        else if lock == .lockWindow {
            UIApplication.shared.keyWindow?.startIndicatingActivity()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.performSegue(withIdentifier: "showDetail", sender: indexPath.row)
        }
        
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}
