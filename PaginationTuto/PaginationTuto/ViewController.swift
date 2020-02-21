//
//  ViewController.swift
//  PaginationTuto
//
//  Created by Tejora on 05/07/18.
//  Copyright © 2018 Tejora. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tblView: UITableView!
    var recordArray = [Int]()
    var limit = 20
    let totalenteries = 100
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tblView.tableFooterView = UIView(frame: .zero)
        var index = 0
        while index < limit {
            recordArray.append(index)
            index = index + 1
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "idef")
        
        cell.textLabel?.text = "row \(recordArray[indexPath.row])"
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == recordArray.count - 1{
            // means we are on last cell
            if recordArray.count < totalenteries{
                //if record array count is less than total entries then call api or load more record
                var index = recordArray.count
                limit = index + 20
                while index < limit {
                    recordArray.append(index)
                    index = index + 1
                }
                self.perform(#selector(loadTable), with: nil, afterDelay: 1.0)
            }
        }
    }
    
    @objc func loadTable(){
        self.tblView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

