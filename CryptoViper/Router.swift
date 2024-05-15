//
//  Router.swift
//  CryptoViper
//
//  Created by Meltem Uğurlu on 6.06.2023.
//

import Foundation
import UIKit

//class, protocol
// entryPoint : uıviewcontroller

//istenilen sınıflarda uygulanır


typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter{
    
    var entry : EntryPoint? {get}
    
    static func startEXecution() -> AnyRouter
    
    
}

class CryptoRouter : AnyRouter{
    
    var entry: EntryPoint?
    
    static func startEXecution() -> AnyRouter {

        let router = CryptoRouter()
        
        var view : AnyView = CryptoViewController()
        var presenter : AnyPresenter = CrptoPresenter()
        var interactor : AnyInteractor = CryptoInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint
        
        return router
        
    }
    
    
    
}
