//
//  MapViewModel.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-09-28.
//

import Combine
import Foundation
import SwiftUI

// protocol UpdateMapUseCaseResult {
//    var bestPoses: [UIPose] { get }
//    var odoPoses: [UIPose] { get }
//    var truePoses: [UIPose] { get }
// }

struct UpdateMapUseCaseResult { //: UpdateMapUseCaseResult {
    let bestPoses: [UIPose]
    let odoPoses: [UIPose]
    let truePoses: [UIPose]
}

// protocol UpdateMapUseCase {
//    func execute() async throws -> UpdateMapUseCaseResult
// }
class UpdateMapUseCase { //: UpdateMapUseCase {
    var counter = 0
    func execute() async throws -> UpdateMapUseCaseResult {
        if counter > 2 {
            try await Task.sleep(nanoseconds: 100_000_000)
        }
        var bestPoses = [UIPose]()
        for i in 1 ..< Int.random(in: 1 ..< 10) {
            bestPoses.append(UIPose(x: Float(i), y: Float(i), heading: Float(i)))
        }
        counter += 1
        return UpdateMapUseCaseResult(bestPoses: bestPoses, odoPoses: [], truePoses: [])
    }
}

class MapViewModel: ObservableObject {
    @Published var bestPoses = [UIPose]()
    @Published var odoPoses = [UIPose]()
    @Published var truePoses = [UIPose]()
    @Published var spinning = false
    @Published var shownError: ErrorMessage?

    let updateMapUseCase: UpdateMapUseCase

    var updateTask: Task<Void, Error>?

    init(updateMapUseCase: UpdateMapUseCase) {
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
//    }
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
        case let .custom(text):
            return text
        case let .derived(error):
            return error.localizedDescription
        }
    }
}

import Combine
// From https://trycombine.com/posts/combine-async-sequence-2/
public class CombineAsyncStream<Upstream: Publisher>: AsyncSequence {
    public typealias Element = Upstream.Output
    public typealias AsyncIterator = CombineAsyncStream<Upstream>

    public func makeAsyncIterator() -> Self {
        self
    }

    private let stream:
        AsyncThrowingStream<Upstream.Output, Error>

    private lazy var iterator = stream.makeAsyncIterator()

    private var cancellable: AnyCancellable?
    public init(_ upstream: Upstream) {
        var subscription: AnyCancellable?

        stream = AsyncThrowingStream<Upstream.Output, Error>(Upstream.Output.self) { continuation in
            subscription = upstream
                .handleEvents(
                    receiveCancel: {
                        continuation.finish(throwing: nil)
                    }
                )
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case let .failure(error):
                        continuation.finish(throwing: error)
                    case .finished: continuation.finish(throwing: nil)
                    }
                }, receiveValue: { value in
                    continuation.yield(value)
                })
        }

        cancellable = subscription
    }

    func cancel() {
        cancellable?.cancel()
        cancellable = nil
    }
}

extension CombineAsyncStream: AsyncIteratorProtocol {
    public func next() async throws -> Upstream.Output? {
        try await iterator.next()
    }
}

public extension Publisher {
    func asyncStream() -> CombineAsyncStream<Self> {
        CombineAsyncStream(self)
    }
}

class ObservableArray<T>: ObservableObject {
    var cancellables = [AnyCancellable]()

    @Published var array: [T] = []

    init(array: [T]) {
        self.array = array
    }

    func observeChildrenChanges<T: ObservableObject>() -> ObservableArray<T> {
        let array2 = array as! [T]
        array2.forEach {
            let c = $0.objectWillChange.sink(receiveValue: { _ in self.objectWillChange.send() })

            // Important: You have to keep the returned value allocated,
            // otherwise the sink subscription gets cancelled
            self.cancellables.append(c)
        }
        return self as! ObservableArray<T>
    }
}
