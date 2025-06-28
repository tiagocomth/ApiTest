//
//  APIError.swift
//  ApiTest
//
//  Created by Thiago de Jesus on 28/06/25.
//

import Foundation

enum APIError: Error {
    case invalidURL, invalidResponse, APIError(Error)
}
