//
//  Day1.swift
//  AOC
//
//  Created by Anshul Kanwar on 01/12/23.
//

final class Day1: Puzzle {
    var input: [String]
    
    typealias Input = [String]
    
    init(input: Input) {
        self.input = input
    }
    
    convenience init(inputStr: String) {
        self.init(input: inputStr.split(separator: "\n").map { String($0) })
    }
    
    func part1() -> Any {
        input.reduce(0) { sum, calibrationValue in
            let firstDigit = calibrationValue.first { $0.isNumber }!
            let lastDigit = calibrationValue.last { $0.isNumber }!
            return sum + Int("\(firstDigit)\(lastDigit)")!
        }
    }
    
    func part2() -> Any {
        fatalError("Not Implemented")
    }
}
