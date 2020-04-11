//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Jan Lewandowski on 11/04/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    // dict stores all questions and answers
    let quizQuestions: [QuizQuestion] = [
        QuizQuestion(q: "A slug's blood is green.", a: "True"),
        QuizQuestion(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        QuizQuestion(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        QuizQuestion(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        QuizQuestion(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        QuizQuestion(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        QuizQuestion(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        QuizQuestion(q: "Google was originally called 'Backrub'.", a: "True"),
        QuizQuestion(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        QuizQuestion(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        QuizQuestion(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        QuizQuestion(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    var questionNumber: Int = 0
    var score: Int = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quizQuestions[questionNumber].answer {
            //right
            self.score += 1
            return true
        } else {
            //wrong
            return false
        }
    }
    
    func getCurrentQuestion() -> String {
        return quizQuestions[questionNumber].question
    }
    
    func getCurrentProgress() -> Float {
        return Float(self.questionNumber + 1) / Float(self.quizQuestions.count)
    }
    
    mutating func nextQuestion() {
        if questionNumber < quizQuestions.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
    mutating func getScore() -> Int {
        return score
    }
}
