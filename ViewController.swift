//
//  ViewController.swift
//  Tests For Teens
//
//  Created by SRINIVASAN Smriti on 7/2/20.
//  Copyright © 2020 Smriti Srinivasan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let questionsD = ["1. Little interest or pleasure in doing things","2. Feeling down, depressed, or hopeless","3. Trouble falling or staying asleep, or sleeping too much","4. Feeling tired or having little energy","5. Poor appetite or overeating","6. Feeling bad about yourself - or that you are a failure or have let yourself or your family down","7. Trouble concentrating on things, such as reading the newspaper or watching television","8. Moving or speaking so slowly that other people could have noticed (Or the opposite - being so fidgety or restless that you have been moving around a lot more than usual)","9. Thoughts that you would be better off dead, or of hurting yourself","10. If you checked off any problems, how difficult have these problems made it for you at work, home, or with other people?"]
    
    let answersD = [["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not at all: 1", "Several days: 2", "More than half the days: 3", "Nearly every day: 4"], ["Not difficult at all: 1", "Somewhat difficult: 2", "Very difficult: 3", "Extremely difficult: 4"]]
    
    // variables
    var currentDQuestion = 0
    
    var ansD1 = 1
    var ansD2 = 2
    var ansD3 = 3
    var ansD4 = 4
    
    var scoreD = 0;
    
    
    // label
    @IBOutlet weak var lbl: UILabel!
    
    // buttons
    @IBAction func action(_ sender: AnyObject) {
        
        guard let button = sender as? UIButton else {
            return
        }
        
        switch button.tag {
        case ansD1:
            scoreD += 0
        case ansD2:
            scoreD += 1
        case ansD3:
            scoreD += 2
        case ansD4:
            scoreD += 3
        default:
            break
        }
        
        if (currentDQuestion != questionsD.count) {
            newDQuestion()
        } else if currentDQuestion == questionsD.count {
            endQuiz() // this will have the end result & the resources
        }
        
        
        override func viewDidAppear(_ animated: Bool) {
            newDQuestion()
        }
        
        
            
        func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        
    }
    
    
    /* @IBAction func action(_ sender: Any) {
        
        /*if ((sender as AnyObject).tag == Int(ansD1)) {
            scoreD += 0
        } else if ((sender as AnyObject).tag == Int(ansD2)) {
            scoreD += 1
        } else if ((sender as AnyObject).tag == Int(ansD3)) {
            scoreD += 2
        } else if ((sender as AnyObject).tag == Int(ansD4)) {
            scoreD += 3
        }
        
        if (currentDQuestion != questionsD.count) {
            newDQuestion()
        } else if currentDQuestion == questionsD.count {
            endQuiz() // this will have the end result & the resources
        }
    
        func viewDidAppear(_ animated: Bool) {
            newDQuestion()
        }
    
    
        
        func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        }

 */

    } */
    
    // creating the function that calls new question

    func newDQuestion() {
        lbl.text = questionsD[currentDQuestion]
    
    
        var button:UIButton = UIButton()
        var x = 1
    
        for i in 1...10 {
            
            // create a button
            
            button = view.viewWithTag(i) as! UIButton
            
            if (i == Int(ansD4)) {
                button.setTitle(answersD[currentDQuestion][0], for: .normal)
            } else if (i == Int(ansD3)) {
                button.setTitle(answersD[currentDQuestion][0], for: .normal)
            } else if (i == Int(ansD2)) {
                button.setTitle(answersD[currentDQuestion][0], for: .normal)
            } else if (i == Int(ansD1)) {
                button.setTitle(answersD[currentDQuestion][0], for: .normal)
            } else {
                button.setTitle(answersD[currentDQuestion][x], for: .normal)
                x=2
            }
        }
        
        currentDQuestion += 1
    
    }
    
    func endQuiz () {
        if (scoreD >= 0 && scoreD <= 4) {
            performSegue(withIdentifier: "Minimal Depression", sender: self)
        } else if scoreD >= 5 && scoreD <= 9 {
            performSegue(withIdentifier: "Mild Depression", sender: self)
        } else if scoreD >= 10 && scoreD <= 14 {
            performSegue(withIdentifier: "Moderate Depression", sender: self)
        }  else if scoreD >= 15 && scoreD <= 19 {
            performSegue(withIdentifier: "Moderately Severe Depression", sender: self)
        } else if scoreD >= 20  && scoreD <= 27 {
            performSegue(withIdentifier: "Severe Depression", sender: self)
        }
    }
    
    
    
    

}

