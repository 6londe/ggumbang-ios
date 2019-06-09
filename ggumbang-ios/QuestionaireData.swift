//
//  QuestionaireData.swift
//  ggumbang-ios
//
//  Created by Changhoon Lee on 28/05/2019.
//  Copyright © 2019 6londe. All rights reserved.
//

import Foundation

struct QuestionaireData: Codable {
    var typeId: Int
    var typeName: String
    var question: [Question]
}

struct Question: Codable {
    var questionId: Int
    var content: String
    var answer: [Answer]
    var type: String
}

struct Answer: Codable {
    var id: Int
    var content: String
}
