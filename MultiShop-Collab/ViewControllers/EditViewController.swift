//
//  EditViewController.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 01/07/24.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var tfFirstname: UITextField!
    
    @IBOutlet weak var tfLastname: UITextField!
    
    @IBOutlet weak var tfPhone: UITextField!
    
    @IBOutlet weak var btnCancel: UIButton!
    
    @IBOutlet weak var btnMale: UIButton!
    
    @IBOutlet weak var btnFemale: UIButton!
    
    @IBOutlet weak var dobPicker: UIDatePicker!
    
    @IBOutlet weak var imgProfilePicture: UIImageView!
    
    var gender: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnMale.backgroundColor  = .systemGray4
        btnFemale.backgroundColor = .systemGray4
        
        btnMale.applyCornerRadius(radius: 3)
        btnFemale.applyCornerRadius(radius: 3)
        
        btnCancel.layer.borderWidth = 1
        btnCancel.layer.borderColor = UIColor(named: "ButtonCancelBorder")?.cgColor
        btnCancel.applyCornerRadius(radius: 5)
        
        tfPhone.delegate = self
        tfLastname.delegate = self
        tfFirstname.delegate = self
    }
    
    @IBAction func actionGender(_ sender: UIButton) {
        
        if sender.tag == 1 {
            gender = "Male"
            btnMale.backgroundColor = .systemBlue
            btnMale.tintColor = .white
            btnFemale.backgroundColor = .systemGray4
            btnFemale.tintColor = .black
            
        }else{
            gender = "Female"
            btnMale.backgroundColor = .systemGray4
            btnMale.tintColor = .black
            btnFemale.backgroundColor = .systemBlue
            btnFemale.tintColor = .white
        }
        print("gender", gender!)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            textField.applyCornerRadius(radius: 5)
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor(resource: .appRed).cgColor
        }else if textField.tag == 3 && textField.text!.count < 10{
            textField.applyCornerRadius(radius: 5)
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor(resource: .appRed).cgColor
        }else{
            textField.layer.borderWidth = 0
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 3{
            return string.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil && range.location < 10
        }
        return true
    }
    
    
    @IBAction func actionSelectProfilePicture(_ sender: Any) {
    }
    
    @IBAction func actionUpdateDetails(_ sender: Any) {
        
        if validateEntries() {
            alertUser(message: "Edit Success")
        }
    }
    
    @IBAction func actionCancel(_ sender: Any) {
    }
    
    func validateEntries() -> Bool{
        if tfFirstname.text == "" || tfLastname.text == "" || tfPhone.text == "" || tfPhone.text!.count < 10 {
            alertUser(message: "Enter Valid Entries")
            return false
        }else if gender == nil{
            alertUser(message: "Select Gender")
            return false
        }else{
            return true
        }
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
