//
//  OpenWeatherClient.swift
//  Sunshine
//
//  Created by Tyler Madonna on 9/16/16.
//  Copyright © 2016 Tyler Madonna. All rights reserved.
//

// MARK: - OpenWeatherClient: NSObject

import Foundation

class OpenWeatherClient : NSObject {
    
    // MARK: Properties
    
    // Shared session
    var session = URLSession.shared
    
    // MARK: Initializers
    
    override init() {
        super.init()
    }
    
    // MARK: GET
    
    func taskForGETMethod(method: String, parameters: [String: String], completionHandlerForGET: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) {
        
        /* 1. Set the parameters */
        var parametersWithApiKey = parameters
        parametersWithApiKey[ParameterKeys.ApiKey] = Constants.ApiKey
        
        /* 2/3. Build the URL, Configure the request */
        let url = openWeatherURLFromParameters(parameters: parametersWithApiKey, withPathExtension: method)
        
        let task = session.dataTask(with: url) { (data, reponse, error) in
            
            func sendError(error: String) {
                print(error)
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandlerForGET(nil, NSError(domain: "taskForGETMethod", code: 1, userInfo: userInfo))
            }
            
            /* GUARD: Was there an error? */
            guard (error == nil) else {
                sendError(error: "There was an error with your request: \(error)")
                return
            }
            
            /* GUARD: Was there a response returned? */
            guard let response = reponse as? HTTPURLResponse else {
                sendError(error: "The request returned an empty reponse")
                return
            }
            
            /* GUARD: Did we get a successful 2XX response? */
            guard response.statusCode >= 200, response.statusCode <= 299 else {
                sendError(error: "The request returned a status code other than 2xx!")
                return
            }
            
            /* GUARD: Was there any data returned? */
            guard let data = data else {
                sendError(error: "No data was returned by the request!")
                return
            }
            
            /* 5/6. Parse the data and use the data (happens in completion handler) */
            self.convertDataWithCompletionHandler(data: data, completionHandlerForConvertData: completionHandlerForGET)
        }
        
        /* 7. Start the request */
        task.resume()
    }
    
    // MARK: Helpers
    
    // Given raw JSON, return a usable Foundation object
    private func convertDataWithCompletionHandler(data: Data, completionHandlerForConvertData: (_ result: AnyObject?, _ error: NSError?) -> Void) {
        
        do {
            let parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as AnyObject
            completionHandlerForConvertData(parsedResult, nil)
        } catch {
            let userInfo = [NSLocalizedDescriptionKey : "Could not parse the data as JSON: '\(data)'"]
            completionHandlerForConvertData(nil, NSError(domain: "convertDataWithCompletionHandler", code: 1, userInfo: userInfo))
        }
    }
    
    // create a URL from parameters
    private func openWeatherURLFromParameters(parameters: [String: Any], withPathExtension: String? = nil) -> URL {
        
        let components = NSURLComponents()
        components.scheme = OpenWeatherClient.Constants.ApiScheme
        components.host = OpenWeatherClient.Constants.ApiHost
        components.path = OpenWeatherClient.Constants.ApiPath + (withPathExtension ?? "")
        components.queryItems = [URLQueryItem]()
        
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.queryItems!.append(queryItem)
        }
        
        return components.url!
    }
    
    // MARK: Shared Instance
    
    class func sharedInstance() -> OpenWeatherClient {
        struct Singleton {
            static var sharedInstance = OpenWeatherClient()
        }
        return Singleton.sharedInstance
    }
}
