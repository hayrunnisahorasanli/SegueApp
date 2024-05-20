//
//  ViewController.swift
//  SegueApp
//
//  Created by hayrunnisa horasanlı on 11.03.2024.
//

import UIKit

class ViewController: UIViewController {
    var userName = ""

    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var nameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Lifecycle
        print("viesDidLoad funcation called")
       
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear funcation called")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear funcation called")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear funcation called")
        nameText.text = " "
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear funcation called")
    }
    

    @IBAction func nextClicked(_ sender: Any) {
        userName = nameText.text!
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            // as -- casting
            let destinationVC = segue.destination as! SecondViewConroller
            destinationVC.myName = userName
        }
    }
    
}

