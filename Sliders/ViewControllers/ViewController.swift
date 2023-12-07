//
//  ViewController.swift
//  Sliders
//
//  Created by Natalia Ovdina on 17.11.2023.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var redValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 10
        makeColoredBackground()
        
        redValue.text = string(from: redSlider)
        greenValue.text = string(from: greenSlider)
        blueValue.text = string(from: blueSlider)
    }
    
    // MARK: - IB Actions
    @IBAction func sliderAction(_ sender: UISlider) {
        makeColoredBackground()
        
        switch sender {
        case redSlider:
            redValue.text = string(from: redSlider)
        case greenSlider:
            greenValue.text = string(from: greenSlider)
        default:
            blueValue.text = string(from: blueSlider)
        }
    }
    
    
    // MARK: - Private Methods
    private func makeColoredBackground() {
        let backgroundColored = UIColor(
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
        mainView.backgroundColor = backgroundColored
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}



