//
//  Utils.swift
//  AOC
//
//  Created by Anshul Kanwar on 17/11/23.
//

import Foundation

protocol Puzzle {
    associatedtype Input: Any
    var input: Input { get }
    
    init(input: Input)
    init(inputStr: String)
    
    func part1() -> Any
    func part2() -> Any
}

func readInput(forDay dayNumber: Int) -> String {
    readFile("Inputs/day\(dayNumber).txt")
}

func readFile(_ filename: String) -> String {
    let cwd = FileManager.default.currentDirectoryPath
    let filepath = "\(cwd)/\(filename)"
    
    do {
        return try String(contentsOfFile: filepath)
    } catch {
        fatalError("Could not read \(filepath)\n\(error)")
    }
}
