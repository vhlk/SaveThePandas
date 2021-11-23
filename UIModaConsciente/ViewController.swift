//
//  ViewController.swift
//  UIModaConsciente
//
//  Created by vh on 07/11/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let data = DataLoader().recentClothe
        print(data)
    }


}

