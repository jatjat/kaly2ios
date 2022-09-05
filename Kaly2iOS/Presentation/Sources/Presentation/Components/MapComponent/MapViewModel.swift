//
//  MapViewModel.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-09-28.
//

import Combine
import Domain
import Foundation
import SwiftUI

@MainActor
class MapViewModel: ObservableObject {
    @Published var bestPoses = [PoseEntity]()
    @Published var odoPoses = [PoseEntity]()
    @Published var truePoses = [PoseEntity]()
    @Published var spinning = false
    @Published var shownError: ErrorMessage?

    let updateMapUseCase: SeeMapUseCase

    var updateTask: Task<Void, Error>?

    nonisolated init(updateMapUseCase: SeeMapUseCase) {
        self.updateMapUseCase = updateMapUseCase
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
            throw error
        }
        return out
    }

    func withErrMsgs<T>(_ call: () throws -> T) {
        do {
            _ = try call()
        } catch {
            showError(message: .custom(text: error.localizedDescription))
        }
    }

    func showError(message: ErrorMessage) {
        shownError = message
    }

    func onAppear() {
        updateTask = Task { [self] in
            while !(updateTask?.isCancelled ?? false) {
                do {
                    let update = try await updateMapUseCase.execute()
                    shownError = nil
                    bestPoses = update.bestPoses
                    odoPoses = update.odoPoses
                    truePoses = update.truePoses
                } catch {
                    shownError = .custom(text: "Error updating map")
                }
            }
        }
    }

    func onDissappear() {
        updateTask?.cancel()
    }
}

enum ErrorMessage {
    case generic
    case custom(text: String)
    case derived(error: Error)

    var message: String? {
        switch self {
        case .generic:
            return "An error has occurred. Please try again later."
        case let .custom(text):
            return text
        case let .derived(error):
            return error.localizedDescription
        }
    }
}
