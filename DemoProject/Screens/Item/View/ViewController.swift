//
//  ViewController.swift
//  DemoProject
//
//  Created by Zentech-038 on 31/05/24.
//

import UIKit
import SDWebImage

class ItemVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = ItemViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.fetchItems()
        
        observeEvent()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTableViewCell")
        tableView.separatorStyle = .none
        tableView.bounces = false
        
    }


}

extension ItemVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.allItemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = viewModel.allItemsArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as! ItemTableViewCell
        
        if data.strCategory == "Vegetarian" {
            cell.viewCategory.backgroundColor = .green
        } else {
            cell.viewCategory.backgroundColor = .red
        }
        
        cell.lblItemName.text = data.strMeal
        cell.lblItemDescription.text = data.strInstructions
        
        cell.imgItem.sd_setImage(with: URL(string: data.strMealThumb ?? ""), placeholderImage: UIImage(named: ""))
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    
}

extension ItemVC {
    
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self = self else { return }
            
            switch event {
            
            case .loading:
                print("Data Loading")
            case .stopLoading:
                print("Data Stoped Loading")
            case .dataLoaded:
                print("Data Loaded")
            case .error(let error):
                print(error)

            case .itemDetailFetched(itemDetail: let itemDetail):
                viewModel.allItemsArray = itemDetail
                
                print(viewModel.allItemsArray)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
}

