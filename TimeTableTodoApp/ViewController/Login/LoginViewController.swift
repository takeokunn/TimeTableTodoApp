import Foundation
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!

    override func viewDidLoad () {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning () {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handleTouchUp(_ sender: UIButton) {
        self.moveToMainVC()
    }

    private func moveToMainVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        vc!.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: false, completion: nil)
    }
}
