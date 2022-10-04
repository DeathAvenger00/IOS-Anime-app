
import Foundation

struct Constants{
    static let ApiKey = "f39b535d564ec48acbcbfc9ef883899d"
    static let baseURL = "https://api.themoviedb.org"
}
enum ApiError: Error{
    case failedtogetdata
}

class APICaller{
    static let shared =  APICaller()
    
    
    func getTrendingmovie(completion:@escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string:"\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.ApiKey)")else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data,_,error in
            guard let data = data, error == nil  else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(ApiError.failedtogetdata))
            }
        }
        task.resume()
    }
    func getTrendingtv(completion:@escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string:"\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.ApiKey)")else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data,_,error in
            guard let data = data, error == nil  else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(ApiError.failedtogetdata))
            }
        }
        task.resume()
        
    }
    func getpopular(completion:@escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string:"\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.ApiKey)&language=en-US&page=1")else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data,_,error in
            guard let data = data, error == nil  else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(ApiError.failedtogetdata))
            }
        }
        task.resume()
    }
    func getUpcoming(completion:@escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string:"\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.ApiKey)&language=en-US&page=1")else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data,_,error in
            guard let data = data, error == nil  else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(ApiError.failedtogetdata))
            }
        }
        task.resume()
    }
    func getToprated(completion:@escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string:"\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.ApiKey)&language=en-US&page=1")else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data,_,error in
            guard let data = data, error == nil  else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(ApiError.failedtogetdata))
            }
        }
        task.resume()
    }
}
