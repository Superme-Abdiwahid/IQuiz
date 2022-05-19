import Foundation
import UIKit
class Answer_Scence: UIViewController{
    var chooseCorrectAnswer = false;
    var chooseanswerA = false;
    var chooseanswerb = false;
    var chooseanswerc = false;
    var chooseanswerd = false;
    var correctAnswer = "";
    var totalCorrect = 0;
    var moreQuestionsLeft = false;
    var question = [String]()
    var topicSelected = ""
    var totalQuestion = 0;
    var alreadSeen = [String: Int]()
    public var questionsAndAnswers = [[String]]()
    var AlreadySeenQuestions = [String: Int]()
    var answerChoices: [String] = ["A", "B", "C", "D"]
    var options: [String] = ["You choose Answer A", "You choose Answer B",
                            "You choose Answer C", "You choose Answer D"]
    @IBOutlet weak var Display_Answer: UILabel!
    @IBOutlet weak var Users_Choice: UILabel!
    @IBOutlet weak var Answer_Title: UILabel!
    var displayResult: [String] = [String]()

    override func viewDidLoad() {
        print("TOTAL CORRECT = ", totalCorrect)
        Answer_Title.text = "Previous Question Result"
        var Answer = "Incorrect! The actual correct answer is " + correctAnswer
        displayResult.append(Answer)
        displayResult.append("Correct Congrats!!!")
        if(chooseanswerA){
            Users_Choice.text = options[0]
            if(correctAnswer == "A"){
            Display_Answer.text = displayResult[1]
            }else{
                Display_Answer.text = displayResult[0]
            }
        }else if(chooseanswerb){
            Users_Choice.text = options[1]
            if(correctAnswer == "B"){
            Display_Answer.text = displayResult[1]
            }else{
                Display_Answer.text = displayResult[0]
            }
        }else if(chooseanswerc){
            Users_Choice.text = options[2]
            if(correctAnswer == "C"){
            Display_Answer.text = displayResult[1]
            }else{
                Display_Answer.text = displayResult[0]
            }
        }else{
            Users_Choice.text = options[3]
            if(correctAnswer == "D"){
            Display_Answer.text = displayResult[1]
            }else{
                Display_Answer.text = displayResult[0]
            }
        }
        super.viewDidLoad()
        
    }
    
    @IBAction func Next_Button(_ sender: Any) {
        if(moreQuestionsLeft){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let customViewController = storyboard.instantiateViewController(withIdentifier: "Question_Scence") as!Begin_StoryBoard
            customViewController.question = question;
            customViewController.questionsAndAnswers = questionsAndAnswers
            customViewController.map = AlreadySeenQuestions
            customViewController.question = question
            customViewController.TopicSelect = topicSelected
            customViewController.CurrentGroup = alreadSeen
            customViewController.questionsAndAnswers = self.questionsAndAnswers
            customViewController.totalQuestion = totalQuestion
            customViewController.totalCorrect = totalCorrect
            self.show(customViewController, sender: nil)
        }else{
            print("Move on to the results the quiz is done")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let customViewController = storyboard.instantiateViewController(withIdentifier: "finished_Scence")
            as!Results_Scence
            customViewController.totalQuestion = totalQuestion
            customViewController.totalCorrect = totalCorrect
            self.show(customViewController, sender: nil)
        }
    }
    
}
