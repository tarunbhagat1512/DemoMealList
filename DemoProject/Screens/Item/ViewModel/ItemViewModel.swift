//
//  ItemViewModel.swift
//  DemoProject
//
//  Created by Zentech-038 on 31/05/24.
//

import Foundation

final class ItemViewModel {
    
    var allItemsArray = [ItemsModel]()
    
//    var allMemberArray = [MemberDetails]()
    var eventHandler: ((_ event: Event) -> Void)?
    
    func fetchItems() {
        self.eventHandler?(.loading)
        ApiManager.shared.request(modelType: Measl.self,
                                  type: ItemEndPoint.getAllItems) { result in
            self.eventHandler?(.stopLoading)
            
            switch result {
                
            case .success(let data):
                self.eventHandler?(.itemDetailFetched(itemDetail: data.meals))
//                self.allMemberArray = data.data
                
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
}

extension ItemViewModel {

    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
        case itemDetailFetched(itemDetail: [ItemsModel])
    }

}
