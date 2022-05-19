//
//  Begin_Storyboard.swift
//  IQUIZ_ATTEMP2
//
//  Created by stlp on 5/17/22.
//

import Foundation
import UIKit
class Begin_StoryBoard: UIViewController{
    public var Question1 = ""
    public var Question2 = ""
    public var Question3 = ""
    public var Question4 = ""
    var chooseAnswerA = false;
    var chooseAnswerB = false;
    var chooseAnswerC = false;
    var chooseAnswerD = false;
    var seen = false;
    var totalCorrect = 0;
    var CurrentGroup = [String: Int]()
    var userChooseCorrectAnswer = false;
    public var questionsAndAnswers = [[String]]()
    public var totalQuestion = 0;
    public var nextQuestion = [String]()
    public var TopicSelect = ""
    public var AlreadySeen = ""
    public var correctAnswer = ""
    public var usersAnswer = ""
    public var question = [String]()
    public var App: AppModel = AppModel()
    private var mode: AppModel = AppModel()
    public var doesTopicHaveMore = false;
    public var Answer = [String]()
    public var map = [String: Int]()
    override func viewDidLoad() {
        Next_Question.isEnabled = false;
        Question_Label.text = "Question Results"
        Answer.append("-1")
        Answer.append("A")
        Answer.append("B")
        Answer.append("C")
        Answer.append("D")
        super.viewDidLoad()
        totalQuestion += 1;
        for i in 0...question.count - 1{
            Question_Label.text = question[1]
            AlreadySeen = question[1]
            map[question[1]] = -1
            CurrentGroup[question[1]] = -1
            Answer_Choice_A.setTitle(question[3], for: .normal)
            Answer_ChoiceB.setTitle(question[4], for: .normal)
            Answer_Choice_C.setTitle(question[5], for: .normal)
            Answer_Choice_D.setTitle(question[6], for: .normal)
            correctAnswer = question[2]
        }
        for i in 0...questionsAndAnswers.count - 1{
            for j in 0...questionsAndAnswers[i].count - 1{
                if(questionsAndAnswers[i][0] == TopicSelect){
                    if(questionsAndAnswers[i][1] != AlreadySeen && (map[questionsAndAnswers[i][1]] == nil)){
                        question = questionsAndAnswers[i]
                        if(nextQuestion.count == 0){
                            nextQuestion = questionsAndAnswers[i]
                        }
                        seen = true;
                        doesTopicHaveMore = true;
                        break
                    }
                }
                
            }
            
        }
    }
    @IBAction func Next_Question(_ sender: Any) {
    }
    @IBOutlet weak var Next_Question: UIButton!
    @IBAction func Chose_D(_ sender: Any) {
        Next_Question.isEnabled = true;
        chooseAnswerB = false;
        chooseAnswerA = false;
       chooseAnswerC = false;
        chooseAnswerD = true;
        if(Answer[Int(correctAnswer)!] == "D"){
            userChooseCorrectAnswer = true;
        }else{
            userChooseCorrectAnswer = false;
        }
       userChooseCorrectAnswer = false;
        Next_Question.isEnabled = true;
    }
    @IBAction func Next_Button(_ sender: Any) {
    }
    @IBAction func Chose_C(_ sender: Any) {
        Next_Question.isEnabled = true;
        chooseAnswerB = false;
        chooseAnswerA = false;
       chooseAnswerC = true;
        chooseAnswerD = false;
        if(Answer[Int(correctAnswer)!] == "C"){
            userChooseCorrectAnswer = true;
        }else{
            userChooseCorrectAnswer = false;
        }
    }
    @IBAction func Chose_B(_ sender: Any) {
        Next_Question.isEnabled = true;
        chooseAnswerB = true;
        chooseAnswerA = false;
       chooseAnswerC = false;
        chooseAnswerD = false;
        if(Answer[Int(correctAnswer)!] == "B"){
            userChooseCorrectAnswer = true;
        }else{
            userChooseCorrectAnswer = false;
        }
    }
    @IBAction func Chose_A(_ sender: Any) {
        Next_Question.isEnabled = true;
        chooseAnswerB = false;
        chooseAnswerA = true;
        chooseAnswerC = false;
        chooseAnswerD = false;
        if(Answer[Int(correctAnswer)!] == "A"){
            userChooseCorrectAnswer = true;
        }else{
            userChooseCorrectAnswer = false;
        }
        
    }
    @IBOutlet weak var Answer_Choice_D: UIButton!
    @IBOutlet weak var Answer_Choice_C: UIButton!
    @IBOutlet weak var Answer_ChoiceB: UIButton!
    @IBOutlet weak var Answer_Choice_A: UIButton!
    @IBOutlet weak var Question_Label: UILabel!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier
        {
        case Optional("Next_Question_Scence"):
            
        let choice = segue.destination as! Answer_Scence
            choice.chooseCorrectAnswer = self.userChooseCorrectAnswer
            if(userChooseCorrectAnswer){
                choice.totalCorrect = totalCorrect + 1
            }else{
                choice.totalCorrect = totalCorrect;
            }
            choice.chooseanswerA = chooseAnswerA
            choice.chooseanswerc = chooseAnswerC
            choice.chooseanswerb = chooseAnswerB
            choice.chooseanswerd = chooseAnswerD
            choice.correctAnswer = Answer[Int(correctAnswer)!]
            choice.AlreadySeenQuestions = map
            choice.totalQuestion = totalQuestion
            choice.moreQuestionsLeft = doesTopicHaveMore
            choice.topicSelected = TopicSelect
            choice.question = nextQuestion
            choice.questionsAndAnswers = questionsAndAnswers
        default:
            print("Error in Segue")
        }
}
}
