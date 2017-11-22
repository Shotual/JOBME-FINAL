//
//  Login.swift
//  JobHub
//
//  Created by Daniel de la Iglesia Gonzalez on 13/11/17.
//  Copyright © 2017 Daniel de la Iglesia Gonzalez. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Firebase



class Login: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var nameTextField: UITextField?
    @IBOutlet var passTextField: UITextField?
    @IBOutlet var selectTE:UISegmentedControl?
    
    var rolem:Int = 0
    var roltra:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectTE?.selectedSegmentIndex=0
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tranTabBarTra() {
        self.performSegue(withIdentifier: "tranTabBarTra", sender: self)
        
    }
    func tranTabBarEm() {
        self.performSegue(withIdentifier: "tranTabBarEm", sender: self)
        
    }
    func tranRegistroTra() {
        self.performSegue(withIdentifier: "tranRegistroTra", sender: self)
        
    }
    func tranRegistroEm() {
        self.performSegue(withIdentifier: "tranRegistroEm", sender: self)
        
    }
    
    func loginEm(){
        Auth.auth().signIn(withEmail: (nameTextField?.text)!, password: (passTextField?.text)!){(user, error) in
            
            //let UserID = Auth.auth().currentUser?.uid
            let ref = Database.database().reference()
            
            if(error==nil){
                print("+++++++++++++++++++CLICK+++++++++++++++")
                let userID = Auth.auth().currentUser?.uid
                DataHolder.sharedInstance.uid = userID
                
                ref.child("JobMe/Usuarios/Empresas").child((user?.uid)!).observeSingleEvent(of: .value, with: { (snapshot) in
                    // Get user value
                    let value = snapshot.value as? NSDictionary
                    self.rolem = value?["Rol"] as! Int
                    print("++++++++++++++++++++ROL DEL EMPRESARIO++++++++++++++++++",self.roltra)
                    if(self.rolem==0){
                        self.tranTabBarEm()
                        
                    }
                    
                })
                
            }
            else{
                let alert: UIAlertView = UIAlertView(title: "Error", message: "Error de Empresa", delegate: self, cancelButtonTitle: "Ok")
                alert.show()
            }
            
        }
        
    }
    
    
    
    func loginTra(){
        Auth.auth().signIn(withEmail: (nameTextField?.text)!, password: (passTextField?.text)!){(user, error) in
            
            //let UserID = Auth.auth().currentUser?.uid
            let ref = Database.database().reference()
            
            if(error==nil){
                print("+++++++++++++++++++CLICK+++++++++++++++")
                let userID = Auth.auth().currentUser?.uid
                DataHolder.sharedInstance.uid = userID
                
                ref.child("JobMe/Usuarios/Empleados").child((user?.uid)!).observeSingleEvent(of: .value, with: { (snapshot) in
                    // Get user value
                    let value = snapshot.value as? NSDictionary
                    self.roltra = value?["Rol"] as! Int
                    print("++++++++++++++++++++ROL DEL TRABAJADOR++++++++++++++++++",self.roltra)
                    if(self.roltra==1){
                        self.tranTabBarTra()
                        
                    }
                    
                })

            }
            else{
                let alert: UIAlertView = UIAlertView(title: "Error", message: "Error de contraseña o Email", delegate: self, cancelButtonTitle: "Ok")
                alert.show()
            }
            
        }
    }
    
    
    @IBAction func LoginButton() {
        if(selectTE?.selectedSegmentIndex==0){
            self.loginTra()
            
        }else if(selectTE?.selectedSegmentIndex==1){
            self.loginEm()
        }else{
            var alert: UIAlertView = UIAlertView(title: "Error", message: "Please select what are you", delegate: self, cancelButtonTitle: "Ok")
            alert.show()
        }
    }
    
    @IBAction func signup() {
        if(selectTE?.selectedSegmentIndex==0){
            self.tranRegistroTra()
        }else if(selectTE?.selectedSegmentIndex==1){
            self.tranRegistroEm()
        }else{
            var alert: UIAlertView = UIAlertView(title: "Error", message: "Please select what are you", delegate: self, cancelButtonTitle: "Ok")
            alert.show()
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
