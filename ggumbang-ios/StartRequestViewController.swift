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
    @IBOutlet var backButton: UIButton!
    
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
        let questions = questionaire.question
        if questions.count == 0 {
            // TODO go to comment survey view controller
        }
        else if questions[0].type == "radio" {
            DispatchQueue.main.async {
                let radioSurveyViewController = self.storyboard?.instantiateViewController(withIdentifier: "RadioSurveyViewController") as! RadioSurveyViewController
                radioSurveyViewController.questionaireData = self.questionaire
                radioSurveyViewController.questionIndex = 0
                self.present(radioSurveyViewController, animated: true)
            }
        }
        else if questions[0].type == "checkbox" {
            // TODO go to checkbox survey view controller
        }
        
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
