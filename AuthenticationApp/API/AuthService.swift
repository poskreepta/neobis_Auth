//
//  AuthService.swift
//  AuthenticationApp
//
//  Created by poskreepta on 08.06.23.
//

import Foundation

enum ServiceError: Error {
    case serviceError(String)
    case unknown(String = "An unknown error occured")
    case decodingError(String = "Error parsing server response")
}

class AuthService {
    static func checkEmail(request: URLRequest, completion: @escaping (Result<CreateUser, Error>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, reponse, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(ServiceError.serviceError(error.localizedDescription)))
                    print(error)
                } else {
                    completion(.failure(ServiceError.unknown()))
                }
                return
            }
            print(data)
            
            let decoder = JSONDecoder()
            
            if let successMessage = try? decoder.decode(CreateUser.self, from: data) {
                completion(.success(successMessage))
                return
            } else if let errorMessage = try? decoder.decode(ErrorResponse.self, from: data) {
                completion(.failure(ServiceError.serviceError(errorMessage.error)))
                return
            } else {
                let responseString = String(data: data, encoding: .utf8) ?? "none"
                let extractedErrorMessage = extractErrorMessageEmail(from: responseString)
                completion(.failure(ServiceError.decodingError(extractedErrorMessage)))
                return
            }
        }.resume()
        
    }
    
    static func createProfile(request: URLRequest, completion: @escaping (Result<CreateProfile, Error>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, reponse, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(ServiceError.serviceError(error.localizedDescription)))
                    print(error)
                } else {
                    completion(.failure(ServiceError.unknown()))
                }
                return
            }
            print(data)
            let decoder = JSONDecoder()
            if let successMessage = try? decoder.decode(CreateProfile.self, from: data) {
                completion(.success(successMessage))
                return
            } else if let errorMessage = try? decoder.decode(ErrorResponse.self, from: data) {
                completion(.failure(ServiceError.serviceError(errorMessage.error)))
                return
            } else {
                let responseString = String(data: data, encoding: .utf8) ?? "none"
                let extractedErrorMessage = extractErrorMessage(from: responseString)
                completion(.failure(ServiceError.decodingError(extractedErrorMessage)))
                return
            }
        }.resume()
    }
    
    static func setPasswords(request: URLRequest, completion: @escaping (Result<CreatePassword, Error>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, reponse, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(ServiceError.serviceError(error.localizedDescription)))
                    print(error)
                } else {
                    completion(.failure(ServiceError.unknown()))
                }
                return
            }
            print(data)
            let decoder = JSONDecoder()
            if let successMessage = try? decoder.decode(CreatePassword.self, from: data) {
                completion(.success(successMessage))
                return
            } else if let errorMessage = try? decoder.decode(ErrorResponse.self, from: data) {
                completion(.failure(ServiceError.serviceError(errorMessage.error)))
                return
            } else {
                let responseString = String(data: data, encoding: .utf8) ?? "none"
                completion(.failure(ServiceError.decodingError("Error parsing server response: \(responseString)")))
                return
            }
        }.resume()
    }
    
    static func logIn(request: URLRequest, completion: @escaping (Result<Login, Error>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, reponse, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(ServiceError.serviceError(error.localizedDescription)))
                    print(error)
                } else {
                    completion(.failure(ServiceError.unknown()))
                }
                return
            }
            print(data)
            
            let decoder = JSONDecoder()
            
            if let successMessage = try? decoder.decode(Login.self, from: data) {
                completion(.success(successMessage))
                return
            } else if let errorMessage = try? decoder.decode(ErrorResponse.self, from: data) {
                completion(.failure(ServiceError.serviceError(errorMessage.error)))
                return
            } else {
                let responseString = String(data: data, encoding: .utf8) ?? "none"
                completion(.failure(ServiceError.decodingError("Error parsing server response: \(responseString)")))
                return
            }
        }.resume()
    }
    
    static func resetPassword(request: URLRequest, completion: @escaping (Result<ForgotPassword, Error>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, reponse, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(ServiceError.serviceError(error.localizedDescription)))
                    print(error)
                } else {
                    completion(.failure(ServiceError.unknown()))
                }
                return
            }
            print(data)
            
            let decoder = JSONDecoder()
            
            if let successMessage = try? decoder.decode(ForgotPassword.self, from: data) {
                completion(.success(successMessage))
                return
            } else if let errorMessage = try? decoder.decode(ErrorResponse.self, from: data) {
                completion(.failure(ServiceError.serviceError(errorMessage.error)))
                return
            } else {
                let responseString = String(data: data, encoding: .utf8) ?? "none"
                completion(.failure(ServiceError.decodingError("Error parsing server response: \(responseString)")))
                return
            }
        }.resume()
        
    }
    
    // Метод для извлечения сообщения об ошибке
    private static func extractErrorMessage(from error: String) -> String {
        guard let jsonData = error.data(using: .utf8),
            let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any],
            let errorMessage = json["detail"] as? String else {
                return error
        }
        return errorMessage
    }
    
    private static func extractErrorMessageEmail(from error: String) -> String {
        guard let jsonData = error.data(using: .utf8),
            let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any],
              let errorMessageArray = json["email"] as? [String],
              let errorMessage = errorMessageArray.first else {
                return error
        }
        return errorMessage
    }
    
}



