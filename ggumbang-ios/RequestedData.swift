//
//  RequestData.swift
//  ggumbang-ios
//
//  Created by Changhoon Lee on 28/05/2019.
//  Copyright © 2019 6londe. All rights reserved.
//

import Foundation

struct RequestedData: Codable {
    var data: [Requested]
}

struct Requested: Codable {
    var id: Int
    var userId: Int
    var type: String
    var comment: String
    var userAnswers: [UserAnswers]
}

struct UserAnswers: Codable {
    var question: String
    var answer: String
}
