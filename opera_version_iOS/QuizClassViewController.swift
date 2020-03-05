//
//  QuizViewController.swift
//  opera_version_iOS
//
//  Created by yiliang fu on 30/01/2020.
//  Copyright © 2020 yiliang fu. All rights reserved.
//

import UIKit

struct Question {
    var questionTitle: String
    var cas1: String
    var cas2: String
    var cas3: String
    var cas4: String
    var answer: Int
}

@available(iOS 13.0, *)
class QuizClassViewController: UIViewController, XMLParserDelegate {

    var questions: [Question] = []
    var elementName: String = String()
    var questionTitle = String()
    var cas1 = String()
    var cas2 = String()
    var cas3 = String()
    var cas4 = String()
    var answer = Int()
    
    var ordreQuestions: [Int] = []

    var m_nombreDeQuestions = Int(0)
    var m_incrementationQuestion = Int(0)
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == answer {
            print("correct")
            sender.backgroundColor = UIColor.green
            
            let secondsToDelay = 0.2
            DispatchQueue.main.asyncAfter(deadline: .now() + secondsToDelay) {
                // Put any code you want to be delayed here
                self.updateQuestion(incrementationQuestion: self.m_incrementationQuestion)
            }
            
        } else {
            print("faux")
            sender.backgroundColor = UIColor.red
        }
    }
    
    
    
    //Parsing XML file part:
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.url(forResource: "Questions", withExtension: "xml") {
            if let parser = XMLParser(contentsOf: path) {
                parser.delegate = self
                parser.parse()
            }
        }
        
        m_nombreDeQuestions = Int(questions.count)
        
        //Melanger le tableau de question de maniere aleatoire
        questions.shuffle()
        
        updateQuestion(incrementationQuestion: m_incrementationQuestion)
    }
    
    
    
    func updateQuestion(incrementationQuestion: Int){
        buttonA.backgroundColor = UIColor.lightGray
        buttonB.backgroundColor = UIColor.lightGray
        buttonC.backgroundColor = UIColor.lightGray
        buttonD.backgroundColor = UIColor.lightGray
        
        label.text = questions[incrementationQuestion].questionTitle
        buttonA.setTitle(questions[incrementationQuestion].cas1, for: UIControl.State.normal)
        buttonB.setTitle(questions[incrementationQuestion].cas2, for: UIControl.State.normal)
        buttonC.setTitle(questions[incrementationQuestion].cas3, for: UIControl.State.normal)
        buttonD.setTitle(questions[incrementationQuestion].cas4, for: UIControl.State.normal)
        answer = questions[incrementationQuestion].answer
        
        m_incrementationQuestion += 1
        if m_incrementationQuestion == m_nombreDeQuestions {
            //Une fois que l'on a balayé toutes les questions on recommence à 0
            m_incrementationQuestion = 0
        }
    }
    
    
    // 1
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {

        if elementName == "question" {
            questionTitle = String()
            cas1 = String()
            cas2 = String()
            cas3 = String()
            cas4 = String()
            answer = Int()
        }

        self.elementName = elementName
    }

    // 2
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "question" {
            let question = Question(questionTitle: questionTitle, cas1: cas1, cas2: cas2, cas3: cas3, cas4: cas4, answer: answer)
            questions.append(question)
        }
    }

    // 3
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        if (!data.isEmpty) {
            if self.elementName == "nom" {
                questionTitle += data
            } else if self.elementName == "cas1" {
                cas1 += data
            } else if self.elementName == "cas2" {
                cas2 += data
            } else if self.elementName == "cas3" {
                cas3 += data
            } else if self.elementName == "cas4" {
                cas4 += data
            } else if self.elementName == "solution" {
                answer = (data as NSString).integerValue
            }
        }
    }

    
    @IBAction func backtohomepage(_ sender: Any) {
        
        self.performSegue(withIdentifier: "backtohomepage", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "backtohomepage"
        {
            let dest = segue.destination as! homePageViewController
            dest.hero.modalAnimationType = .selectBy(presenting: .zoomSlide(direction: .right), dismissing: .zoomSlide(direction: .left))
        }
        
        
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
