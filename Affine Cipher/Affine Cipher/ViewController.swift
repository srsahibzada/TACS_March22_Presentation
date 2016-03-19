//
//  ViewController.swift
//  Affine Cipher
//
//  Created by Sarah Sahibzada on 3/17/16.
//  Copyright © 2016 Sarah Sahibzada. All rights reserved.
// This was initially a lot more ambitious. In interest of time and
// spring break its been modified to just shifting letters.

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
   // interface builder outlets
    @IBOutlet weak var to_encrypt: UITextField!
    @IBOutlet weak var encryption_equation: UITextField!
    @IBOutlet weak var go_button: UIButton!
    @IBOutlet weak var encrypt_text: UILabel!

  // swift functions
    override func viewDidLoad() {
        super.viewDidLoad()
        to_encrypt.delegate = self
        encryption_equation.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func is_numeric(c: Character) -> Bool {
        if (c >= "0" && c <= "9") {
            return true;
        } else {
            return false
        }
    
    }
    func is_character_uppercase(c: Character) -> Bool {
        return ("A"..."Z").contains(c)
    }
    func is_character_lowercase(c: Character) -> Bool {
        return ("a"..."z").contains(c)
    }
    func is_ascii_lowercase(ii: UInt8) -> Bool {
        return ( ii >= 97 && ii <= 123)
    }
    func is_ascii_uppercase(ii: UInt8) -> Bool {
        return ( ii >= 65 && ii <= 91)
    }
    func verify(eqn: String) -> Bool {
        for character in eqn.characters{
            if !is_numeric(character) {
                return false
            }
        }
        return true
    }
    func extract_shift(eqn: String) -> Int {
        let shift:Int = Int(encryption_equation.text!)!//http://stackoverflow.com/questions/24115141/swift-converting-string-to-int/30773127#30773127
        return shift % 26
    }
    
    // application functions
    @IBAction func encrypt(sender: UIButton) {
        encrypt_text.text = ""
        // step one: verify text
        var shifter: String = encryption_equation.text!
        var tester: Bool = verify(shifter)
        var new_message: String = ""
        var offset_letter: UInt8
        var encrypt_letter: UInt8
        if (tester == false) {
            encrypt_text.text = "Error: shift should be numeric only."
        } else {
            var final_message = [UInt8]()
           // encrypt_text.text = String(extract_shift(encryption_equation.text!))
            for ascii_val in to_encrypt.text!.utf8 {
                if (is_ascii_lowercase(ascii_val)) {
                    offset_letter = ascii_val - 97
                    encrypt_letter = ((offset_letter + UInt8(shifter)!) % 26) + 97
                    final_message.append(encrypt_letter)
                
                } else if (is_ascii_uppercase(ascii_val)) {
                    offset_letter = ascii_val - 65
                    encrypt_letter = ((offset_letter + UInt8(shifter)!) % 26) + 65
                    final_message.append(encrypt_letter)
                } else {
                    final_message.append(ascii_val)
                    continue; // leave whitespace, numbers, special characters as they are
                }
            }
            
            for val in final_message {
                new_message.append(Character(UnicodeScalar(val)))
            }
            encrypt_text.text = new_message
            print(new_message)
            print("----")
        }
       /* var message: String = to_encrypt.text!
        encrypt_text.text = message*/
        
      //  var eqn: String = encryption_equation.text!
        
    
    }
    
    // text fields
    // this is an override of a built in swift function called textfieldshouldreturn
    func textfieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder() // hides keyboard
        return true
    }
    
    //override the end editing
    /*func textFieldDidEndEditing(textField: UITextField) {
        // parse equation
       // var eqn: String = encryption_equation.text!
        
        
        
    }*/
}

