//
//  Settings.swift
//  IQUIZ_ATTEMP2
//
//  Created by stlp on 6/1/22.
//

import Foundation
import UIKit
class Settings: UIViewController{
    public var URL = ""
    override func viewDidLoad() {
        HomePage.isEnabled = false;
        super.viewDidLoad()
    }
   
    @IBOutlet weak var HomePage: UIButton!
    
    @IBAction func JSON(_ sender: Any) {
        self.URL = Enter.text!
        HomePage.isEnabled = true;
    }
    @IBOutlet weak var Enter: UITextField!
    
    
    @IBAction func Done(_ sender: Any) {
        print("ALREADY SEEN", URL)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier
        {
        case Optional("HomePage_Settings"):
            
        let choice = segue.destination as! Main
            print("THe url IS", self.URL)
            choice.url = self.URL
            
            
        default:
            print("Error in Segue")
        }
}
}
