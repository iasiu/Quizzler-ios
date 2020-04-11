//
//  QuizQuestion.swift
//  Quizzler-iOS13
//
//  Created by Jan Lewandowski on 11/04/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizQuestion {
    let question: String
    let answers: [String]
    let correctAnswer: String
    
    init (q: String, a: [String], correctAnswer: String) {
        self.question = q
        self.answers = a
        self.correctAnswer = correctAnswer
    }
}
