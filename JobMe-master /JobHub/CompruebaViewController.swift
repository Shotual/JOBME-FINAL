//
//  CompruebaViewController.swift
//  JobHub
//
//  Created by Daniel de la Iglesia Gonzalez on 14/11/17.
//  Copyright © 2017 Daniel de la Iglesia Gonzalez. All rights reserved.
//

import UIKit

class CompruebaViewController: UIViewController {
    @IBOutlet var txtTipo:UISegmentedControl?


    override func viewDidLoad() {
        super.viewDidLoad()
        txtTipo?.selectedSegmentIndex=0
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func compruebaButton() {
        
        if(txtTipo?.selectedSegmentIndex==1){
            self.performSegue(withIdentifier: "tranemploye", sender: self)
            
        }
        else if(txtTipo?.selectedSegmentIndex==0){
            self.performSegue(withIdentifier: "trancompany", sender: self)

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
