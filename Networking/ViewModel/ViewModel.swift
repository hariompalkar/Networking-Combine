//
//  ViewModel.swift
//  Networking
//
//  Created by Hariom Palkar on 26/10/20.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = [] // 1
    var cancellationToken: AnyCancellable? // 2
    init() {
        getMovies() // 3
    }
}

extension MovieViewModel {
    // Subscriber implementation
    func getMovies() {
        cancellationToken = Endpoint.request(.trendingMoviesWeekly) // 4
            .mapError({ (error) -> Error in // 5
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, // 6
                  receiveValue: {
                    self.movies = $0.movies // 7
            })
    }
}

class ViewModel: ObservableObject {
    @Published var users: [User] = []
    var cancellationToken: AnyCancellable? // 2
    init() {
        getUser()
    }
}

extension ViewModel {
    func getUser(){
        cancellationToken = Endpoint.request(.user) // 4
            .mapError({ (error) -> Error in // 5
                print(error)
                return error
            })
            .sink(receiveCompletion: {(completion) in
                switch completion {
                case let .failure(error):
                    print("Couldn't get users: \(error)")
                case .finished: break
                }
            }){ users in
                self.users // 7
            }
    }
}


