//
//  APIClient.swift
//  Networking
//
//  Created by Hariom Palkar on 26/10/20.
//

import Foundation
import Combine

struct APIClient {

    struct Response<T> { // The value property will be the actual object, and the response property will be the URL response including status code etc.
        let value: T
        let response: URLResponse
    }
    func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> { // 2
            return URLSession.shared
                .dataTaskPublisher(for: request) // 3
                .tryMap { result -> Response<T> in
                    let value = try JSONDecoder().decode(T.self, from: result.data) // 4
                    return Response(value: value, response: result.response) // 5
                }
                .receive(on: DispatchQueue.main) // 6
                .eraseToAnyPublisher() // 7
        }
    }
