//
//  ViewController.swift
//  Sliders
//
//  Created by Natalia Ovdina on 17.11.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var redValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 10
        
    }

    @IBAction func redSliderAction() {
        redValue.text = String(format: "%.2f", redSlider.value)
        mainView.alpha = CGFloat(redSlider.value)
        
        
    }
    
    @IBAction func greenSliderAction() {
        greenValue.text = String(format: "%.2f", greenSlider.value)
        
    }
    
    @IBAction func blueSliderAction() {
        blueValue.text = String(format: "%.2f", blueSlider.value)
        
    }
    

}



