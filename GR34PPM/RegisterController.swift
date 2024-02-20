//
//  RegisterController.swift
//  GR34PPM
//
//  Created by user252234 on 2/20/24.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class RegisterController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButtonClick(_ sender: UIButton) {
        // check if the fields are empty or not
        if (checkInputsForRegister()) {
            let email = trimString(str: emailTextField.text!)
            let password = trimString(str: passwordTextField.text!)
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if error != nil {
                    self.sendAlertDialog(titleString: "Error", msgString: error!.localizedDescription)
                    return
                }
                // didn't error, user registered
                self.performSegue(withIdentifier: "goToNext", sender: self)
            }
            
        } else {
            sendAlertDialog()
        }
        
    }
    
    func sendAlertDialog(titleString: String = "Invalid input",
                                msgString: String = "Please enter valid inputs.") {
        let dialogMessage = UIAlertController(title: titleString, message: msgString, preferredStyle: .alert)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    func trimString(str: String) -> String {
        let trimmedString = str.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString
    }
    
    func checkInputsForRegister() -> Bool {
        var passed: Bool = true
        
        //guard statements for confirming nonempty inputs
        guard emailTextField.text != nil else {
            passed = false
            return passed
        }
        guard let passwordText = passwordTextField.text else {
            passed = false
            return passed
        }
        guard let confirmPasswordText = confirmTextField.text else {
            passed = false
            return passed
        }
        
        if passed && passwordText != confirmPasswordText { // check if password and confirm password are the same
            passed = false
        }
        
        return passed
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
