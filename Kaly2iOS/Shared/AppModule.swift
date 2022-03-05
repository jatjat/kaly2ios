//
//  AppModule.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-09-30.
//

import Foundation
import Cleanse

import Data
import Domain

class CoffeeMaker {
    init(useCase: ChangeRobotSettingsUseCase) {
        Task.init {
            try? await useCase.execute(robotSessionID: 0, shouldRun: false)
        }
    }
}

struct Bob {
    
}

// The data module only satisties
struct DataComponent: Component {
    typealias Root = Bob
    
    static func configureRoot(binder bind: ReceiptBinder<Bob>) -> BindingReceipt<Bob> {
        return bind.to(factory: Bob.init)
    }

    static func configure(binder: Binder<Singleton>) {
        binder.include(module: DataModule.self)
        binder.include(module: DomainModule.self)
    }
}

struct AppComponent: RootComponent {
    typealias Root = CoffeeMaker

    static func configureRoot(binder bind: ReceiptBinder<CoffeeMaker>) -> BindingReceipt<CoffeeMaker> {
        return bind.to(factory: CoffeeMaker.init)
    }
    
    static func configure(binder: Binder<Singleton>) {
        binder.include(module: DataModule.self)
        binder.include(module: DomainModule.self)
//        binder.include(module: PresentationModule.self)

        
//                binder
//                    .bind(ChangeRobotSettingsUseCase.self)
//                    .to(factory: ChangeRobotSettingsUseCaseImpl.init)
    }
}

class AppModule {
    func registerAll() {
        
        let coffeeMaker = try! ComponentFactory.of(AppComponent.self).build(())

        
        
//        let bob = NeedleFoundation.Scope.self
//        // Create services:
//        let appConfig = AppConfig.fromAppPlist()
//        let mapClient = MapClientImpl()
//        let robotClient = RobotClientImpl()
////        let sesClient = SessionService()
//        
//        let grpcChannelFactory = GRPCChannelFactoryImpl()
//        
//        // Register services:
//        DependencyContainer.register(type: AppConfig.self, appConfig)
//        DependencyContainer.register(type: MapClient.self, mapClient)
//        DependencyContainer.register(type: RobotClient.self, robotClient)
////        DependencyContainer.register(type: SessionServiceProtocol.self, sesClient)
//        DependencyContainer.register(type: GRPCChannelFactory.self, grpcChannelFactory)
//        
//        // Ensure that all injected services can be resolved:
//        DependencyContainer.checkRegistered()
//        
//        // Setup services:
//        grpcChannelFactory.setup()
//        
    }
}
