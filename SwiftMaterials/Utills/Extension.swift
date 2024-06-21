//
//  Extension.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 20/06/24.
//

import Foundation

extension Encodable {

    var toDictionary: [String: Any] {

        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }

        do {

            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {

            return [:]
        }
    }
}
