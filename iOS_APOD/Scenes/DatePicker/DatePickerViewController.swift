//
//  DatePickerViewController.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 7/7/23.
//

import UIKit

class DatePickerViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var firstTextFieldLabel: UILabel!
    
    @IBOutlet weak var firstTextField: UITextField!
    
    @IBOutlet weak var secondTextFieldLabel: UILabel!
    
    @IBOutlet weak var secondTextField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    //MARK: - IBActions

    //MARK: - Properties
    
    private let datePicker = UIDatePicker()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
    }
    
    //MARK: - Methods
}

//MARK: - Privates

private extension DatePickerViewController {
    
    func registerNotifications() {
        
    }
    
    func setUpUI() {
        // font
        titleLabel.setFont(font: .bold(16), color: .black)
        firstTextFieldLabel.setFont(font: .regular(14), color: .gray)
        secondTextFieldLabel.setFont(font: .regular(14), color: .gray)
        
        // texts
        titleLabel.text = NSLocalizedString("DatePickerViewController_title", comment: "")
        firstTextFieldLabel.text = NSLocalizedString("DatePickerViewController_first_textField_title", comment: "")
        secondTextFieldLabel.text = NSLocalizedString("DatePickerViewController_second_textField_title", comment: "")
        submitButton.setTitle(NSLocalizedString("DatePickerViewController_button_title", comment: ""), for: .normal)
        
        firstTextField.placeholder = NSLocalizedString("DatePickerViewController_first_textField_placeholder", comment: "")
        secondTextField.placeholder = NSLocalizedString("DatePickerViewController_second_textField_placeholder", comment: "")
        
        // input
        firstTextField.inputView  = datePicker
        secondTextField.inputView = datePicker
                
        // button UI
        submitButton.setTitleColor(Color.Text.white.color, for: .normal)
        submitButton.backgroundColor = Color.Background.petrol.color
        submitButton.roundCorners(radius: 4)
        
        // datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Date()
        
        // datePicker toolBar
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        let cancelBarButton = UIBarButtonItem(title: NSLocalizedString("Cancel", comment: ""), style: .plain, target: self, action: #selector(cancelPressed))
        let doneBarButton = UIBarButtonItem(title: NSLocalizedString("Done", comment: ""), style: .plain, target: self, action: #selector(donePressed))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelBarButton, flexibleSpace, doneBarButton], animated: false)
        firstTextField.inputAccessoryView  = toolBar
        secondTextField.inputAccessoryView = toolBar
    }
    
    @objc func cancelPressed() {
        self.view.endEditing(true)
    }
    
    @objc func donePressed() {
        self.view.endEditing(true)
    }
}
