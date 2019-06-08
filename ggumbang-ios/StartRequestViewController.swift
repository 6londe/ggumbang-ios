//
//  StartRequestViewController.swift
//  ggumbang-ios
//
//  Created by Changhoon Lee on 09/06/2019.
//  Copyright © 2019 6londe. All rights reserved.
//

import UIKit

class StartRequestViewController: UIViewController {

    @IBOutlet var startButton: UIButton!
    
    // TODO get this typeId from previous ViewController
    var typeId = "2"
    var http = Http(baseUrl: Config.baseUrl)
    var questionaire: QuestionaireData!

    override func viewDidLoad() {
        super.viewDidLoad()

        http.get("/questionaire/" + typeId) { (response) -> () in
            do {
                let jsonData = response.data(using: .utf8)!
                let decodedJson = try JSONDecoder().decode(QuestionaireData.self, from: jsonData)
                self.questionaire = decodedJson
            } catch { print(error) }
        }
    }
    
    @IBAction func startButtonTouchUpInside(_ sender: UIButton) {
        print(self.questionaire.question)
    }
}
