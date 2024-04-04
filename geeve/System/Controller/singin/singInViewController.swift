//
//  singInViewController.swift
//  geeve
//
//  Created by Dev Navadiya on 13/03/24.
//

import UIKit
import RealmSwift



class singInViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var pass: UITextField!
    
    @IBOutlet weak var remember_me: UIButton!
    
    @IBOutlet weak var eye: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - remeber mi butoon condition -
    
    @IBAction func remember_Mi_Btn(_ sender: Any) {
        
        
        if  !remember_me.isSelected == true {
            
            let image = UIImage(named: "cutome")
            
            self.remember_me.setImage(image, for: .normal)
            print("tap")
            
        }else{
            
            let image = UIImage(named: "Image 4")
            
            self.remember_me.setImage(image, for: .normal)
            print("not tap")
        }
        remember_me.isSelected.toggle()
        
        
        
        // MARK: - singupbtn conditon -
        
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        let realm = try! Realm()
        
        if let existingUserWithEmail = realm.objects(modulforReamldata.self).filter("email == %@", self.email.text!).first {
               
            if existingUserWithEmail.password == pass.text! {
                data()
                } else {
                   showAlert(title: "Password Not exists", message: "The password you entered is incorrect")
             }
        } else {
            showAlert(title: "User Not exists", message: "An account with this email doesn't exist")
            }
       
    
        func data () {
            defultdata.sher.setlogindata(notindata: self.email.text ?? "")
            defultdata.sher.setloginpass(notindata: self.email.text ?? "")
            
            print("userlogin")
            
            
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "registrationViewController") as! registrationViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
   
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    //    MARK: - forgatpassbtn conditon -
    
    @IBAction func forgat_Pass_Btn(_ sender: Any) {
        
        navigateToViewController(main: "Main", storyboard: "forgetPasswordViewController", navigationController: self.navigationController)
        
    }
    
    // MARK: -  singinbtn conditon -
    
    @IBAction func sing_In_Btn(_ sender: Any) {
        navigateToViewController(main: "Main", storyboard: "sing_Page_ViewController", navigationController: self.navigationController)
        
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "donationPagesViewController") as! donationPagesViewController
        
        vc.userin.set(true, forKey: "USERIN")
        
    }
    
    @IBAction func eye(_ sender: Any) {
        
        if !eye.isSelected == true {
            self.pass.isSecureTextEntry = true
        }
        else {
            self.pass.isSecureTextEntry = false
        }
        
        eye.isSelected.toggle()
        
    }
}

