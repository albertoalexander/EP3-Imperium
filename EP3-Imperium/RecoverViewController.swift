//
//  RecoverViewController.swift
//  EP3-Imperium
//
//  Created by Carlos Alexander on 6/17/22.
//

import UIKit
import Firebase

class RecoverViewController: UIViewController {
    
    @IBOutlet private weak var txtUser: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
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
    }
    
    
    @IBAction func forgotPassButton_Tapped(_ sender: Any) {
        let auth = Auth.auth()
        auth.sendPasswordReset(withEmail: emailField.text!) {(error) in
            if let error = error {
                let alertController = UIAlertController(title: "Error",message:"No se pudo enviar el correo de restablecimiento",preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                self.present(alertController, animated: true, completion: nil)
                
                return
            }
            
            let alertController = UIAlertController(title: "Restablecer",message:"Se envío un mensaje a tu correo para restablecer la clave",preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
    
}
