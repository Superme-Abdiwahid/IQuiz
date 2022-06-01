//
//  Main.swift
//  IQUIZ_ATTEMP2
//
//  Created by stlp on 5/17/22.
//

import Foundation
import UIKit

class Main: UIViewController{
    public var topics: [String] = [String]()
    var QuestionsAndAnswer = [[String]]()
    var count = 1
    var found = false;
    public var url = "http://tednewardsandbox.site44.com/questions.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.TableView.reloadInputViews()
            self.TableView.reloadData()
        }
        print("THIS", url)
        fetchJson(url)
        TableView.delegate = self
        TableView.dataSource = self
        DispatchQueue.main.async {
            self.TableView.reloadInputViews()
            self.TableView.reloadData()
        }
        DispatchQueue.main.async {
            self.TableView.reloadInputViews()
            self.TableView.reloadData()
        }
    }
    func displayAlert(_ title: String, _ message: String, _ LogError: String){
                     let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                     alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment:
                         "Default action"), style: .default, handler: { _ in NSLog(LogError)
                     }))
                     self.present(alert, animated: true, completion: {
                         NSLog("Alerted")})
        
    }
    
    @IBAction func JSON_URL(_ sender: Any) {
    }
    func fetchJson(_ url: String){
      let task =   URLSession.shared.dataTask(with: URL(string: url)!, completionHandler:{data, response, error in
            
            guard let data = data, error == nil else{
                DispatchQueue.main.async {
                self.displayAlert("JSON ERROR", "Error downloading JSON try agaun" , "FAILED")
                }
                return
            }
            
            
           var result: [Response]?
            do{
                result = try JSONDecoder().decode([Response].self, from: data)
            }
            catch{
                DispatchQueue.main.async {
                self.displayAlert("JSON ERROR", "Error downloading JSON try agaun", "FAILED")
                }
            }
            
            guard let json = result else{
                return
            }
          
          for i in 0...result!.count - 1{
              
              self.topics.append(result![i].title)
              var StringArray = [String]()
              
              for j in 0...result![i].questions.count - 1{
                  var innerArray: [String] = [String]()
                  innerArray.append(result![i].title)
                  innerArray.append(result![i].questions[j].text)
                  innerArray.append(result![i].questions[j].answer)
                  innerArray.append(contentsOf: result![i].questions[j].answers)
                  self.QuestionsAndAnswer.append(innerArray)
              }
          }
            
        })
        task.resume()
    }


    
    @IBAction func Settings(_ sender: Any) {
        
    }
    @IBAction func Setting_Button(_ sender: Any) {
    }
    
    @IBOutlet weak var TableView: UITableView!
    
    

    
}




extension Main: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedindex = indexPath.row
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
        for i in 0...QuestionsAndAnswer.count - 1{
            for j in 0...QuestionsAndAnswer[i].count - 1{
                if(QuestionsAndAnswer[i][0] == topics[selectedindex]){
                let customViewController = storyboard.instantiateViewController(withIdentifier: "Question_Scence") as!Begin_StoryBoard
                customViewController.questionsAndAnswers = self.QuestionsAndAnswer
                    customViewController.TopicSelect = QuestionsAndAnswer[i][j]
                    customViewController.question = QuestionsAndAnswer[i]
                self.show(customViewController, sender: nil)
                }
            }
            
        }
    }
    
}


extension Main: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "cell_1", for: indexPath)
        cell.textLabel?.text = topics[indexPath.row]
        return cell
    }
    
}
