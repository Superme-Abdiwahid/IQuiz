//
//  ViewController.swift
//  TestJson
//
//  Created by stlp on 5/17/22.
//


 
import UIKit
struct Response: Decodable{
    let title: String
    let desc: String
 let questions: [Question]
}

struct Question: Decodable{
    let text: String
    let answer: String
    let answers: [String]
}
class ViewController: UIViewController {
    private var topics: [String]  = [String]()
    var Question: [String] = [String]()
    
    var map = [String: [[String]]]()
    
    var math: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "http://tednewardsandbox.site44.com/questions.json"
        fetchJson(url)
        print(Question)
    }
    
    func fetchJson(_ url: String){
      let task =   URLSession.shared.dataTask(with: URL(string: url)!, completionHandler:{data, response, error in
            
            guard let data = data, error == nil else{
                print("SOMETHING WENT WRONG")
                return
            }
            
          print("Abdiwahid", data)
            
           var result: [Response]?
            do{
                result = try JSONDecoder().decode([Response].self, from: data)
               // result = try JSONDecoder().decode([Response].self, from: data)
            }
            catch{
                print(" Failed to convert", error)
            }
            
            guard let json = result else{
                return
            }
          
          for i in 0...result!.count - 1{
              
              self.topics.append(result![i].title)
              var StringArray = [[String]]()
              for j in 0...result![i].questions.count - 1{
                  self.Question.append(result![i].questions[j].text)
                  self.math = result![2].questions[0].text;
                  var innerArray: [String] = [String]()
                  innerArray.append(result![i].questions[j].answer)
                  innerArray.append(contentsOf: result![i].questions[j].answers)
                  
                  StringArray.append(innerArray)
                  self.map[result![i].questions[j].text] = StringArray

              }
              print("MAP", self.map)
          }
            
        })
        task.resume()
    }


}


