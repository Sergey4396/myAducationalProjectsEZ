//
//  ViewController.swift
//  myAducationalProjectsEZ
//
//  Created by 1234 on 15.03.18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var stringArray = ["Так держать", "Всё получится", "Мы верим в тебя", "Кажется сегодня день дисла Пи", "Это я знаю и помню прекрасно"]
   
    @IBOutlet weak var labelOUTLET: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func intButtonACTION(_ sender: UIButton) {
        let pointForDotDegree = Int(arc4random_uniform(15))
        var pointForDot = 1.0
        for _ in 0...pointForDotDegree{
            pointForDot = pointForDot * 10
        }
        let currentPI = String(( Double.pi * (pointForDot)).rounded(.toNearestOrEven) / pointForDot)
       alertOk(currentTitle: "Случайное PI ", currentMessage: currentPI)
        
    }
    
    @IBAction func stringButtonACTION(_ sender: UIButton) {
        let randomString = Int(arc4random_uniform(UInt32(stringArray.count)))
        alertOk(currentTitle: "😊", currentMessage: stringArray[randomString])
    }
    
    @IBAction func changeLabelButtonACTION(_ sender: Any) {
/*❗️*/     alertYesNoText(currentTitle: "Изменить label", currentMessege: "просто напишите новый label и нажмите \"ОК\"", textPlaceholder: "пишите здесь", currentFunc: setLabel(text:))
    }
    
    @IBAction func exitButtonACTION(_ sender: Any) {
        alertExitYesNo(currentTitle: "Полегче", currentMessege: "exit(0) закроет приложение, но эту функцию запрещено использовать в реальном приложении. Будет отказ в публикации в апсторе")
    }
    
    func alertOk(currentTitle: String, currentMessage:String){
        let alert = UIAlertController(title: currentTitle, message: currentMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
/*❗️*/    func alertYesNoText(currentTitle:String, currentMessege:String, textPlaceholder:String, currentFunc: @escaping (_ text: String) ->Void ){
        //1. Create the alert controller.
        let alert = UIAlertController(title: currentTitle, message: currentMessege, preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.placeholder = textPlaceholder
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            print("Text field: textField?.text")
            
            if textField?.text! != ""{
          //      self.setLabel(text: (textField?.text!)!)
//❗️                currentFunc((textField?.text!)!)
                
            }
                
            else {
                
                let alert = UIAlertController(title: "‼️", message: "пустое поле", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
            
        }))
        //3.5  добавим кнопку отказаться
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)

    }
    
    func alertExitYesNo(currentTitle:String, currentMessege:String){
        //1. Create the alert controller.
        let alert = UIAlertController(title: currentTitle, message: currentMessege, preferredStyle: .alert)
        
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Понятно", style: .default, handler: { (_) in
            
          exit(0)
            
        }))
        //3.5  добавим кнопку отказаться
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
    }
  
    func setLabel(text:String){
        self.labelOUTLET.text = text
    }
    
    
}




