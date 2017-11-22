//
//  JobMeTraVC.swift
//  JobHub
//
//  Created by Guille on 21/11/17.
//  Copyright © 2017 Daniel de la Iglesia Gonzalez. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class JobMeTraVC: UIViewController, UITextFieldDelegate  {
    
    @IBOutlet var txtfTitle: UITextField?
    @IBOutlet var txtfSalary: UITextField?
    @IBOutlet var txtfDescrip: UITextView?
    @IBOutlet var txtfRequer: UITextView?
      @IBOutlet var txtfNif: UITextField?
    
   var arrOfertas = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        consul1()
       

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func consul1(){
        
        DataHolder.sharedInstance.firDatabaseRef.child("JobMe/Usuarios/Ofertas").observe(DataEventType.value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? [String:AnyObject]
            
            
            print(value)
            let title = value?["Titulo1"] as? String
            print ("++++++++++++++++++++++++TITULO+++++++++++++++",title!)
            self.txtfTitle?.text = title as? String
            
            let salary = value?["Salario1"]
            self.txtfSalary?.text = salary as? String
            
            let descrip = value?["Descrip1"]
            self.txtfDescrip?.text = descrip as? String
            
            let requer = value?["Requer1"]
            self.txtfRequer?.text = requer as? String
            
            let nif = value?["Nif1"]
            self.txtfNif?.text = nif as? String
            
        
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    @IBAction func Like(){
        
        DataHolder.sharedInstance.firDatabaseRef.child("JobMe/Usuarios/Ofertas").observe(DataEventType.value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? [String:AnyObject]
            
            
            print(value)
            let title = value?["Titulo2"] as? String
            print ("++++++++++++++++++++++++TITULO+++++++++++++++",title!)
            self.txtfTitle?.text = title as? String
            
            let salary = value?["Salario2"]
            self.txtfSalary?.text = salary as? String
            
            let descrip = value?["Descrip2"]
            self.txtfDescrip?.text = descrip as? String
            
            let requer = value?["Requer2"]
            self.txtfRequer?.text = requer as? String
            
            let nif = value?["Nif2"]
            self.txtfNif?.text = nif as? String
            
            
        }) { (error) in
            print(error.localizedDescription)
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
