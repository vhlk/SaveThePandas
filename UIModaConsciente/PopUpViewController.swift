import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var Estrela1Button: UIButton!
    @IBOutlet weak var Estrela2Button: UIButton!
    @IBOutlet weak var Estrela3Button: UIButton!
    @IBOutlet weak var Estrela4Button: UIButton!
    @IBOutlet weak var Estrela5Button: UIButton!
    
    @IBOutlet weak var NomeField: UITextField!
    @IBOutlet weak var DescricaoField: UITextField!
    
    private var itemId: Int = 0
    
    var numOfStars = 0
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        let lastReview = LastReview()
        let nextItem = NextItem()
        
        if let (_, _, _, id) = nextItem.getNextItem() {
            self.itemId = id
            
            if let (name, review, _, _, lastReviewID) = lastReview.getLastReview() {
                    if lastReviewID == id {
                        NomeField.text = name
                        DescricaoField.text = review
                    }
            }
        }
    }
    
    override func viewDidLoad() {
        Utils.setButtonStarsByValue(estrela1Button: Estrela1Button, estrela2Button: Estrela2Button, estrela3Button: Estrela3Button, estrela4Button: Estrela4Button, estrela5Button: Estrela5Button, value: Double(numOfStars))
    }
    
    func setStarsByValue(value: Double) {
        
        Utils.setButtonStarsByValue(estrela1Button: Estrela1Button, estrela2Button: Estrela2Button, estrela3Button: Estrela3Button, estrela4Button: Estrela4Button, estrela5Button: Estrela5Button, value: value)
        
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
            
            
            reviewsDatabase.addReview(usrName: NomeField.text!, review: DescricaoField.text!, stars: numOfStars, usrPhotoName: photos[randomInt], itemID: itemId)
            
            let lastReview = LastReview()
            lastReview.setLastReview(name: NomeField.text!, review: DescricaoField.text!, star: numOfStars, face: photos[randomInt], id: itemId)
            
            let messageVC = UIAlertController(title: "Avaliação salva", message: "Avaliação salva com sucesso" , preferredStyle: .actionSheet)
            present(messageVC, animated: true) {
                NotificationCenter.default.post(name: Notification.Name(rawValue: "NewReview"), object: nil)
                NotificationCenter.default.post(name: Notification.Name(rawValue: "NewLastReview"), object: nil)
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
