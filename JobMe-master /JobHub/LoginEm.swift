//
//  LoginEm.swift
//  JobHub
//
//  Created by Guille on 16/11/17.
//  Copyright © 2017 Daniel de la Iglesia Gonzalez. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginEm: UIViewController,UITextFieldDelegate {

    @IBOutlet var nameTextFieldEm: UITextField?
    @IBOutlet var passTextFieldEm: UITextField?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func LoginButtonEm() {
        if (nameTextFieldEm?.text == "" && passTextFieldEm?.text == ""){
            Auth.auth().signIn(withEmail: (nameTextFieldEm?.text)!, password: (passTextFieldEm?.text)!){(user, error) in
                
                if(error==nil){
                    let userID = Auth.auth().currentUser?.uid
                    DataHolder.sharedInstance.uid = userID
                    DataHolder.sharedInstance.firDatabaseRef.child("Usuarios").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
                        
                        let value = snapshot.value as? NSDictionary
                        
                        
                        
                        
                        self.performSegue(withIdentifier: "tranTabBarEm", sender: self)
                        
                        
                        
                    }
                        
                    )}
            }
            
        }
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
    }


}
