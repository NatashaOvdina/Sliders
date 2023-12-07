//
//  ColorViewController.swift
//  Sliders
//
//  Created by Natalia Ovdina on 07.12.2023.
//

import UIKit

final class ColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController
        settingsVC?.colorOfMainView = view.backgroundColor
    }
    
}
