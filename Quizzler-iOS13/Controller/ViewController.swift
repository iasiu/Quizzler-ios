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
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.progress = 0.0
        
        updateUI()
    }
    
    // triggered whenever any button is pressed
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        if quizBrain.checkAnswer(userAnswer) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        updateUI()
    }
    
    // update ui for current question and progress
    func updateUI() {
        // do closure after 0.2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: { () -> Void in
            
            // display current question
            self.questionLabel.text = self.quizBrain.getCurrentQuestion()
            
            self.aButton.setTitle(self.quizBrain.getCurrentAnswers()[0], for: .normal)
            self.bButton.setTitle(self.quizBrain.getCurrentAnswers()[1], for: .normal)
            self.cButton.setTitle(self.quizBrain.getCurrentAnswers()[2], for: .normal)
            
            // reset buttons color to clear
            self.aButton.backgroundColor = UIColor.clear
            self.bButton.backgroundColor = UIColor.clear
            self.cButton.backgroundColor = UIColor.clear
            
            // display current progress in progress bar
            self.progressBar.progress = self.quizBrain.getCurrentProgress()
            
            self.scoreLabel.text = "Score: \(self.quizBrain.getScore())"
        })
    }
}

