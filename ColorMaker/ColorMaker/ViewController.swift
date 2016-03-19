//
//  ViewController.swift
//  ColorMaker
//
//  Created by Sarah Sahibzada on 3/19/16.
//  Copyright © 2016 Sarah Sahibzada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //rgb value labels
    
    @IBOutlet weak var red_label: UILabel!
    
    @IBOutlet weak var green_label: UILabel!
   
    @IBOutlet weak var blue_label: UILabel!
    
    
    
    @IBOutlet weak var color: UIButton!
    
    //color values
    var red_value: CGFloat = 0
    var blue_value: CGFloat = 0
    var green_value: CGFloat = 0
    var color_changed: Bool = false
    
    @IBAction func red_value_changed(sender: UISlider) {
        red_value = CGFloat(sender.value)
        red_label.text =  String(format:"%.0f",sender.value)
        color.backgroundColor = UIColor(red:red_value/255,green:green_value/255,blue:blue_value/255,alpha:1.0)
        if (!color_changed) {
            color_changed = true
            color.setTitle("", forState: .Normal)
        }
        
    }
    
    @IBAction func blue_value_changed(sender: UISlider) {
        blue_value = CGFloat(sender.value)
        blue_label.text = String(format:"%.0f",sender.value)
        color.backgroundColor = UIColor(red:red_value/255,green:green_value/255,blue:blue_value/255,alpha:1.0)
        if (!color_changed) {
            color_changed = true
            color.setTitle("", forState: .Normal)
        }
    }
    
    
    @IBAction func green_value_changed(sender: UISlider) {
        green_value = CGFloat(sender.value)
        green_label.text = String(format:"%.0f",sender.value)
        color.backgroundColor = UIColor(red:red_value/255,green:green_value/255,blue:blue_value/255,alpha:1.0)
        if (!color_changed) {
            color_changed = true
            color.setTitle("", forState: .Normal)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        color.backgroundColor = UIColor(red:0.0,green:0.0,blue:0.0,alpha:1.0)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

