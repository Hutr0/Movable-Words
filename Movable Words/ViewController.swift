//
//  ViewController.swift
//  Movable Words
//
//  Created by Леонид Лукашевич on 26.09.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var stringForMovement: String = ""
    var words: Dictionary<Int, String> = [:]
//    var stringForResult: String?

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
    }
    
    private func toReadString() {
        
        guard let stringForMove = wordsTF.text else { return }
        
//        var wordsForResult: String = ""
        var word: String = ""
        var num: Int = 0

        for char in stringForMove {
            if char != " " {
                word.append(char)
            } else {
                word.append(" ")
                words = [num: word]
                num += 1
            }
        }
        
//        for w in words {
//            wordsForResult.append(w.value)
//        }
//
//        stringForMovement = wordsForResult
    }
    
    private func toMoveWords() {
        
        guard let from = Int(fromTF.text!) else { return }
        guard let to = Int(toTF.text!) else { return }
        
        var num: Int = 0
        var begin: String?
        var end: String?
        
        for i in from-1...to-1 {
            
            begin = words[num]
            words[num] = words[i]
//            words.
        }
        
        for word in words {
            stringForMovement.append(word.value)
        }
    }
}
