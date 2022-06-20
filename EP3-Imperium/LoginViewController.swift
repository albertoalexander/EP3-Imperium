//
//  LoginViewController.swift
//  EP3-Imperium
//
//  Created by Carlos Alexander on 6/17/22.
//

import UIKit
import FirebaseAuth

enum ProviderType: String{
    case basic
}

class LoginViewController:
    UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Inicio de Sesión"
    }
    
    
    @IBAction func signUpButtonAction(_ sender: Any) {
    }
    
    @IBAction func logInButtonAction(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password){
                (result, error) in
                if error == nil{
                    
                    self.navigationController?.pushViewController(HomeViewController(provider: .basic), animated: true)
                } else {
                    let alertController = UIAlertController(title: "Error",message:"Usuario o clave incorrecta",preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}
