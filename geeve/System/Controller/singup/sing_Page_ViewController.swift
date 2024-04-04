//
//  sing_Page_ViewController.swift
//  geeve App
//
//  Created by Dev Navadiiya on 29/02/24.
//

import UIKit
import RealmSwift



class sing_Page_ViewController: UIViewController , UITextFieldDelegate {
    
    
    @IBOutlet weak var firest_Name_Texfild: UITextField!
    
    @IBOutlet weak var last_Name_TextFileld: UITextField!
    
    @IBOutlet weak var Email_Textfiled: UITextField!
    
    @IBOutlet weak var phone_number_textFild: UITextField!
    
    @IBOutlet weak var paswoord_Text_filed: UITextField!
    
    @IBOutlet weak var terms: UIButton!
    
    @IBOutlet weak var enter_conform_password_textfild: UITextField!
    
    @IBOutlet weak var tic_mark_Terms: UIButton!
    @IBOutlet weak var i_agerr: UILabel!
    @IBOutlet weak var alredyhave_account: UIButton!
    
    @IBOutlet weak var singin: UIButton!
    
    @IBOutlet weak var signup: UIButton!
    
    var id = ""
    
    var firestname : String?
    var lastname : String?
    var email : String?
    var phone : String?
    var pass : String?
    let data = defultdata.sher
    var dataArryOfRealm = [modulforReamldata]()
    var index : Int?
    
    
    
    
    func hideui () {
        self.tic_mark_Terms.isHidden = true
        self.i_agerr.isHidden = true
        self.terms.isHidden = true
        self.alredyhave_account.isHidden = true
        self.singin.isHidden = true
        self.Email_Textfiled.isUserInteractionEnabled = false
        self.phone_number_textFild.isUserInteractionEnabled = false
        signup.setTitle("UPDATE", for: .normal)
        self.tic_mark_Terms.isSelected = true
    }
    var shoudhideui = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.phone_number_textFild.keyboardType = .numberPad
       
        dataArryOfRealm = dataBaseHelperRealm.sher.DataFromeRealm()
        
        
        
        if shoudhideui {
            hideui()
            self.firest_Name_Texfild.text = firestname
            self.last_Name_TextFileld.text = lastname
            self.Email_Textfiled.text = email
            self.phone_number_textFild.text = phone
            self.paswoord_Text_filed.text = pass
            self.enter_conform_password_textfild.text = pass
            
        }
        
    }
    
    // MARK: - terms butoon condition -
  
    @IBAction func tic(_ sender: Any) {
        
        
        if  !tic_mark_Terms.isSelected == true {
            
            let image = UIImage(named: "cutome")
            
            self.tic_mark_Terms.setImage(image, for: .normal)
            print("tap")
            
        }else{
            
            let image = UIImage(named: "Image 4")
            
            self.tic_mark_Terms.setImage(image, for: .normal)
            print("not tap")
        }
        tic_mark_Terms.isSelected.toggle()
        
        
        
        
    }
    
    // MARK: - Sing UP condition -
    
    
    
    
    
    @IBAction func sing_Up_Btn(_ sender: Any) {
        
        if firest_Name_Texfild.text!.isEmpty || self.last_Name_TextFileld.text!.isEmpty || self.phone_number_textFild.text!.isEmpty || self.paswoord_Text_filed.text!.isEmpty || self.Email_Textfiled.text!.isEmpty || self.enter_conform_password_textfild.text!.isEmpty {
            
            let alert =  UIAlertController(title: "Sign Up", message:   "plese enter All Details  ", preferredStyle: .alert)
            
            let btn1 = UIAlertAction(title: "ok" , style : .default )
            alert.addAction(btn1)
            
            self.present(alert, animated: true )
            print("butoontap")
        }
        if self.paswoord_Text_filed.text! != self.enter_conform_password_textfild.text {
            let allert = UIAlertController(title: "Password Doesn't Match", message: "Plese chake your conform Password It Was Not Similar", preferredStyle: .alert)
            
            let btn1 = UIAlertAction(title: "OK", style: .destructive)
            allert.addAction(btn1)
            self.present(allert, animated: true)
            self.enter_conform_password_textfild.text = ""
        }
        if tic_mark_Terms.isSelected == false {
            let alert =  UIAlertController(title: "Terms And Conditions", message:   "plese agree our Terms And Conditions", preferredStyle: .alert)
            let btn1 = UIAlertAction(title: "ok" , style : .default )
            alert.addAction(btn1)
            
            self.present(alert, animated: true )
            print("butoontap")
        }
        
        else {
         
            if shoudhideui == false {
                let realm = try! Realm()
                if realm.objects(modulforReamldata.self).filter("email == %@", self.Email_Textfiled.text!).first != nil {
                       let alert = UIAlertController(title: "User already exists", message: "An account with this email already exists", preferredStyle: .alert)
                       let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                       alert.addAction(okAction)
                       present(alert, animated: true, completion: nil)
                       return
                   
                
                    }else{
                        
                        
                        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "registrationViewController") as! registrationViewController
                        
                        
                        data.setname(firestname: self.firest_Name_Texfild.text ?? "")
                        data.setlastname(lastname: self.last_Name_TextFileld.text ?? "")
                        data.setemail(email: self.Email_Textfiled.text ?? "")
                        data.setphoneNumber(phonenumber: self.phone_number_textFild.text ?? "")
                        data.setpassword(password: self.paswoord_Text_filed.text ?? "")
                        
                        
                        let realmdata = modulforReamldata.init(name: defultdata.sher.getname() ?? "", lastname: defultdata.sher.getlastname() ?? "", phonenumber: defultdata.sher.getphoneNumber() ?? "", email: defultdata.sher.getemail() ?? "", password: defultdata.sher.getpassword() ?? "", conformPassword: defultdata.sher.getpassword() ?? "")
                        
                        dataBaseHelperRealm.sher.savedata(data: realmdata)
                        
                        //                     vc.notindata = self.Email_Textfiled.text ?? ""
                        
                        self.navigationController?.pushViewController(vc, animated: true )
                    }
                
                
            }else{
                
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "donationPagesViewController") as! donationPagesViewController
              
                guard let userindex = index else{return}
               updataUser()
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
        }
    }
    
    
    
    // MARK: - Singin -
    
    @IBAction func singin(_ sender: Any) {
        
        navigateToViewController(main: "Main", storyboard: "singInViewController", navigationController: self.navigationController)
        
    }
    
    @IBAction func privicy(_ sender: Any) {
        
        navigateToViewController(main: "Main", storyboard: "webViewController", navigationController: self.navigationController)
    
    }
 }


extension  sing_Page_ViewController {
    
    
    func updataUser () {
        let realm = try! Realm()
        
        
        if let existingUser = realm.objects(modulforReamldata.self).filter("email == %@", email ?? "").first {
            let existingUserId = existingUser._id
        
            let newUserData = modulforReamldata(name: self.firest_Name_Texfild.text ?? "", lastname: self.last_Name_TextFileld.text ?? "", phonenumber: self.phone_number_textFild.text ?? "", email: self.Email_Textfiled.text ?? "", password: self.paswoord_Text_filed.text ?? "", conformPassword: self.enter_conform_password_textfild.text ?? "")
            newUserData._id = existingUserId
            dataBaseHelperRealm.sher.updateUser(with: newUserData)
        } else {
           return
        }
    }
    
    
}

