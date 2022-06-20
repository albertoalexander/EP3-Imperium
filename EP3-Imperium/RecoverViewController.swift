//
//  RecoverViewController.swift
//  EP3-Imperium
//
//  Created by Carlos Alexander on 6/17/22.
//

import UIKit
import Firebase

class RecoverViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    
    
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
