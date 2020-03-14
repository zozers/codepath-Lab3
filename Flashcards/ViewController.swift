//
//  ViewController.swift
//  Flashcards
//
//  Created by Zoe Offermann on 2/12/20.
//  Copyright © 2020 Zoe Offermann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
            
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
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
    
    func updateFlashcard(question:String,answer1:String, answer2: String, answer3: String){
        frontLabel.text = question
        backLabel.text = answer1
        button1.setTitle(answer1, for: .normal)
        button2.setTitle(answer2, for: .normal)
        button2.isHidden = false
        button3.setTitle(answer3, for: .normal)
        button3.isHidden = false

    }
    
}

