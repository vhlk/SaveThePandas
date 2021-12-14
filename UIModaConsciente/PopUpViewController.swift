//
//  PopUpViewController.swift
//  UIModaConsciente
//
//  Created by Davi Novaes on 23/11/21.
//

import UIKit

class PopUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SendButton(_ sender: Any) {
        
        dismiss(animated: false)
    }
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true)
    }
}
