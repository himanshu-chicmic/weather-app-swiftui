//
//  File.swift
//  Cards
//
//  Created by Himanshu on 3/27/23.
//

import Foundation
import SwiftUI

/**
 Router<T: Hashable> - final class for navigating between different views
 - Methods
    - push(_ path: T)
    - pop()
 */
final class Router<T: Hashable>: ObservableObject {
    @Published var paths: [T] = []
    
    /**
     * adds the path to paths array
     *
     - @Parameters: <T>.
     */
    func push(_ path: T) {
        paths.append(path)
    }
    
    /**
     * removes the last element from paths array
     *
     */
    func pop() {
        paths.removeLast(1)
    }
}

/**
 Path - enum for different views
 */
enum Path {
    case OnboardingView
    case SelectCityView
    case HomeView
}
