//
//  ViewController.swift
//  FunWithViews
//
//  Created by James Campagno on 6/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var diceScoresDisplay: [String] = []
    
    // views represent dice's dots
    @IBOutlet weak var one: UIView!
    @IBOutlet weak var three: UIView!
    @IBOutlet weak var four: UIView!
    @IBOutlet weak var five: UIView!
    @IBOutlet weak var six: UIView!
    @IBOutlet weak var seven: UIView!
    @IBOutlet weak var nine: UIView!
    
    // views represent previous dice scores history bar
    @IBOutlet weak var w1: UIView!
    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var w2: UIView!
    @IBOutlet weak var l2: UILabel!
    @IBOutlet weak var w3: UIView!
    @IBOutlet weak var l3: UILabel!
    @IBOutlet weak var w4: UIView!
    @IBOutlet weak var l4: UILabel!
    @IBOutlet weak var w5: UIView!
    @IBOutlet weak var l5: UILabel!
    @IBOutlet weak var w6: UIView!
    @IBOutlet weak var l6: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disableViewsAndLables()
        disableViewsCurrentDiceScore()
    }
    
    
    @IBAction func diceButtonTapped(sender: AnyObject) {
        disableViewsCurrentDiceScore()
        let currentDiceValue = randomDiceRoll()
                print("\(currentDiceValue)")
        diceScoresDisplay.append("\(currentDiceValue)")
        if diceScoresDisplay.count > 6 {
            diceScoresDisplay.removeAtIndex(0)
        }
        displayCurrentDiceScore(currentDiceValue)
        displaySoureInHisotyBar(currentDiceValue)
        
    }
    
    
    func displaySoureInHisotyBar(value: Int) {
        let howManyScoresDisplied = diceScoresDisplay.count
        switch howManyScoresDisplied {
            case 1 :
                w1.hidden = false
                l1.hidden = false
                l1.text = "\(value)"
            case 2 :
                w2.hidden = false
                l2.hidden = false
                l2.text = "\(value)"
            case 3 :
                w3.hidden = false
                l3.hidden = false
                l3.text = "\(value)"
            case 4 :
                w4.hidden = false
                l4.hidden = false
                l4.text = "\(value)"
            case 5 :
                w5.hidden = false
                l5.hidden = false
                l5.text = "\(value)"
            case 6 :
                w6.hidden = false
                l6.hidden = false
                l1.text = diceScoresDisplay[0]
                l2.text = diceScoresDisplay[1]
                l3.text = diceScoresDisplay[2]
                l4.text = diceScoresDisplay[3]
                l5.text = diceScoresDisplay[4]
                l6.text = diceScoresDisplay[5]
            default: "OMG you hit this line! Dude, you in trouble!"
        }
    }
    
    
    func displayCurrentDiceScore(value: Int) {
        switch value {
        case 1 :
            five.hidden = false
        case 2 :
            one.hidden = false
            nine.hidden = false
        case 3 :
            three.hidden = false
            five.hidden = false
            seven.hidden = false
        case 4 :
            one.hidden = false
            three.hidden = false
            seven.hidden = false
            nine.hidden = false
        case 5 :
            one.hidden = false
            three.hidden = false
            five.hidden = false
            seven.hidden = false
            nine.hidden = false
        case 6 :
            one.hidden = false
            three.hidden = false
            four.hidden = false
            five.hidden = false
            six.hidden = false
            seven.hidden = false
            nine.hidden = false
        default : "Dice can be in range from 1 to 6 only"
        }
    }
    
    
    func randomDiceRoll() -> Int {
        return Int(arc4random_uniform(6) + 1)
    }
    
    
    func disableViewsAndLables() {
        // views represent previous dice scotes
        l1.text = ""
        l2.text = ""
        l3.text = ""
        l4.text = ""
        l5.text = ""
        l6.text = ""
        w1.hidden = true
        w2.hidden = true
        w3.hidden = true
        w4.hidden = true
        w5.hidden = true
        w6.hidden = true
    }
    
    
    func disableViewsCurrentDiceScore() {
        // views represent dice's dots
        one.hidden = true
        three.hidden = true
        four.hidden = true
        five.hidden = true
        six.hidden = true
        seven.hidden = true
        nine.hidden = true
    }
}
