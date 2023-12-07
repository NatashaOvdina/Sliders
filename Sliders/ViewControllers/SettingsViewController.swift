//
//  ViewController.swift
//  Sliders
//
//  Created by Natalia Ovdina on 17.11.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var redValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var colorOfMainView: UIColor!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 10
        mainView.backgroundColor = colorOfMainView
        getRGBColors()
    
        
    }
    
    // MARK: - IB Actions
    @IBAction func sliderAction(_ sender: UISlider) {
        
        switch sender {
        case redSlider:
            redValue.text = string(from: redSlider)
        case greenSlider:
            greenValue.text = string(from: greenSlider)
        default:
            blueValue.text = string(from: blueSlider)
        }
        setupColor()
    }
    
    
    private func setupColor() {
        mainView.backgroundColor = UIColor(
            red: CGFloat(
                redSlider.value
            ),
            green: CGFloat(
                greenSlider.value
            ),
            blue: CGFloat(
                blueSlider.value
            ),
            alpha: 1
        )
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
   private func getRGBColors() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        colorOfMainView.getRed(&red, green: &green, blue: &blue, alpha: nil)
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        redValue.text = string(from: redSlider)
        greenValue.text = string(from: greenSlider)
        blueValue.text = string(from: blueSlider)
    }
}
