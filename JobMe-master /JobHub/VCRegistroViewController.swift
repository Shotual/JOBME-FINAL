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
    @IBOutlet var mail2: UITextField?
    
    @IBOutlet var txtfname: UITextField?
    @IBOutlet var txtfsurname: UITextField?
    @IBOutlet var txtvexperience: UITextView?
    @IBOutlet var txtvstudies: UITextView?
    @IBOutlet var imgCV: UIImageView?
    @IBOutlet var imgAvatar: UIImageView?
    
     let UserID = Auth.auth().currentUser?.uid
    
  
    @IBOutlet var ScrollView: UIScrollView!
    
    var value:String?
    
   
    override func viewDidLoad() {
        ScrollView.contentSize.height = 1600
        super.viewDidLoad()
        self.psswd?.delegate=self
        self.uss?.delegate=self
        self.mail?.delegate=self
        
        // Do any additionl setup after loading the view.
      
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
    
    @IBAction func AccionBtnRegistro(){
        
        
        Auth.auth().createUser(withEmail: (mail?.text)!, password:(psswd?.text)! ) { (user, error) in
            if(error==nil){
                DataHolder.sharedInstance.Usuario = user
                
                
                
                let userid = DataHolder.sharedInstance.Usuario?.uid
                let ref = Database.database().reference().child("JobMe").child("Usuarios").child("Empleados").child(userid!)
                let post:[String:Any]=["Nombre":self.txtfname?.text, "Apellidos":self.txtfsurname?.text,"Experiencia":self.txtvexperience?.text,"Estudios":self.txtvstudies?.text,"imgCV":0,"imgAvatar":0,"Likes":0,"Rol":1]
                
                ref.setValue(post)
                
                
                
                self.performSegue(withIdentifier: "tranPrincipalTra", sender: self)
            }
                
            else{
                let alert: UIAlertView = UIAlertView(title: "Error", message: "Error de contraseña o email / Introduzca 6 caracteres o mas en la contraseña / Introduzca Usuario", delegate: self, cancelButtonTitle: "Ok")
                alert.show()
            }
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
