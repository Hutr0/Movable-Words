//
//  ViewController.swift
//  Movable Words
//
//  Created by Леонид Лукашевич on 26.09.2020.
//

import UIKit

class ViewController: UIViewController {
    
//    var stringForMove: String?

    @IBOutlet weak var wordsTF: UITextField!
    @IBOutlet weak var fromTF: UITextField!
    @IBOutlet weak var toTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func toMoveWords(_ sender: Any) {
        
        toReadString()
    }
    
    private func toReadString() {
        
        guard let stringForMove = wordsTF.text else { return }
        
        var word: String = ""
        var words = Dictionary<Int, String>()
        var wordsForResult: String = ""
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
        
        for w in words {
            wordsForResult.append(w.value)
        }
        
        wordsTF.text = wordsForResult
    }
}
