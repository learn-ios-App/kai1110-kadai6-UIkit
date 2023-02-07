
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Score: UILabel!
    @IBOutlet weak var slider: UISlider!
    private var labelValue = Int.random(in: 0...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }
    
    @IBAction func Judg(_ sender: Any) {
        let sliderValue = Int(slider.value)
        if sliderValue == labelValue {
            resultAlert(message: "あたり")
        }
        else {
            resultAlert(message: "はずれ")
        }
    }
    
    private func resultAlert(message: String) {
        let alertcontroller = UIAlertController(
            title: "結果",
            message: message + "\nあなたの値は\(Int(slider.value))",
            preferredStyle: .alert
        )
        let OKButton = UIAlertAction(
            title: "再挑戦",
            style: .default,
            handler: { _ in
                self.retry()
            }
        )
        alertcontroller.addAction(OKButton)
        present(alertcontroller, animated: true)
    }
    
    private func updateLabel() {
        Score.text = String(labelValue)
    }
    
    private func retry() {
        labelValue = Int.random(in: 0...100)
        updateLabel()
    }
}
