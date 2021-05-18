import Foundation

class Networking {
    
    
    var saveDefaults = SaveDefaults()
    var dataJson = [Model.Photos]()
    var name: [String] = []
    var url: [String] = []
    
    
    func getData() {
        let urlString = "https://api.500px.com/v1/photos?feature=upcoming"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    
                    do {
                        let decoder = JSONDecoder()
                        let model = try decoder.decode(Model.self, from: data)
                        self.dataJson = model.photos
                        print(model)
                        for _ in 0..<self.dataJson.count {
                            if self.dataJson.last != nil {

                                self.name.append(self.dataJson.last?.name ?? "")
                                self.url.append(self.dataJson.last?.images.last?.url ?? "")

                                self.saveDefaults.save.setValue(self.name, forKey: "1")
                                self.name = self.saveDefaults.save.stringArray(forKey: "1") ?? []

                                self.saveDefaults.save.setValue(self.url, forKey: "2")
                                self.url = self.saveDefaults.save.stringArray(forKey: "2") ?? []

                                self.dataJson.removeLast()

                            }
                        }
                    }
                    catch {
                        print("Error! Something went wrong")
                    }
                }
            }
        }.resume()
    }
    
}
