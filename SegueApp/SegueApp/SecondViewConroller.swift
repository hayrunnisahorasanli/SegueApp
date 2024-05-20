//
//  SecondViewConroller.swift
//  SegueApp
//
//  Created by hayrunnisa horasanlı on 11.03.2024.
//

import UIKit

class SecondViewConroller: UIViewController {

    @IBOutlet weak var myLabelSecond: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var myName = " "
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = myName
    }
    

 
   
}
