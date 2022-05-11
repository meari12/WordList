//
//  ViewController.swift
//  WordList
//
//  Created by Meri Sato on 2022/05/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //FinishViewControllerまでいった時にスタート画面に戻ってくるためのメソッド
    @IBAction func back(sender: UIStoryboardSegue) {
    }
    
    //startButtonTapped()でスタートボタンを押した時の処理
    @IBAction func startButtonTapped() {
        //saveDataというUserDefaults型からWORDというキーを使って配列があるかどうかの確認をする
        let saveData = UserDefaults.standard
        
        if saveData.array(forKey: "WORD") != nil {
            
            //配列があれば、質問のViewに飛ぶ
            if saveData.array(forKey: "WORD")!.count > 0 {
                performSegue(withIdentifier: "toQuestionView", sender: nil)
            }
        } //配列がなければ、単語登録を促すアラート画面が表示される
        else {
            let alert = UIAlertController(
                title: "単語",
                message: "まずは「単語一覧」をタップして単語登録してください」",
                preferredStyle: .alert
            
            )
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
                ))
            
            self.present(alert, animated: true, completion: nil)
            
            
        }
    }

}

