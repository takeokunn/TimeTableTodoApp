import Foundation
import UIKit
import Firebase

class SettingsViewController: UITableViewController {

    override func viewDidLoad () {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning () {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func handleLogout(_ sender: UIButton) {
        try? Auth.auth().signOut()
        KeychainManager.logout()
        self.moveToLoginVC()
    }
    
    private func moveToLoginVC() {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        vc!.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: false, completion: nil)
    }
}
