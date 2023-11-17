//
//  Utils.swift
//  AOC
//
//  Created by Anshul Kanwar on 17/11/23.
//

import Foundation

func readFile(_ filename: String) -> String {
    let cwd = FileManager.default.currentDirectoryPath
    let filepath = "\(cwd)/\(filename)"
    
    do {
        return try String(contentsOfFile: filepath)
    } catch {
        fatalError("Could not read \(filepath)\n\(error)")
    }
}
