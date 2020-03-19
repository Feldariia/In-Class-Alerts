//
//  ViewController.swift
//  In Class Alerts
//
//  Created by Shannon Mong on 2/18/20.
//  Copyright © 2020 Shannon Mong. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
    
    }
    @IBOutlet weak var usernameField: UITextField!


    @IBAction func displayAlert(_ sender: Any) {
    
    //Setup the alert
        let alert = UIAlertController(title: "WARNING" ,message: "Are you in the right headspace to receive information that could possibly hurt you?", preferredStyle:.alert)
        
    //Add the action
        alert.addAction(UIAlertAction(title: NSLocalizedString("idk", comment: "Default action"), style: .`default`))
    
        //Display rhe alert
        self.present(alert,animated: true, completion: nil)
    }
    
    @IBAction func playMedia(_ sender: Any) {
        
        //play .wav file
        var soundID: SystemSoundID = 0
        let soundFile:String=Bundle.main.path(forResource:"r2-d2" , ofType: "wav")!
        let soundURL: NSURL = NSURL(fileURLWithPath: soundFile);AudioServicesCreateSystemSoundID(soundURL, &soundID);AudioServicesPlaySystemSound(soundID)
        
        
        //Vibrate Phone
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        
    }
   
    
    @IBAction func enterInfo(_ sender: Any) {
        
        //Design the input collection
        let ac = UIAlertController(title: "Enter credentials for free Bitcoins", message: nil , preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "(✿◠‿◠)", style: .default) { [unowned ac] _ in
            let answer = ac.textFields![0]
            self.usernameField.text = answer.text
       
        //Design the second alert
            let alert = UIAlertController(title: "you fool," , message: answer.text, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("oh", comment: "Default action" ), style: .`default`, handler: {_ in}))
            
            //Display the alert
            self.present(alert,animated: true, completion: nil)}
        ac.addAction(submitAction)
        present(ac, animated:true)
    
        
        }
    }

