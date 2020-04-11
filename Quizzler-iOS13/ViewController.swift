//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.progress = 0.0
        
        updateUI()
    }
    
    // triggered whenever any button is pressed
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! // True or False
        let correctAnswer = quizQuestions[questionNumber].answer
        
        if userAnswer == correctAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        if questionNumber < quizQuestions.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        updateUI()
    }
    
    func updateUI() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: { () -> Void in
            self.questionLabel.text = self.quizQuestions[self.questionNumber].question
            self.trueButton.backgroundColor = UIColor.clear
            self.falseButton.backgroundColor = UIColor.clear
            self.progressBar.progress = Float(self.questionNumber + 1) / Float(self.quizQuestions.count)
        })
    }
}

