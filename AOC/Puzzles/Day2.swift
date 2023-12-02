//
//  Day2.swift
//  AOC
//
//  Created by Anshul Kanwar on 02/12/23.
//

import RegexBuilder

final class Day2: Puzzle {
    typealias Input = [Substring: [Substring]]
    
    var input: [Substring: [Substring]]
    
    enum Cube: String {
        case red, green, blue
    }
    
    init(input: Input) {
        self.input = input
    }
    
    convenience init(inputStr: String) {
        let games = inputStr
            .split(separator: "\n")
            .map {
                $0
                    .split(separator: ":")
            }
            .map {
                ($0[0], $0[1])
            }
        
        let dict = Dictionary(uniqueKeysWithValues: games)
            .mapValues {
                $0.split(separator: ";")
            }
        
        self.init(input: dict)
    }
    
    func part1() -> Any {
        let gameMatcher = Regex {
            "Game"
            CharacterClass.whitespace
            Capture {
                OneOrMore(.digit)
            }
        }
        
        let cubesMatcher = Regex {
            Capture {
                OneOrMore(.digit)
            }
            CharacterClass.whitespace
            Capture {
                ChoiceOf {
                    "red"
                    "green"
                    "blue"
                }
            }
        }
        
        var sum = 0
        
        for (game, result) in input {
            let match = try! gameMatcher.firstMatch(in: game)!
            let gameId = Int(match.1)!
            
            var isPossible = true
            
        outerloop: for cubes in result {
            for match in cubes.matches(of: cubesMatcher) {
                let nCubes = Int(match.1)!
                let color = Cube(rawValue: String(match.2))!
                
                switch color {
                case .red:
                    isPossible = nCubes <= 12
                case .green:
                    isPossible = nCubes <= 13
                case .blue:
                    isPossible = nCubes <= 14
                }
                
                if !isPossible {
                    break outerloop
                }
            }
        }
            
            if isPossible {
                sum += gameId
            }
        }
        
        return sum
    }
    
    func part2() -> Any {
        let cubesMatcher = Regex {
            Capture {
                OneOrMore(.digit)
            }
            CharacterClass.whitespace
            Capture {
                ChoiceOf {
                    "red"
                    "green"
                    "blue"
                }
            }
        }
        
        var sum = 0
        
        for (_, result) in input {
            var minRed = 0
            var minGreen = 0
            var minBlue = 0
            
            for cubes in result {
                for match in cubes.matches(of: cubesMatcher) {
                    let nCubes = Int(match.1)!
                    let color = Cube(rawValue: String(match.2))!
                        
                    switch color {
                    case .red:
                        minRed = max(minRed, nCubes)
                    case .green:
                        minGreen = max(minGreen, nCubes)
                    case .blue:
                        minBlue = max(minBlue, nCubes)
                    }
                }
            }
            
            let power = minRed * minGreen * minBlue
            
            sum += power
        }
        
        return sum
    }
}
