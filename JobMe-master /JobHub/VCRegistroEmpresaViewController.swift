//
//  VCRegistroEmpresaViewController.swift
//  JobHub
//
//  Created by Guille on 14/11/17.
//  Copyright © 2017 Daniel de la Iglesia Gonzalez. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseAuth

class VCRegistroEmpresaViewController: UIViewController,UITextFieldDelegate {
    var name = ""
    var pass = ""
    
    @IBOutlet var ussEm: UITextField?
    @IBOutlet var psswdEm: UITextField?
    @IBOutlet var psswd2Em: UITextField?
    @IBOutlet var mailEm: UITextField?
    @IBOutlet var mail2Em: UITextField?
    
 
    @IBOutlet var txtfNif: UITextField?
    @IBOutlet var txtfCompany: UITextField?
    @IBOutlet var txtfWeb: UITextField?
    @IBOutlet var txtvAbout: UITextView?
    @IBOutlet var imgLogo: UIImageView?
  
    
    
    
    
    @IBOutlet var ScrollViewEm: UIScrollView!
    
    var value:String?
    
    let UserID = Auth.auth().currentUser?.uid
    override func viewDidLoad() {
        ScrollViewEm.contentSize.height = 1200
        super.viewDidLoad()
        self.psswdEm?.delegate=self
        self.ussEm?.delegate=self
        self.mailEm?.delegate=self
        
       
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
        mailEm?.resignFirstResponder()
        ussEm?.resignFirstResponder()
        psswdEm?.resignFirstResponder()
        return(true)
    }
    
    
    
    
    @IBAction func AccionBtnRegistroEm(){
        
        
        Auth.auth().createUser(withEmail: (mailEm?.text)!, password:(psswdEm?.text)! ) { (user, error) in
            if(error==nil){
                DataHolder.sharedInstance.Usuario = user
                
                
                
                let userid = DataHolder.sharedInstance.Usuario?.uid
                let ref = Database.database().reference().child("JobMe").child("Usuarios").child("Empresas").child(userid!)
                let post:[String:Any]=["Compañia":self.txtfCompany?.text, "Nif":self.txtfNif?.text,"Web":self.txtfWeb?.text,"About":self.txtvAbout?.text,"imgLogo":0,"Rol":0,"Ofertas":["0":["Titulo":0,"Descrip":0,"Requer":0,"Salario":0,"Nif":0]]]
                
                ref.setValue(post)
                
                
                
                self.performSegue(withIdentifier: "tranPrincipalEm", sender: self)
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

