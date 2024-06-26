//
//  TypeAddressViewController.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit



class TypeAddressViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var viewAddress: UIView!
    
    
    @IBOutlet weak var TfSelectAddressType: UITextField!
    
    @IBOutlet weak var textViewAddress: UITextView!
    
    var delegate: SaveAddress!
    
    var addressType = ["Select Address", "Home", "Office", "Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextfield()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionClose(_ sender: Any) {
        closePresenting()
    }
    
    
    @IBAction func actionSaveAddress(_ sender: Any) {
        delegate.saveUserAddress(address: textViewAddress.text, type: TfSelectAddressType.text!)
        closePresenting()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        4
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return addressType[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row > 0{
            TfSelectAddressType.text = addressType[row]
        }else{
            alertUser(message: "Invalid Address Type!")
        }
    }
    
    @objc func cancelPicker() {
        TfSelectAddressType.text = ""
        view.endEditing(true)
     }
      @objc func donePicker() {
          view.endEditing(true)
      }

}

extension TypeAddressViewController {
    func addPickerView() -> UIPickerView{
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }
    
    func setupTextfield(){
        TfSelectAddressType.inputView = addPickerView()
        TfSelectAddressType.inputAccessoryView = addDoneCancelButton()
        
        viewAddress.layer.borderWidth = 1
        viewAddress.layer.borderColor = UIColor(named: "AppBlack")?.cgColor
    }
    
    func addDoneCancelButton() -> UIToolbar{
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: #selector(self.cancelPicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePicker))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }

    
}


