//
//  ModelData.swift
//  Landmarks
//
//  Created by jerry tri tjahyono on 26/04/24.
//

import Foundation

// Variabel menampung array dari Object 'Landmark'
// Inisiasi melalui nilai return fungsi `load` dari hasil decode file json
var landmarks: [Landmark] = load("landmarkData.json")

// Fungsi untuk melakukan read pada file json
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    // akses pada file berdasarkan parameter `filename`
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    // inisiasi hasil encode pada variabel `data`
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    // menyimpan dan menyimpan data json yang sudah di decode menjadi objek data
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
