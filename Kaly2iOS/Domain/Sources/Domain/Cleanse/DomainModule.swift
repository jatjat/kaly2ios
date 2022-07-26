//
//  DomainModule.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-11-12.
//

import Cleanse
import Combine
import Foundation

public struct DomainModule: Module {
    public static func configure(binder: Binder<Singleton>) {
        binder
            .bind(ChangeRobotSettingsUseCase.self)
            .to(factory: ChangeRobotSettingsUseCaseImpl.init)
        binder
            .bind(SeeMapUseCase.self)
            .to(factory: SeeMapUseCaseImpl.init)
    }
}
