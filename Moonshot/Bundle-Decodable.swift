//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Muhammad Dzaky on 17/10/24.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [String: Astronaut] {
        // Locating data within the bundle and assign it into url
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate the \(file) in the bundle.")
        }
        // unwrap the data from the url above
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from the bundle.")
        }
        
        let decoder = JSONDecoder()
        
        // Using do block for cathing error
        do {
            return try decoder.decode([String: Astronaut].self, from: data)
            // if the key is not found
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from the bundle due to key is missing: \(key.stringValue) - \(context.debugDescription)")
        } catch DecodingError.typeMismatch(let type, let context) {
            fatalError("Failed to decode \(file) from the bundle due to type mismatch: \(type) - \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let value, let context) {
            fatalError("Failed to decode \(file) from the bundle due to value is missing: \(value) - \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from the bundle due to data corruption.")
        } catch {
            fatalError("Failed to decode \(file) from the bundle due to error: \(error)")
        }
        
    }
}
