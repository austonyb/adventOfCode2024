import Foundation

do {
    //pretty much the same as day one
    let content = try String(contentsOfFile: "numbers.txt", encoding: .utf8)
    
    let pairs = content.components(separatedBy: .newlines)
        .filter { !$0.isEmpty }
    
    var firstNumbers: [Int] = []
    var secondNumbers: [Int] = []
    
    for pair in pairs {
        let numbers = pair.split(separator: " ")
            .compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
        
        if numbers.count == 2 {
            firstNumbers.append(numbers[0])
            secondNumbers.append(numbers[1])
        }
    }

    firstNumbers.sort()
    secondNumbers.sort()
}