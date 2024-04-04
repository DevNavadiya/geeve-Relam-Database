//
//  donationPagesViewController.swift
//  geeve
//
//  Created by Dev Navadiya on 14/03/24.
//

import UIKit
import SideMenu


class donationPagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var userin = UserDefaults.standard
    var dataArryOfRealm = [modulforReamldata]()
    @IBOutlet weak var tabelview: UITableView!
//    var data = [UserSingUp]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        print(data)
        self.tabelview.delegate = self
        self.tabelview.dataSource = self
        self.tabelview.register(UINib(nibName: "donationPagesCellTableViewCell", bundle: nil), forCellReuseIdentifier: "donationPagesCellTableViewCell")
        dataArryOfRealm = dataBaseHelperRealm.sher.DataFromeRealm()
        // Fetch the initial data
        
        
    }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dataArryOfRealm.count
            
        }
        
    
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "donationPagesCellTableViewCell") as! donationPagesCellTableViewCell
            
            let index = dataArryOfRealm[indexPath.row]
            cell.name.text = index.name
            cell.age.text = index.email
           
            cell.oneditbuttontap = {
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "sing_Page_ViewController") as! sing_Page_ViewController
                
                vc.shoudhideui = true
                
                vc.firestname = index.name
                vc.lastname = index.lastname
                vc.email = index.email
                vc.pass = index.password
                vc.phone = index.phonenumber
                vc.index = indexPath.row
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            cell.onDeleteButtonTapped = {
                
                let alert = UIAlertController(title: "Confirmation", message: "Are you sure you want to delete \(index.name)? You cannot undo this action.", preferredStyle: .alert)
                let btn = UIAlertAction(title: "Delete", style: .destructive) {btn in
                    dataBaseHelperRealm.sher.deletdata(modulforReamldata: self.dataArryOfRealm[indexPath.row])
                    self.dataArryOfRealm.remove(at: indexPath.row)
                    self.tabelview.reloadData()
                    
                  }
                alert.addAction(btn)
                let btn1 = UIAlertAction(title: "Cancel", style: .cancel) { btn1 in
                    self.dismiss(animated: true)
                    
                }
                alert.addAction(btn1)
                self.present(alert, animated: true)
                
        }
            
            return cell
            
            
        }
        
        @IBAction func sidebar(_ sender: Any) {
            
            setSideMenu()
            
        }
        
        
    }

extension donationPagesViewController {
    
    func setSideMenu() {
        
        let x = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "customeSideBarViewController") as! customeSideBarViewController
        x.singouut = {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "mainViewController") as! mainViewController
                  
            self.dismiss(animated: true)
            UserDefaults.standard.setValue(false, forKey: "USERIN")
            
            
            self.navigationController?.pushViewController(vc, animated: true)
        
        }
        
        
        let menu = SideMenuNavigationController(rootViewController: x)
        let leftMenuNavigationController = SideMenuNavigationController(rootViewController: x)
      
        leftMenuNavigationController.presentationStyle = .menuSlideIn
        leftMenuNavigationController.menuWidth = min(view.frame.width * 0.8, 320)
       
       
        SideMenuManager.default.leftMenuNavigationController = leftMenuNavigationController
      
        SideMenuManager.default.addPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: self.navigationController!.view , forMenu: .left)
        
       
        
        
        present(leftMenuNavigationController, animated: true, completion: nil)
        
    }
  
    
  
    
}
