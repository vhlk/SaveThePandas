//
//  FakeCameraViewController.swift
//  UIModaConsciente
//
//  Created by vh on 16/12/21.
//

import UIKit

class FakeCameraViewController: UIViewController {
    

    @IBAction func TakePicture(_ sender: Any) {
        performSegue(withIdentifier: "ShowItemSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewItemVC = segue.destination as? ViewItemViewController {
            // set item
        }
    }

}
