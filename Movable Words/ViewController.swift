//
//  ViewController.swift
//  Movable Words
//
//  Created by Леонид Лукашевич on 26.09.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var words: Array<String> = []

    @IBOutlet weak var wordsTF: UITextField!
    @IBOutlet weak var fromTF: UITextField!
    @IBOutlet weak var toTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func toMove(_ sender: Any) {
        
        toReadString()
        toMoveWords()
        toPrintResult()
    }
    
    private func toReadString() {
        
        guard let string = wordsTF.text else { return }
        
//        var wordsForResult: String = ""
        var word: String = ""
        var num: Int = 0

        for char in string {
            if char != " " {
                word.append(char)
            } else {
//                word.append(" ")
                if words.count <= num {
                    words.append(word)
                    num += 1
                } else {
                    words[num] = word
                }
                word = ""
            }
        }
    }
    
    private func toMoveWords() {
        
        guard let from = Int(fromTF.text!) else { return }
        guard let to = Int(toTF.text!) else { return }

        var num: Int = 0
        
        for i in from...to {
            words.insert(words.remove(at: i-1), at: num)
            num += 1
        }
    }
    
    private func toPrintResult() {
        
        var stringForResult: String = ""
        
        for word in words {
            stringForResult.append("\(word) ")
        }
        
        words = [] // Обязательно очистить массив, который объявлен в родителе относительно toReadString()
        wordsTF.text = stringForResult
    }
}
