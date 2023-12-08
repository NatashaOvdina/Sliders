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
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var redValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    // MARK: - Public Properties
    var colorOfMainView: UIColor!
    
    weak var delegate: SettingsViewControllerDelegate?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 10
        mainView.backgroundColor = colorOfMainView
        getRGBColors()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
    }
    
    // MARK: - IB Actions
    @IBAction func sliderAction(_ sender: UISlider) {
        
        switch sender {
        case redSlider:
            redValue.text = string(from: redSlider)
            redTextField.text = string(from: redSlider)
        case greenSlider:
            greenValue.text = string(from: greenSlider)
            greenTextField.text = string(from: greenSlider)
        default:
            blueValue.text = string(from: blueSlider)
            blueTextField.text = string(from: blueSlider)
        }
        setupColor()
    }
    
    
    @IBAction func buttonActionToReturn() {
        view.endEditing(true)
        delegate?.setColor(mainView.backgroundColor ?? .gray)
        dismiss(animated: true)
    }
    
    // MARK: - Override Keyboard Method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    // MARK: - Private Methods
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
        
        redTextField.text = redValue.text
        greenTextField.text = greenValue.text
        blueTextField.text = blueValue.text
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    // MARK: - Private Method Alert
    private func showAlert(
        withTitle title: String,
        andMessage message: String,
        completion: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        let previousRedValue = redValue.text
        let previousGreenValue = greenValue.text
        let previousBlueValue = blueValue.text
        
        if let value = Float(text), value.description.count <= 4  {
            
            switch textField {
            case redTextField:
                redSlider.setValue(value, animated: true)
                redValue.text = string(from: redSlider)
                redTextField.text = redValue.text
                setupColor()
            case greenTextField:
                greenSlider.setValue(value, animated: true)
                greenValue.text = string(from: greenSlider)
                greenTextField.text = greenValue.text
                setupColor()
            default:
                blueSlider.setValue(value, animated: true)
                blueValue.text = string(from: blueSlider)
                blueTextField.text = blueValue.text
                setupColor()
            }
            
        } else {
            showAlert(
                withTitle: "Wrong format!",
                andMessage: "Please, enter correct value"
            )
            redTextField.text = previousRedValue
            greenTextField.text = previousGreenValue
            blueTextField.text = previousBlueValue
            return
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}



