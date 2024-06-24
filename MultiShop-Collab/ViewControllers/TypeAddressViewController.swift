//
//  TypeAddressViewController.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit

protocol SaveAddress{
    func saveUserAddress(address: String)
}

class TypeAddressViewController: UIViewController {

    
    
    @IBOutlet weak var textViewAddress: UITextView!
    
    var delegate: SaveAddress!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionClose(_ sender: Any) {
        closePresenting()
    }
    
    
    @IBAction func actionSaveAddress(_ sender: Any) {
        delegate.saveUserAddress(address: textViewAddress.text)
        closePresenting()
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
