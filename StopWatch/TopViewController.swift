//
//  ViewController.swift
//  StopWatch
//
//  Created by Cooper Whitlow on 3/26/16.
//  Copyright © 2016 Cooper Whitlow. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    //Enums instead?
    let fightClubQuotes = [
        "No fear. No distractions. The ability to let that which does not matter truly slide.",
        "I say never be complete, I say stop being perfect, I say let’s evolve, let the chips fall where they may.",
        "This is your life, and it’s ending one minute at a time.",
        "Sticking feathers up your butt does not make you a chicken.",
        "People do it everyday, they talk to themselves… they see themselves as they’d like to be, they don’t have the courage you have, to just run with it.",
        "You’re not your job. You’re not how much money you have in the bank. You’re not the car you drive. You’re not the contents of your wallet. You’re not your fucking khakis.",
        "It’s only after we’ve lost everything that we’re free to do anything."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let randomSafeIndex = arc4random_uniform(UInt32(fightClubQuotes.count))
        
        quoteLabel.text = fightClubQuotes[Int(randomSafeIndex)]
        authorLabel.text = "—Tyler Durden"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

