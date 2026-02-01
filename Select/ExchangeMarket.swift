//
//  ExchangeMarket.swift
//  Select
//
//  Created by Buğra Akgün on 4.11.2025.
//

import UIKit

class ExchangeMarket: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var Papers: UITableView!
    
    static var papername = [String]()
    
    static var papercost = [Int]()
    
    static var paperamount = [Int]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Papers.delegate = self
        Papers.dataSource = self
        
        
        

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExchangeMarket.papername.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = ExchangeMarket.papername[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
