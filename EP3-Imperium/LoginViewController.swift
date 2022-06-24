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
    
    @IBOutlet private weak var txtUser: UITextField!
    
    @IBAction private func tapToCloseKeyboard(_ sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    @IBOutlet private weak var viewContent: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet private weak var anchorViewContentCenterY: NSLayoutConstraint!
    
    
    @IBAction private func swipeToCloseKeyboard(_ sender: UISwipeGestureRecognizer){
        self.view.endEditing(true)
    }
    
    @IBAction private func swipeToOpenKeyboard(_ sender: UISwipeGestureRecognizer){
        self.txtUser.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardEvents()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterKeyboardEvents()
    }
    
    private func registerKeyboardEvents(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func unregisterKeyboardEvents(){
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardWillShow(_ notificacion: Notification){

        let animationDuration = notificacion.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        let keyboardFrame = notificacion.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        
        if keyboardFrame.origin.y < self.viewContent.frame.maxY{
            
            UIView.animate(withDuration: animationDuration) {
                self.anchorViewContentCenterY.constant = keyboardFrame.origin.y - self.viewContent.frame.maxY
                self.view.layoutIfNeeded()
            }

        }
        
    }
    
    @objc private func keyboardWillHide(_ notificacion: Notification){
        
        let animationDuration = notificacion.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration) {
            self.anchorViewContentCenterY.constant = 0
            self.view.layoutIfNeeded()
        }
        
    }
    
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
