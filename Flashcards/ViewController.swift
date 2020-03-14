//
//  ViewController.swift
//  Flashcards
//
//  Created by Zoe Offermann on 2/12/20.
//  Copyright © 2020 Zoe Offermann. All rights reserved.
//

import UIKit

struct Flashcard{
    var question: String
    var answer_rigth: String
    var answer_wrong1: String
    var answer_wrong2: String
    
}

class ViewController: UIViewController {
            
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var flashcards = [Flashcard]()
    var currentIndex = 0
    
    func buttonSetUp(button: UIButton){
        button.layer.borderWidth = 3.0
        button.layer.borderColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 15.0
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // make destination of segue bc the nav controller
        let navigationController = segue.destination as! UINavigationController
        // make nav controller only contain a creation view controller
        let creationController = navigationController.topViewController as! CreationViewController
        // set flashcardsController property to self
        creationController.flashcardsController = self
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        card.layer.shadowOpacity = 0.5
        card.layer.shadowRadius = 20.0
        frontLabel.clipsToBounds = true
        backLabel.clipsToBounds = true
        frontLabel.layer.cornerRadius = 20.0
        backLabel.layer.cornerRadius = 20.0
        
        buttonSetUp(button: button1)
        buttonSetUp(button: button2)
        buttonSetUp(button: button3)
        
        updateFlashcard(question: "What is the capital of Argentina?", answer1: "Buenos Aires", answer2: "Córdoba", answer3: "Mar del Plata")

    }

    @IBAction func button1Press(_ sender: Any) {
        frontLabel.isHidden = true
    }
    
    @IBAction func button2Press(_ sender: Any) {
        button2.isHidden = true
    }
    
    
    @IBAction func button3Press(_ sender: Any) {
        button3.isHidden = true
    }
    
    @IBAction func didTapCard(_ sender: Any) {

        frontLabel.isHidden = !frontLabel.isHidden
    }
    
    @IBAction func didTapPrev(_ sender: Any) {
        if(currentIndex > 0){
            currentIndex -= 1
        }
        updateLables()
    }
    
    @IBAction func didTapNext(_ sender: Any) {
        if(currentIndex < flashcards.count - 1){
            currentIndex += 1
        }
        updateLables()
    }
    
    func updateLables(){
        let currentFlashcard = flashcards[currentIndex]
        frontLabel.text = currentFlashcard.question
        frontLabel.isHidden = false
        backLabel.text = currentFlashcard.answer_rigth
        button1.setTitle(currentFlashcard.answer_rigth, for: .normal)
        button1.isHidden = false
        button2.setTitle(currentFlashcard.answer_wrong1, for: .normal)
        button2.isHidden = false

        button3.setTitle(currentFlashcard.answer_wrong2, for: .normal)
        button3.isHidden = false

    }
    
    func updateFlashcard(question:String,answer1:String, answer2: String, answer3: String){
        let flashcard =  Flashcard(question: question, answer_rigth: answer1, answer_wrong1: answer2, answer_wrong2: answer3)
       
        frontLabel.text = flashcard.question
        backLabel.text = flashcard.answer_rigth
        button1.setTitle(flashcard.answer_rigth, for: .normal)
        button2.setTitle(flashcard.answer_wrong1, for: .normal)
        button2.isHidden = false
        button3.setTitle(flashcard.answer_wrong2, for: .normal)
        button3.isHidden = false
        
        flashcards.append(flashcard)
        currentIndex = flashcards.count - 1

    }
    
}

