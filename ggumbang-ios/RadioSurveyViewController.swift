//
//  RadioSurveyViewController.swift
//  ggumbang-ios
//
//  Created by Changhoon Lee on 09/06/2019.
//  Copyright © 2019 6londe. All rights reserved.
//

import UIKit

class RadioSurveyViewController: UIViewController {

    @IBOutlet var xButton: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    
    // TODO generate this buttons dynamically
    @IBOutlet var radioButton1: UIButton!
    @IBOutlet var radioButton2: UIButton!
    @IBOutlet var radioButton3: UIButton!
    
    var questionaireData: QuestionaireData!
    var questionIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var questionData = self.questionaireData.question[self.questionIndex]
        self.questionLabel.text = questionData.content
        self.radioButton1.setTitle(questionData.answer[0].content, for: [])
        self.radioButton2.setTitle(questionData.answer[1].content, for: [])
        self.radioButton3.setTitle(questionData.answer[2].content, for: [])
    }
    
    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        let questions = self.questionaireData.question
        let nextIndex = self.questionIndex + 1
        if questions.count == nextIndex {
            // TODO go to comment survey view controller
        }
        else if questions[nextIndex].type == "radio" {
            DispatchQueue.main.async {
                let radioSurveyViewController = self.storyboard?.instantiateViewController(withIdentifier: "RadioSurveyViewController") as! RadioSurveyViewController
                radioSurveyViewController.questionaireData = self.questionaireData
                radioSurveyViewController.questionIndex = nextIndex
                self.present(radioSurveyViewController, animated: true)
            }
        }
        else if questions[nextIndex].type == "checkbox" {
            // TODO go to checkbox survey view controller
        }
    }
}
