//
//  AddViewController.swift
//  WordList
//
//  Created by Meri Sato on 2022/05/10.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [Dictionary<String, String>] = []
    
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        if saveData.array(forKey: "WORD") != nil {
            wordArray = saveData.array(forKey: "WORD")as! [Dictionary<String, String>]
        }
    }
    
    @IBAction func saveWord() {
        
        
        if englishTextField.text == "" {
            let alert = UIAlertController(
            title: "エラー",
            message: "テキストが入力されていません",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "入力し直す",
            style: .default,
            handler: nil
        ))
            return
        }else if japaneseTextField.text == "" {
            
            let alert = UIAlertController(
                title: "エラー",
                message: "テキストが入力されていません",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                title: "入力し直す",
                style: .default,
                handler: nil
            ))
            return
        } else  {
            let wordDictionary = ["english": englishTextField.text!, "japanese": japaneseTextField.text!]
            
            wordArray.append(wordDictionary)
            saveData.set(wordArray, forKey: "WORD")
            //保存が無事に終わったら、アラートを表示してユーザーに完了したことを知らせる
            let alert = UIAlertController(
                title: "保存完了",
                message: "単語の登録が完了しました",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
        
        
        present(alert, animated: true, completion: nil)
        englishTextField.text = ""
        japaneseTextField.text = ""
            
        }
        
        

        // Do any additional setup after loading the view.
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
