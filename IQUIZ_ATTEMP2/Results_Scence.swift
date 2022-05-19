//
//  Results_Scence.swift
//  IQUIZ_ATTEMP2
//
//  Created by stlp on 5/17/22.
//

import Foundation
import UIKit
class Results_Scence: UIViewController{
    public var totalCorrect = 0;
    public var totalQuestion = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        var percentage = Double(totalCorrect) / Double(totalQuestion) * 100.0
        Display_Results.text = "You got " + String(totalCorrect) +
        "/" + String(totalQuestion) +  " correct " + String(Int(percentage)) + "%"
    }
    @IBOutlet weak var Display_Results: UILabel!
}
