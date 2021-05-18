//  Model.swift

import Foundation

struct Model: Codable {
    var photos: [Photos]
    
    struct Photos: Codable {
        var name: String
        var images: [Images]
        }

    struct Images: Codable {
        var url: String
        }

}




