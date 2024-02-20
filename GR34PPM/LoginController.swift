//
//  LoginController.swift
//  GR34PPM
//
//  Created by user252234 on 2/20/24.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class LoginController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonClick(_ sender: UIButton) {
        if (checkInputsForLogin()) {
            var email = trimString(str: emailTextField.text!)
            var password = trimString(str: passwordTextField.text!)
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if error != nil {
                    self.sendAlertDialog(titleString: "Error", msgString: error!.localizedDescription)
                    return
                }
                // ...
                self.performSegue(withIdentifier: "goToNext", sender: self)
            }
        } else {
            sendAlertDialog()
        }
    }
    
    func sendAlertDialog(titleString: String = "Invalid input",
                                msgString: String = "Please enter valid inputs.") {
        var dialogMessage = UIAlertController(title: titleString, message: msgString, preferredStyle: .alert)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    func trimString(str: String) -> String {
        var trimmedString = str.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString
    }
    
    func checkInputsForLogin() -> Bool {
        var passed: Bool = true
        
        //guard statements for confirming nonempty inputs
        guard var emailText = emailTextField.text else {
            passed = false
            return passed
        }
        guard var passwordText = passwordTextField.text else {
            passed = false
            return passed
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
