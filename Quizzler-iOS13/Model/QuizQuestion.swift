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
    let answer: String
    
    init (q: String, a: String) {
        self.question = q
        self.answer = a
    }
}
