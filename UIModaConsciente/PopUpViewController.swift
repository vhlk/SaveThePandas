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
        let messageVC = UIAlertController(title: "Avaliação salva", message: "Avaliação salva com sucesso" , preferredStyle: .actionSheet)
        present(messageVC, animated: true) {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
                            messageVC.dismiss(animated: true, completion: nil)}
            )
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
                self.dismiss(animated: true, completion: nil)}
            )
        }
    }
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true)
    }
}
