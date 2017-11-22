//
//  OfertasVC.swift
//  JobHub
//
//  Created by Guille on 20/11/17.
//  Copyright © 2017 Daniel de la Iglesia Gonzalez. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class OfertasVC: UIViewController,UITextFieldDelegate, UITextViewDelegate  {
    
    @IBOutlet var txtfTitle: UITextField?
    @IBOutlet var txtfSalary: UITextField?
    @IBOutlet var txtvDescription: UITextView?
    @IBOutlet var txtvRequirements: UITextView?
    @IBOutlet var txtfNif: UITextField?
    
    
    let UserID = Auth.auth().currentUser?.uid
    var ref = Database.database().reference()
    
    override func viewDidLoad() {
        
        self.txtfTitle?.delegate = self
        self.txtfSalary?.delegate = self
        self.txtvDescription?.delegate = self
        self.txtvRequirements?.delegate = self
        self.txtfNif?.delegate = self
        
        super.viewDidLoad()
        DataHolder.sharedInstance.firDatabaseRef.child("JobMe").child("Usuarios").child("Empresas").child(DataHolder.sharedInstance.uid!).child("Ofertas").observeSingleEvent(of: .value, with:{(snapshot) in
            let arrTemp=snapshot.value as? Array<AnyObject>
            
            DataHolder.sharedInstance.contadorOferta = arrTemp?.count
            print( DataHolder.sharedInstance.contadorOferta!)
        })
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        txtfTitle?.resignFirstResponder()
        txtfSalary?.resignFirstResponder()
        txtvDescription?.resignFirstResponder()
        txtvRequirements?.resignFirstResponder()
        
        return(true)
    }
    
    
    @IBAction func GuardarCambios(){
      
        Database.database().reference().child("JobMe").child("Usuarios").child("Empresas").child(UserID!).child("Ofertas").child(String(format: "/%d",DataHolder.sharedInstance.contadorOferta!)).updateChildValues(["Descrip":self.txtvDescription?.text])
        Database.database().reference().child("JobMe").child("Usuarios").child("Empresas").child(UserID!).child("Ofertas").child(String(format: "/%d",DataHolder.sharedInstance.contadorOferta!)).updateChildValues(["Requer":self.txtvRequirements?.text])
        Database.database().reference().child("JobMe").child("Usuarios").child("Empresas").child(UserID!).child("Ofertas").child(String(format: "/%d",DataHolder.sharedInstance.contadorOferta!)).updateChildValues(["Salario":self.txtfSalary?.text])
        Database.database().reference().child("JobMe").child("Usuarios").child("Empresas").child(UserID!).child("Ofertas").child(String(format: "/%d",DataHolder.sharedInstance.contadorOferta!)).updateChildValues(["Titulo":self.txtfTitle?.text])
         Database.database().reference().child("JobMe").child("Usuarios").child("Empresas").child(UserID!).child("Ofertas").child(String(format: "/%d",DataHolder.sharedInstance.contadorOferta!)).updateChildValues(["Nif":self.txtfNif?.text])
        
        
        
    
        
          self.performSegue(withIdentifier: "tranGuardado", sender: self)
        
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
