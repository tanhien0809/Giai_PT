//
//  ViewController.swift
//  Giai_PT
//
//  Created by Hien on 4/9/17.
//  Copyright © 2017 Hien. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txt_a: UITextField!
    
    @IBOutlet weak var txt_b: UITextField!
    
    @IBOutlet weak var txt_c: UITextField!
    @IBOutlet weak var btn_Giai: UIButton!
    
    @IBOutlet weak var lb_TB: UILabel!
    
    @IBOutlet weak var txt_KQ: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txt_KQ.isEnabled = false
        txt_a.delegate = self
        txt_b.delegate = self
        
        txt_c.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btn_Giai(_ sender: Any) {
        txt_KQ.text = ""
        let a : Float = Float(txt_a.text!)!
        let b : Float = Float(txt_b.text!)!
        let c : Float = Float(txt_c.text!)!
        
        if(a == 0)
        {
            PT_Bac1(b : b, c : c)
            
        }
        else
        {
            if ( b == 0 && c == 0)
            {
                lb_TB.text = "Phương trình có 1 nghiệm duy nhất!"
                lb_TB.textColor = UIColor.red
                txt_KQ.text = "x = 0"
            }
            else {
                PT_Bac2(a: a, b: b, c: c)
            }
        }
        
    }
    func PT_Bac1(b: Float, c : Float)
    {
        if(b == 0)
        {
            if(c==0)
            {
                lb_TB.text = "Phương trình có vô số nghiệm!"
                lb_TB.textColor = UIColor.red
            }else{
                lb_TB.text = "Phương trình vô nghiệm!"
                lb_TB.textColor = UIColor.red
            }
        }
            else {
                lb_TB.text = "Phương trình có 1 nghiệm duy nhất!"
                lb_TB.textColor = UIColor.red
            if(c == 0)
            {
                txt_KQ.text = "x = 0"
                
            }else {
                txt_KQ.text = "x = " + String(-c/b)
                
            }
            
        
    }
    }
    func PT_Bac2(a: Float, b : Float, c : Float)
    {
        let l = (b*b) - 4*a*c
        if (l > 0)
        {
            lb_TB.text = "Phương trình có hai nghiệm!"
            lb_TB.textColor = UIColor.green
            txt_KQ.text = "x1 = " + String((-b + sqrtf(l))/(2*a)) + "; x2 = " + String((-b - sqrtf(l))/(2*a))
            
        }
        else if (l == 0)
        {
            lb_TB.text = "Phương trình có nghiệm duy nhất!"
            lb_TB.textColor = UIColor.red
            txt_KQ.text = "x = " + String(-b/(2*a))
        }
        else {
            lb_TB.text = "Phương trình vô nghiệm!"
            lb_TB.textColor = UIColor.red
            txt_KQ.text = ""
            
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
        
        let components = string.components(separatedBy: inverseSet)
        
        let filters = components.joined(separator: "")
        
        if filters == string {
            return true
        } else {
            if string == "." {
                let countdots = textField.text!.components(separatedBy:".").count - 1
                if countdots == 0 {
                    return true
                } else{
                    if countdots > 0 && string == "." {
                        return false
                    } else {
                        return true
                    }
                }
            } else {
                if string == "-" {
                    if (textField.text!.isEmpty == true) {
                        return true
                    }
                    else {
                        return false
                    }
                } else {
                    return false
                }
            }
        }
    }
}
    
    




