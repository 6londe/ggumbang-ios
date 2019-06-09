//
//  CommentSurveyViewController.swift
//  ggumbang-ios
//
//  Created by Changhoon Lee on 09/06/2019.
//  Copyright © 2019 6londe. All rights reserved.
//

import UIKit

class CommentSurveyViewController: UIViewController {

    @IBOutlet var xButton: UIButton!
    @IBOutlet var requestButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func requestButtonTouchUpInside(_ sender: UIButton) {
        // TODO send http post
    }
    
}
