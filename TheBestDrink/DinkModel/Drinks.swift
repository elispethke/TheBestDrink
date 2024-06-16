//
//  Drinks.swift
//  TheBestDrink
//
//  Created by Elisangela Pethke on 16.06.24.
//

import Foundation

class Drinks {
    let urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=A"
    
    var drinkArray: [Drink] = []
    
    func getData(completed: @escaping (_ error: String?) -> ()) {
        print("We are accessing the URL \(urlString)")
        
        guard let url = URL(string: urlString) else {
            print("ERRO: It was not possible to create a URL from \(urlString)")
            completed("It was not possible to create a URL from \(urlString)")
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("ERRO: \(error.localizedDescription)")
                completed(error.localizedDescription)
                return
            }
            
            do {
                guard let data = data else {
                    print("ERRO: No data returned")
                    completed("No data returned")
                    return
                }
                
                let returned = try JSONDecoder().decode(Returned.self, from: data)
                self.drinkArray += returned.drinks
                
            } catch {
                print("ERRO: \(error.localizedDescription)")
                completed(error.localizedDescription)
                return
            }
            completed(nil)
        }
        task.resume()
    }
}
