import Foundation
import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInDelegate {

    @IBOutlet weak var loginBtn: UIButton!

    override func viewDidLoad () {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        createGoogleSigninButton()
    }

    override func didReceiveMemoryWarning () {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handleTouchUp(_ sender: UIButton) {
        self.moveToMainVC()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        guard let authentication = user.authentication else { return }

        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        //Firebase Baas側に認証(初回時はレコードを作成)
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if error != nil {
                self.handleAlert(title: "認証エラー", message: "認証エラーが発生しました。もう一度お願いします。")
            }
        }
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if let currentUser = auth.currentUser {
                KeychainManager.setEmail(email: currentUser.email!)
                self.moveToMainVC()
            }
        }
    }

    private func moveToMainVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        vc!.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: false, completion: nil)
    }
    
    private func createGoogleSigninButton(){
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: 20, y: self.view.frame.height/2-30, width: self.view.frame.width-40, height: 60)
        self.view.addSubview(googleButton)
    }
    
    private func handleAlert(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true)
    }
}
