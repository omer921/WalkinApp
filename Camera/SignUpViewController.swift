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
        
        // Do any additional setup after loading the view.
    }
    
//    @IBAction func viewDidAppear(_ animated: Bool) {
//
//    }
//    
    @IBAction func signUpButtonClicked(_ sender: UIButton) {
        let alert = UIAlertController(title: "Your Email", message: "Can we scan your email for receipts?", preferredStyle: .alert)
//        alert.butt
        let action = UIAlertAction(title: "Sure!", style: .default) { (action) -> Void in
            let viewControllerYouWantToPresent = self.storyboard?.instantiateViewController(withIdentifier: "closetViewController")
            self.present(viewControllerYouWantToPresent!, animated: true, completion: nil)
        }
        let action2 = UIAlertAction(title: "Nah.", style: .default) { (action) -> Void in
            let viewControllerYouWantToPresent = self.storyboard?.instantiateViewController(withIdentifier: "closetViewController")
            self.present(viewControllerYouWantToPresent!, animated: true, completion: nil)
        }
        alert.addAction(action)
        alert.addAction(action2)
//        alert.
        self.present(alert, animated: true, completion: nil)
        
    }
    @IBAction func emailTextChanged(_ sender: UITextField) {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        NSLog("HERE")
        var testStr = emailTextField.text
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
