//
//  RegisterViewController.swift
//  EP3-Imperium
//
//  Created by Carlos Alexander on 6/17/22.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet private weak var txtUser: UITextField!
    
    @IBAction private func tapToCloseKeyboard(_ sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    @IBAction private func swipeToCloseKeyboard(_ sender: UISwipeGestureRecognizer){
        self.view.endEditing(true)
    }
    
    @IBAction private func swipeToOpenKeyboard(_ sender: UISwipeGestureRecognizer){
        self.txtUser.becomeFirstResponder()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Registro"
    }
    @IBAction func signUpButtonAction(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password){
                (result, error) in
                if error == nil{
                    
                    self.navigationController?.pushViewController(HomeViewController(provider: .basic), animated: true)
                    let alertController = UIAlertController(title: "Usuario creado",message:"Usuario creado correctamente",preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    let alertController = UIAlertController(title: "Error",message:"Usuario o clave incorrecta",preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}
