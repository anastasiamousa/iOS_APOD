//
//  DatePickerViewController.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 7/7/23.
//

import UIKit

class DatePickerViewController: BaseViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var firstTextFieldLabel: UILabel!
    
    @IBOutlet weak var firstTextField: UITextField!
    
    @IBOutlet weak var secondTextFieldLabel: UILabel!
    
    @IBOutlet weak var secondTextField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    //MARK: - IBActions
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        self.fetchImages()
    }
    
    //MARK: - Properties
    
    private let datePicker = UIDatePicker()
    private var startDate: Date?
    private var endDate: Date?
    private let network = NetworkService()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
        self.enableTargetsIfNeeded()
    }
    
    //MARK: - Methods
}

//MARK: - Privates

private extension DatePickerViewController {
    
    func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setUpUI() {
        // navigation
        self.title = NSLocalizedString("search_tab_title", comment: "")
        navigationController?.navigationBar.prefersLargeTitles = true
        
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
    
    func enableTargetsIfNeeded() {
        submitButton.setEnabled(firstTextField.text?.isEmpty == false && secondTextField.text?.isEmpty == false)
        secondTextField.setEnabled(firstTextField.text?.isEmpty == false)
        secondTextFieldLabel.setEnabled(firstTextField.text?.isEmpty == false)
    }
    
    func fetchImages() {
        guard let startDate = startDate, let endDate = endDate else { return }
        showLoading(true)
        network.fetchImages(from: startDate, to: endDate) { [weak self] result in
            self?.showLoading(false)
            switch result {
                
            case .success(let images):
                let presenter = PhotoTablePresenter(images: images)
                let controller = PhotosTableViewController(presenter: presenter)
                self?.navigationController?.pushViewController(controller, animated: true)
    
            case .failure(let error):
                self?.presentError(error)
            }
        }
    }
    
    // objcs
    @objc func cancelPressed() {
        self.view.endEditing(true)
    }
    
    @objc func donePressed() {
        let date = datePicker.date
        if firstTextField.isEditing {
            startDate = date
            firstTextField.text = date.toDMonthYYYY
            datePicker.minimumDate = date
            enableTargetsIfNeeded()
            secondTextField.becomeFirstResponder()
        } else {
            endDate = date
            secondTextField.text = date.toDMonthYYYY
            self.view.endEditing(true)
            enableTargetsIfNeeded()
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        let info = notification.userInfo
        let keyboardSize = (info?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize?.height ?? 0, right: 0)
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = .zero
    }
}
