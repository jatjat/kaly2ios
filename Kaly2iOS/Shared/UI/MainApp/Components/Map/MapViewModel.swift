//
//  MapViewModel.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-09-28.
//

import Foundation

class MapViewModel: ObservableObject {
//    @Published var robotPose = UIPose(x: 0, y: 0 , heading: 0)
    @Published var bestPoses = [UIPose]()
    @Published var odoPoses = [UIPose]()
    @Published var truePoses = [UIPose]()
    @Published var spinning = false
    @Published var shownError: ErrorMessage?

    let sessionService: SessionService
    
    init(sessionService: SessionService) {
        self.sessionService = sessionService
    }
    
    func withSpinner<T>(_ call: () throws -> T) rethrows -> T {
        defer {
            spinning = false
        }
        var out: T
        do {
            spinning = true
            out = try call()
        } catch {
            spinning = false
            throw error
        }
        return out
    }
    
    func showError(message: ErrorMessage) {
        shownError = message
    }
    
    func onAppear() {
//        Task() {
//            bestPoses = [UIPose]()
//        }
//        while true {
////            let itr: Iteration = sessionService.latestItr
////            bestPoses = itr.
//            
////            let newBestPoses, oldBestPoses = sessionService.bestPoses
//            do {
//                try await sessionService.waitForNextItr()
//            } catch {
//                showError(message: .derived(error: error))
//            }
//            bestPoses = sessionService.bestPoses
//            odoPoses = sessionService.odoPoses
//            truePoses = sessionService.truePoses
//        }
        
//        sessionService.onUpdate {
////            do {
////                withSpinner {
//                    bestPoses = sessionService.bestPoses
//                    odoPoses = sessionService.odoPoses
//                    truePoses = sessionService.truePoses
////                }
////            } catch {
////
////            }
//        }
//        sessionService.onBestPosesUpdated {
//            self.bestPoses = sessionService.bestPoses
//        }
//        sessionService.
    }
}


struct UIPose {
    let x: Float
    let y: Float
    let heading: Float
}

enum ErrorMessage {
    case generic
    case custom(text: String)
    case derived(error: Error)
    
    var message: String? {
        switch self {
        case .generic:
            return "An error has occurred. Please try again later."
        case .custom(let text):
            return text
        case .derived(let error):
            return error.localizedDescription
        }
    }
}
