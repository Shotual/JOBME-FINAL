//
//  JobMeEmVC.swift
//  JobHub
//
//  Created by Guille on 21/11/17.
//  Copyright © 2017 Daniel de la Iglesia Gonzalez. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class JobMeEmVC: UIViewController {
    
    @IBOutlet var txtfNombre: UITextField?
    @IBOutlet var txtvEstudios: UITextView?
    @IBOutlet var txtvExperiencia: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        consul1()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func consul1(){
        
        DataHolder.sharedInstance.firDatabaseRef.child("JobMe/Usuarios/Empleados/0").observe(DataEventType.value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? [String:AnyObject]
            
            
            print(value)
            let nombre = value?["Nombre"] as? String
            print ("++++++++++++++++++++++++TITULO+++++++++++++++",nombre!)
            self.txtfNombre?.text = nombre as? String
            
            let estudios = value?["Estudios"]
            self.txtvEstudios?.text = estudios as? String
            
            let experiencia = value?["Experiencia"]
            self.txtvExperiencia?.text = experiencia as? String
            
            
            
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    @IBAction func Like(){
     
        DataHolder.sharedInstance.firDatabaseRef.child("JobMe/Usuarios/Empleados/1").observe(DataEventType.value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? [String:AnyObject]
            
            
            print(value)
            let nombre = value?["Nombre"] as? String
            print ("++++++++++++++++++++++++TITULO+++++++++++++++",nombre!)
            self.txtfNombre?.text = nombre as? String
            
            let estudios = value?["Estudios"]
            self.txtvEstudios?.text = estudios as? String
            
            let experiencia = value?["Experiencia"]
            self.txtvExperiencia?.text = experiencia as? String
            
            
            
            
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
