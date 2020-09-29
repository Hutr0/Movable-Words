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
        
        var num: Int = 1
        var word: String = ""
        var lastChar: Character?
        
        for char in string {
            if char != " " {
                word.append(char)
                if string.count == num {
                    words.append(word)
                    word = ""
                }
            } else {
                if lastChar != " " || lastChar == nil {
                    words.append(word)
                    word = ""
                }
            }
            num += 1
            lastChar = char
        }
    }
    
    private func toMoveWords() {
        
        guard let from = Int(fromTF.text!) else { return }
        guard let to = Int(toTF.text!) else { return }
        
        if from <= to && to <= words.count {
            if words.count >= to {
                var num: Int = 0
                
                for i in from...to {
                    words.insert(words.remove(at: i-1), at: num)
                    num += 1
                }
            }
        } else {
            let refreshAlert = UIAlertController(title: "Ошибка", message: "Введён неверный диапазон", preferredStyle: .alert)

            refreshAlert.addAction(UIAlertAction(title: "Закрыть", style: .cancel, handler: nil))

            self.present(refreshAlert, animated: true, completion: nil)
        }
    }
    
    private func toPrintResult() {
        
        var num: Int = 1
        var stringForResult: String = ""
        
        for word in words {
            stringForResult.append(word)
            if words.count != num {
                stringForResult.append(" ")
            }
            num += 1
        }
        
        words = [] // Обязательно очистить массив, который объявлен в родителе относительно toReadString()
        wordsTF.text = stringForResult
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
