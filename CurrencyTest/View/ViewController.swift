//
//  ViewController.swift
//  CurrencyTest
//
//  Created by Доловсков Владислав on 10.04.2018.
//  Copyright © 2018 Доловсков Владислав. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: CurrencyViewModel! {
        didSet {
            self.updateView()
        }
    }
    
    var updateTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let nib = UINib(nibName: CurrencyCell.cellIdentifier, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: CurrencyCell.cellIdentifier)
        
        self.tableView.tableFooterView = UIView()
    }
    
    @objc func timerFunc() {
        self.activityIndicator.startAnimating()
        self.updateView()
    }
    
    func startTimer() {
        self.updateTimer = Timer.scheduledTimer(timeInterval: 15, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
    }

    func updateView() {
        updateTimer?.invalidate()
        viewModel.updateCurrencies(complete: { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activityIndicator.stopAnimating()
                self?.startTimer()
            }
        }) { [weak self] (error) in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                self?.startTimer()
                if let error = error {
                    self?.showAlert(message: error.localizedDescription) // MARK: - TODO
                }
            }
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateButtonClick(_ sender: Any) {
        self.activityIndicator.startAnimating()
        self.updateView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getRowCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyCell.cellIdentifier, for: indexPath) as! CurrencyCell
        cell.viewModel = viewModel.getViewModelForCell(index: indexPath.row)
        return cell
    }


}

