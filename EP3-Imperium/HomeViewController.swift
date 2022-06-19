//
//  HomeViewController.swift
//  EP3-Imperium
//
//  Created by Carlos Alexander on 6/18/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var closeSessionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bienvenido"
    }
    
    
    @IBAction func closeSessionButtonAction(_ sender: Any) {
    }
}
