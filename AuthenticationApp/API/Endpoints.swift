//
//  Endpoints.swift
//  AuthenticationApp
//
//  Created by poskreepta on 08.06.23.
//

import Foundation

enum Endpoints {
    
    case checkEmail(path: String = "/register/", userRequest: RegisterUserRequest)
    case createProfile(user_id: String, path: String = "/form/", userRequest: AddUserDetailsRequest)
    case setPassword(user_id: String,path: String = "/set_password/", userRequest: SavePasswordRequest)
    case logIn(path: String = "/login/", userRequest: LogInRequest)
    case forgotPassword(path: String = "/forgot_password/", userRequest: ForgotPasswordRequest)
    
    var request: URLRequest? {
        guard let url = self.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = self.httpMethod
        request.addValues(for: self)
        request.httpBody = self.httpBody
        return request
    }
    
    private var url: URL? {
        var components = URLComponents()
        components.scheme = Constants.scheme
        components.port = Constants.port
        components.host = Constants.baseUrl
        components.path = self.path
        print(components.url ?? "no url")
        return components.url
    }
    
    private var path: String {
        switch self {
        case .checkEmail(let path, _):
            return path
        case .createProfile(let user_id, let path, _):
            return "/\(user_id)\(path)"
        case .setPassword(let user_id, let path, _):
            return "/\(user_id)\(path)"
        case .logIn(path: let path, _):
            return path
        case .forgotPassword(let path, _):
            return path
        }
    }
    
    private var httpBody: Data? {
        switch self {
        case .checkEmail(_, let userRequest):
                do {
                    let jsonEncoder = JSONEncoder()
                    let jsonData = try jsonEncoder.encode(userRequest)
                    let jsonString = String(data: jsonData, encoding: .utf8)
                    print("HTTP Body JSON String: \(jsonString ?? "")")
                    return jsonData
                } catch {
                    print("Error encoding httpBody JSON: \(error)")
                    return nil
                }
        case .createProfile(_, _, let userRequest):
            do {
                let jsonEncoder = JSONEncoder()
                let jsonData = try jsonEncoder.encode(userRequest)
                let jsonString = String(data: jsonData, encoding: .utf8)
                print("HTTP Body JSON String: \(jsonString ?? "")")
                return jsonData
            } catch {
                print("Error encoding httpBody JSON: \(error)")
                return nil
            }
        case .setPassword(_, _, let userRequest):
            do {
                let jsonEncoder = JSONEncoder()
                let jsonData = try jsonEncoder.encode(userRequest)
                let jsonString = String(data: jsonData, encoding: .utf8)
                print("HTTP Body JSON String: \(jsonString ?? "")")
                return jsonData
            } catch {
                print("Error encoding httpBody JSON: \(error)")
                return nil
            }
        case .logIn(_, let userRequest):
            do {
                let jsonEncoder = JSONEncoder()
                let jsonData = try jsonEncoder.encode(userRequest)
                let jsonString = String(data: jsonData, encoding: .utf8)
                print("HTTP Body JSON String: \(jsonString ?? "")")
                return jsonData
            } catch {
                print("Error encoding httpBody JSON: \(error)")
                return nil
            }
        case .forgotPassword(_, let userRequest):
            do {
                let jsonEncoder = JSONEncoder()
                let jsonData = try jsonEncoder.encode(userRequest)
                let jsonString = String(data: jsonData, encoding: .utf8)
                print("HTTP Body JSON String: \(jsonString ?? "")")
                return jsonData
            } catch {
                print("Error encoding httpBody JSON: \(error)")
                return nil
            }
        }
    }
    
    private var httpMethod: String {
        switch self {
        case .checkEmail:
            return HTTP.Method.post.rawValue
        case .createProfile:
            return HTTP.Method.post.rawValue
        case .setPassword:
            return HTTP.Method.put.rawValue
        case .logIn:
            return HTTP.Method.post.rawValue
        case .forgotPassword:
            return HTTP.Method.post.rawValue
        }
    }
}

extension URLRequest {
    mutating func addValues(for endpoint: Endpoints) {
        switch endpoint {
        case .checkEmail:
            self.setValue(HTTP.Headers.Value.applicationJson.rawValue, forHTTPHeaderField: HTTP.Headers.Key.contentType.rawValue)
        case .createProfile:
            self.setValue(HTTP.Headers.Value.applicationJson.rawValue, forHTTPHeaderField: HTTP.Headers.Key.contentType.rawValue)
        case .setPassword:
            self.setValue(HTTP.Headers.Value.applicationJson.rawValue, forHTTPHeaderField: HTTP.Headers.Key.contentType.rawValue)
        case .logIn:
            self.setValue(HTTP.Headers.Value.applicationJson.rawValue, forHTTPHeaderField: HTTP.Headers.Key.contentType.rawValue)
        case .forgotPassword:
            self.setValue(HTTP.Headers.Value.applicationJson.rawValue, forHTTPHeaderField: HTTP.Headers.Key.contentType.rawValue)
        }
    }
}
