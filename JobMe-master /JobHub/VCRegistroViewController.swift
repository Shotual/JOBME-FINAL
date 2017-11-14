//
//  VCRegistroViewController.swift
//  JobHub
//
//  Created by Daniel de la Iglesia Gonzalez on 13/11/17.
//  Copyright © 2017 Daniel de la Iglesia Gonzalez. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class VCRegistroViewController: UIViewController, UITextFieldDelegate{
    var name = ""
    var pass = ""
    
    @IBOutlet var uss: UITextField?
    @IBOutlet var psswd: UITextField?
    @IBOutlet var psswd2: UITextField?
    @IBOutlet var mail: UITextField?
    @IBOutlet var tipo:UISegmentedControl?
    var value:String?
    
    let UserID = Auth.auth().currentUser?.uid
    override func viewDidLoad() {
        super.viewDidLoad()
        self.psswd?.delegate=self
        self.uss?.delegate=self
        self.mail?.delegate=self
        
        // Do any additionl setup after loading the view.
        tipo?.selectedSegmentIndex=0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mail?.resignFirstResponder()
        uss?.resignFirstResponder()
        psswd?.resignFirstResponder()
        return(true)
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
