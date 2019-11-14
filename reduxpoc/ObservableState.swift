//
//  BindableStore.swift
//  reduxpoc
//
//  Created by Jose Diego on 11/14/19.
//  Copyright © 2019 Focus in Lab. All rights reserved.
//
import Combine
import ReSwift
import SwiftUI

public class ObservableState<T>: ObservableObject where T: StateType {
    // MARK: Public properties

    @Published public var current: T

    // MARK: Private properties

    private var store: Store<T>

    // MARK: Lifecycle

    public init(store: Store<T>) {
        self.store = store
        current = store.state

        store.subscribe(self)
    }

    deinit {
        store.unsubscribe(self)
    }

    // MARK: Public methods

    public func dispatch(_ action: Action) {
        store.dispatch(action)
    }

    public func dispatch(_ action: Action) -> () -> Void {
        {
            self.store.dispatch(action)
        }
    }
}

extension ObservableState: StoreSubscriber {
    // MARK: - <StoreSubscriber>

    public func newState(state: T) {
        DispatchQueue.main.async {
            self.current = state
        }
    }
}

// final class BindableStore<S>: ObservableObject, StoreSubscriber where S: StateType {
//
//    public typealias StoreSubscriberStateType = S
//
//    var objectWillChange = PassthroughSubject<BindableStore, Never>()
//
//    private(set) var state: S {
//        didSet {
//            objectWillChange.send(self)
//        }
//    }
//
//    private let store: Store<S>
//
//    func dispatch(_ action: Action) -> Void {
//        store.dispatch(action)
//    }
//
//    /// Initializes the store with a reducer, an initial state and a list of middleware.
//    ///
//    /// Middleware is applied in the order in which it is passed into this constructor.
//    ///
//    /// - parameter reducer: Main reducer that processes incoming actions.
//    /// - parameter state: Initial state, if any. Can be `nil` and will be
//    ///   provided by the reducer in that case.
//    /// - parameter middleware: Ordered list of action pre-processors, acting
//    ///   before the root reducer.
//    /// - parameter automaticallySkipsRepeats: If `true`, the store will attempt
//    ///   to skip idempotent state updates when a subscriber's state type
//    ///   implements `Equatable`. Defaults to `true`.
//    init(
//        reducer: @escaping Reducer<S>,
//        state: S?,
//        middleware: [Middleware<S>] = [],
//        automaticallySkipsRepeats: Bool = true
//        ) {
//
//        store = Store(reducer: reducer, state: state, middleware: middleware, automaticallySkipsRepeats: automaticallySkipsRepeats)
//
//        self.state = store.state
//
//        defer { store.subscribe(self) }
//    }
//
//    public func newState(state: S) {
//        self.state = state
//    }
// }
