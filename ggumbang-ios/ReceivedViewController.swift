//
//  ReceivedViewController.swift
//  ggumbang-ios
//
//  Created by Changhoon Lee on 09/06/2019.
//  Copyright © 2019 6londe. All rights reserved.
//

import UIKit

class ReceivedViewController: UIViewController {

    @IBOutlet var backButton: UIButton!
    @IBOutlet var requestedInfoLabel: UILabel!
    var requestedInfo: Requested!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let jsonData = try JSONEncoder().encode(self.requestedInfo)
            self.requestedInfoLabel.text = String(data: jsonData, encoding: .utf8)
        } catch { self.requestedInfoLabel.text = "No Data" }
    }
    
    @IBAction func backButtonTouchUpInside(_ sender: UIButton) {
        performSegueToReturnBack()
    }
    
    func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
