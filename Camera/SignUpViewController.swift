//
//  SignUpViewController.swift
//  Camera
//
//  Created by Omer Winrauke on 11/15/18.
//  Copyright © 2018 Rizwan. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet var emailTextField:UITextField!
    @IBOutlet var passwordTextField:UITextField!
    @IBOutlet var password2TextField:UITextField!
    @IBOutlet var errorLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButtonClicked(_ sender: UIButton) {
        let alert = UIAlertController(title: "Enable Email Access", message: "Connect your shopping email so we can instantly upload and include your past purchases", preferredStyle: .alert)
      let action = UIAlertAction(title: "Sure!", style: .default) { (action) -> Void in
            let viewControllerYouWantToPresent = self.storyboard?.instantiateViewController(withIdentifier: "closetViewController1")
            self.present(viewControllerYouWantToPresent!, animated: true, completion: nil)
        }
        let action2 = UIAlertAction(title: "Not Now", style: .default) { (action) -> Void in
            let viewControllerYouWantToPresent = self.storyboard?.instantiateViewController(withIdentifier: "closetViewController1")
            self.present(viewControllerYouWantToPresent!, animated: true, completion: nil)
        }
        alert.addAction(action)
        alert.addAction(action2)
        self.present(alert, animated: true, completion: nil)
        
    }
    @IBAction func emailTextChanged(_ sender: UITextField) {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        NSLog("HERE")
        let testStr = emailTextField.text
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if (!emailTest.evaluate(with: testStr)) {
            errorLabel.text = "NOT A VALID EMAIL"
        } else {
            errorLabel.text = ""
        }
    }

    @IBAction func passwordTextChanged(_ sender: UITextField) {
        if (passwordTextField.text != password2TextField.text) {
            errorLabel.text = "PASSWORDS ARE NOT VALID"
        } else {
            errorLabel.text = ""
        }
    }
    
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//
//        textField.resignFirstResponder()
//        //or
//        //self.view.endEditing(true)
//        return true
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
