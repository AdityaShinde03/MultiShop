//
//  FiltersViewController.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 25/06/24.
//

import UIKit

class FiltersViewController: UIViewController{

    var sectionTitles = ["Filter by Price","Filter by Size"]
    var filterOptions = [["$0 - $100","$100 - $200","$200 - $300","$300 - $400","$400 - $500"],["XS","S","M","L","XL"]]

    @IBOutlet weak var FiltersTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Filters"
        
        FiltersTableView.delegate = self
        FiltersTableView.dataSource = self
    }


    @IBAction func onApplyFiltersBtnPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension FiltersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filterOptions.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterOptions[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filterCell = FiltersTableView.dequeueReusableCell(withIdentifier: "FiltersTableViewCell", for: indexPath) as! FiltersTableViewCell
        filterCell.lblFilterText.text = filterOptions[indexPath.section][indexPath.row]
        filterCell.selectionStyle = .none
        
        return filterCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
}
