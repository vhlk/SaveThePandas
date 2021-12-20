import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var Estrela1Button: UIButton!
    @IBOutlet weak var Estrela2Button: UIButton!
    @IBOutlet weak var Estrela3Button: UIButton!
    @IBOutlet weak var Estrela4Button: UIButton!
    @IBOutlet weak var Estrela5Button: UIButton!
    
    @IBOutlet weak var NomeField: UITextField!
    @IBOutlet weak var DescricaoField: UITextField!
    
    var numOfStars = 0
    
    var onDoneBlock : ((Bool) -> Void)?
    
    @IBAction func Click1Star(_ sender: Any) {
        setStarsByValue(value: 1)
    }
    
    @IBAction func Click2Star(_ sender: Any) {
        setStarsByValue(value: 2)
    }
    
    @IBAction func Click3Star(_ sender: Any) {
        setStarsByValue(value: 3)
    }
    
    
    @IBAction func Click4Star(_ sender: Any) {
        setStarsByValue(value: 4)
    }
    
    
    @IBAction func Click5Star(_ sender: Any) {
        setStarsByValue(value: 5)
    }
    
    func setStarsByValue(value: Double) {
        
        let golderStar = "VectorEstrelinhaHiRes"
        let emptyStar = "VectorEstrelinhaVaziaHiRes"
        
        if (value > 0.5) {
            Estrela1Button.setImage(UIImage(named: golderStar), for :.normal)
        } else {
            Estrela1Button.setImage(UIImage(named: emptyStar), for :.normal)
        }
        if (value > 1.5) {
            Estrela2Button.setImage(UIImage(named: golderStar), for :.normal)
        } else {
            Estrela2Button.setImage(UIImage(named: emptyStar), for :.normal)
        }
        if (value > 2.5) {
            Estrela3Button.setImage(UIImage(named: golderStar), for :.normal)
        } else {
            Estrela3Button.setImage(UIImage(named: emptyStar), for :.normal)
        }
        if (value > 3.5) {
            Estrela4Button.setImage(UIImage(named: golderStar), for :.normal)
        } else {
            Estrela4Button.setImage(UIImage(named: emptyStar), for :.normal)
        }
        if (value > 4.5) {
            Estrela5Button.setImage(UIImage(named: golderStar), for :.normal)
        } else {
            Estrela5Button.setImage(UIImage(named: emptyStar), for :.normal)
        }
        
        numOfStars = Int(value)
    }
    
    @IBAction func SendButton(_ sender: Any) {
        if (numOfStars == 0) {
            let messageVC = UIAlertController(title: "Estrelas faltando", message: "Por favor preencha todos os campos!" , preferredStyle: .actionSheet)
            present(messageVC, animated: true) {
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (_) in
                                messageVC.dismiss(animated: true, completion: nil)}
                )
            }
        }
        else if (NomeField.text!.count < 2) {
            let messageVC = UIAlertController(title: "Nome faltando", message: "Por favor preencha todos os campos!" , preferredStyle: .actionSheet)
            present(messageVC, animated: true) {
                Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { (_) in
                                messageVC.dismiss(animated: true, completion: nil)}
                )
            }
        }
        else if (DescricaoField.text!.count < 2) {
            let messageVC = UIAlertController(title: "Descricao faltando", message: "Por favor preencha todos os campos!" , preferredStyle: .actionSheet)
            present(messageVC, animated: true) {
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (_) in
                                messageVC.dismiss(animated: true, completion: nil)}
                )
            }
        } else {
            let reviewsDatabase = ReviewsDatabase()
            
            let photos = ["Ellipse 3 - carinhaHomem", "Ellipse 3 - carinhaMulher", "Ellipse 3"]
            
            let randomInt = Int.random(in: 0..<2)
            
            reviewsDatabase.addReview(usrName: NomeField.text!, review: DescricaoField.text!, stars: numOfStars, usrPhotoName: photos[randomInt])
            
            let messageVC = UIAlertController(title: "Avaliação salva", message: "Avaliação salva com sucesso" , preferredStyle: .actionSheet)
            present(messageVC, animated: true) {
                NotificationCenter.default.post(name: Notification.Name(rawValue: "NewReview"), object: nil)
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
                                messageVC.dismiss(animated: true, completion: nil)}
                )
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
                    self.dismiss(animated: true)}
                )
            }
        }
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true)
    }
}
