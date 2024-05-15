//
//  Presenter.swift
//  CryptoViper
//
//  Created by Meltem Uğurlu on 6.06.2023.
//

import Foundation

//class, protocol
// talks to interactor, view, router

//to debug
enum NetworkError : Error{
    case NetworkFailed
    case ParsingFailed
    
}

protocol AnyPresenter{
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    
    func interactorDidDownloadCrypto (result: Result <[Crypto], Error>)
        
    
}

class CrptoPresenter : AnyPresenter{
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
       //değer atanınca yapılacak
        didSet{
            interactor?.downloadCryptos()
        }
    }
    
    var view: AnyView?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
    
        switch result{
        case .success(let cryptos):
            //view.update
            view?.update(with: cryptos)
        case .failure(_):
            //view.update error
            view?.update(with: "Try again later...")
        }
        
    }
    
    
    
}
