//
//  ViewController.swift
//  TrueFalseTestApp
//
//  Created by dinesh danda on 3/11/18.
//  Copyright © 2018 dinesh danda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var questionLable: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var newgameButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var listOfQuestions: [String] = []
    var listOfAnswers: [Bool] = []
    var hasBeenAnswered: [Bool] = []
    var currentQuestion: String?
    var currentAnswer: Bool?
    var score = 0
    var randomNumber: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfQuestions = [" Dinesh is Working as an iOS Developer",
                          " Done is Masters from Fairfield University",
                          " 5*5 is 25",
                          " Brocklli is a Non-Vegetarian",
                          " Modi is the Prime Minister of India",
                          " Tiger has 3 legs"
            
        ]
        listOfAnswers = [ true,true,true,false,true,false]
        hasBeenAnswered = [false,false,false,false,false,false]
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func trueBtnPressed(_ sender: Any) {
        if (currentAnswer) == true{
            score += 1
            scoreLabel.text = "Correct Answer..! Your score Now is" + String(score) + "points"
            
        } else {
            scoreLabel.text = " Incorrect Answer..! Your Score still" + String(score) + "Points"
        }
        
      initiatEndGamesequnce()
    }
    
        func falseBtnpressed(_ sender: Any) {
        if (currentAnswer) == false{
            score += 1
            scoreLabel.text = "Correct Answer..! Your score Now is" + String(score) + "points"
            
        } else {
            scoreLabel.text = " Incorrect Answer..! Your Score still" + String(score) + "Points"
        }
            initiatEndGamesequnce()
        
    }
        
    
        func newgameBtnPressed(_ sender: Any) {
            for index in 0..<listOfQuestions.count{
                hasBeenAnswered[index] = false
            }
            chooseQuestion()
            score = 0
            scoreLabel.text = "score:"
            trueButton.isEnabled = true
            falseButton.isEnabled = true
            
    }
    func initiatEndGamesequnce(){
        if(checkIfOver() == true){
            questionLable.text = "Game Ended. Your Final Score is" + String(score) + "/" + String(listOfQuestions.count) + "points."
        } else{
            chooseQuestion()
        }
        
    }
    func chooseRandomNumeber(){
        randomNumber = Int(arc4random_uniform(UInt32(listOfQuestions.count)))
        if (hasBeenAnswered[randomNumber!] == true){
            chooseRandomNumeber()
        }
        hasBeenAnswered[randomNumber!] = true
        
        
    }
    
    func chooseQuestion(){
        chooseRandomNumeber()
        currentQuestion = listOfQuestions[randomNumber!]
        currentAnswer = listOfAnswers[randomNumber!]
        questionLable.text = currentQuestion
    }
    func checkIfOver()-> Bool{
        for index in 0..<listOfQuestions.count{
            if (hasBeenAnswered[index] == false){
                return false
            }
        }
        trueButton.isEnabled = false
        falseButton.isEnabled = false
        
        return true
        
    }
    
    
}

