//
//  Day1.swift
//  AOC
//
//  Created by Anshul Kanwar on 01/12/23.
//

import Foundation
import RegexBuilder

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
        fatalError("Could not implement")
//        let numberFormatter = NumberFormatter()
//        numberFormatter.numberStyle = .spellOut
//       
//        let calibrationMatcher = /(?=(one|two|three|four|five|six|seven|eight|nine))/
//        
//        return input.reduce(0) { sum, calibrationValue in
//            let matches = calibrationValue.matches(of: calibrationMatcher).map { $0.output.1 }
//            
//            let firstDigitString = matches.first!
//            let lastDigitString = matches.last!
//            
//            let firstDigit = numberFormatter.number(from: String(firstDigitString)) ?? Int(firstDigitString)! as NSNumber
//            let lastDigit = numberFormatter.number(from: String(lastDigitString)) ?? Int(lastDigitString)! as NSNumber
//            
//            print("\(firstDigitString) \(lastDigitString) \t \(calibrationValue)")
//            
//            return sum + Int("\(firstDigit)\(lastDigit)")!
//        }
    }
}
