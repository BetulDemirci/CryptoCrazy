//
//  ViewController.swift
//  CryptoCrazy
//
//  Created by Semafor on 29.09.2020.
//  Copyright © 2020 Semafor. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    var colorArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        self.colorArray = [
        UIColor(red: 170/255, green: 23/255, blue: 56/255, alpha: 1.0),
        UIColor(red: 67/255, green: 34/255, blue: 124/255, alpha: 1.0),
        UIColor(red: 90/255, green: 56/255, blue: 22/255, alpha: 1.0),
        UIColor(red: 78/255, green: 88/255, blue: 67/255, alpha: 1.0),
        UIColor(red: 34/255, green: 90/255, blue: 23/255, alpha: 1.0),
        UIColor(red: 12/255, green: 123/255, blue: 55/255, alpha: 1.0),
        ]
        getData()
    }
    
    func getData(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        WebService().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos{
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberRownInSection()
    }
       
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CryptoTableViewCell
    let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(index: indexPath.row)
    cell.currencyText.text = cryptoViewModel.name
    cell.priceText.text = cryptoViewModel.price
    cell.backgroundColor = self.colorArray[indexPath.row % 6]
    return cell
   }
}

