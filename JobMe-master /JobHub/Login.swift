//
//  Login.swift
//  JobHub
//
//  Created by Daniel de la Iglesia Gonzalez on 13/11/17.
//  Copyright © 2017 Daniel de la Iglesia Gonzalez. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class Login: UIViewController, UITextFieldDelegate {
    @IBOutlet var nameTextField: UITextField?
    @IBOutlet var passTextField: UITextField?
    @IBOutlet weak var lblError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblError?.text = ""
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func LoginButton() {
        if (nameTextField?.text == "" && passTextField?.text == ""){
            Auth.auth().signIn(withEmail: (nameTextField?.text)!, password: (passTextField?.text)!){(user, error) in
        
            if(error==nil){
                let userID = Auth.auth().currentUser?.uid
                DataHolder.sharedInstance.uid = userID
                DataHolder.sharedInstance.firDatabaseRef.child("Usuarios").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
                    
                    let value = snapshot.value as? NSDictionary
                    
                    if(value == nil){
                        self.performSegue(withIdentifier: "tranNoExiste", sender: self)
                   
                            
                        }
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
