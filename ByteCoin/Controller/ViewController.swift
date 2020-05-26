//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//MARK: - OUTLET
    @IBOutlet weak var bitCoinLabel: UILabel!
    @IBOutlet weak var currencyLable: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
//MARK: - VARIBLES
    var coinManager = CoinManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
    }
}
//MARK: - pickerViewProtocols
extension ViewController : UIPickerViewDataSource,UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for:selectedCurrency )
    }
}




//MARK: - trasportProtcol
extension ViewController: transport{
    func dealWithError(error: Error) {
        print(error)
    }
    
    func coinUpdate(coderRate: CoinModel) {
        DispatchQueue.main.async {
            self.bitCoinLabel.text = coderRate.bitCoinValueString
            self.currencyLable.text = coderRate.currencyValue
        }
    }

}
