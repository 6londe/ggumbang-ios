//
//  RequestedViewController.swift
//  ggumbang-ios
//
//  Created by Changhoon Lee on 08/06/2019.
//  Copyright © 2019 6londe. All rights reserved.
//

import UIKit

class RequestedViewController: UIViewController {

    // TODO get this userId from server
    let userId = "2926"
    let cellIdentifier = "TableViewCell"
    
    @IBOutlet weak var tableView: UITableView!
    var http = Http(baseUrl: Config.baseUrl)
    var tableData: [Requested] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        loadTableData()
    }
    
    func loadTableData() {
        http.get("/answers/" + userId) { (response) -> () in
            do {
                let jsonData = response.data(using: .utf8)!
                let decodedJson = try JSONDecoder().decode(RequestedData.self, from: jsonData)
                self.tableData = decodedJson.data
                DispatchQueue.main.async { self.tableView.reloadData() }
            } catch { print(error) }
        }
    }
}

extension RequestedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RequestedTableViewCell
        print(self.tableData[indexPath.row].comment)
        cell.requestedItem?.text = self.tableData[indexPath.row].comment
        return cell
    }
}

extension RequestedViewController: UITableViewDelegate {
    
}
