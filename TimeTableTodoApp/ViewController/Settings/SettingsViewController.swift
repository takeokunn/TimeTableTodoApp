import Foundation
import UIKit
import Firebase

class SettingsViewController: UITableViewController {

    @IBOutlet weak var emailLabel: UILabel!

    override func viewDidLoad () {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.emailLabel.text = KeychainManager.getEmail
    }

    override func didReceiveMemoryWarning () {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handleLogout(_ sender: UIButton) {
        let alert = UIAlertController(title: "確認", message: "ログアウトしますか？", preferredStyle: UIAlertController.Style.alert)
        let yes = UIAlertAction(title: "はい", style: UIAlertAction.Style.default, handler: { (_: UIAlertAction!) in
            try? Auth.auth().signOut()
            KeychainManager.logout()
            self.moveToLoginVC()
        })
        let no = UIAlertAction(title: "いいえ", style: UIAlertAction.Style.cancel, handler: { (_: UIAlertAction!) in })
        alert.addAction(no)
        alert.addAction(yes)
        self.present(alert, animated: true, completion: nil)
    }

    private func moveToLoginVC() {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        vc!.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: false, completion: nil)
    }
}
