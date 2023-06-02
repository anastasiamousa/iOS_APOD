//
//  NetworkService.swift
//  iOS_APOD
//
//  Created by Anastasia Mousa on 2/6/23.
//

import Foundation
import Alamofire

class NetworkService {
    
    //MARK: - Properties
    
    typealias ApiClosurePicture = (Result<NasaPicture,Error>) -> ()
    typealias ApiClosurePictureDate = (Result<[NasaPicture],Error>) -> ()
    
    private let apiKey = "pVicagi3oylyrOLjwuk5gBOJi6jb6Tfn9AljM6oP"
    private var apiURL: URL? {
        URL(string: "https://api.nasa.gov/planetary/apod")
    }
    private var defaultParameters: [String: Any] {
        ["api_key": apiKey]
    }
    
    //MARK: - Methods
    
    func fetchTodaysImage(completion: ApiClosurePicture?) {
        guard let apiURL = apiURL else { return }
        AF.request(apiURL, method: .get, parameters: nil)
            .validate()
            .responseDecodable(of: NasaPicture.self, queue: .main) { response in
            switch response.result {
            case .success(let picture):
                completion?(.success(picture))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
    func fetchImages(from: Date? =  nil, to: Date? = nil, completion: ApiClosurePictureDate?) {
        guard let apiURL = apiURL else { return }

        var parameters = defaultParameters
        
        if let fromDate = from {
            parameters["end_date"] = fromDate.toYYYYMMDD
        }
        
        if let toDate = to {
            parameters["start_date"] = toDate.toYYYYMMDD
        }
        
        AF.request(apiURL, method: .get, parameters: nil)
            .validate()
            .responseDecodable(of: [NasaPicture].self, queue: .main) { response in
            switch response.result {
            case .success(let pictures):
                completion?(.success(pictures))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
}