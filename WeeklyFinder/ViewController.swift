//
//  ViewController.swift
//  WeeklyFinder
//
//  Created by Сергей Лукичев on 14.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateInput: UITextField!
    @IBOutlet weak var monthField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func findDay(_ sender: UIButton) {
        
        guard let day = dateInput.text, let month = monthField.text, let year = yearField.text else { return }
        
        // Устанавливаем текущий календарь
        let calendar = Calendar.current
        //Собираем дату из компонентов
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        // Устанавливаем формат даты
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        dateFormatter.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponents) else { return }
        
        let weekday = dateFormatter.string(from: date)
        
        resultLabel.text = weekday.capitalized
    }
    
    // Сворачивать клавиатуру по нажатию на экран
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

