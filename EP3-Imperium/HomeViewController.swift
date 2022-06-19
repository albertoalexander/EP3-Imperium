//
//  HomeViewController.swift
//  EP3-Imperium
//
//  Created by Carlos Alexander on 6/18/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var closeSessionButton: UIButton!
    
    init() {
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bienvenido"
    }
    
    
    @IBAction func closeSessionButtonAction(_ sender: Any) {
    }
}
