import Foundation

do {
    let content = try String(contentsOfFile: "numbers.txt", encoding: .utf8)
    
    // Split into lines and process each line
    let pairs = content.components(separatedBy: .newlines)
        .filter { !$0.isEmpty } // Remove any empty lines
    
    // Create two arrays to store the numbers
    var firstNumbers: [Int] = []
    var secondNumbers: [Int] = []
    
    // Process each line
    for pair in pairs {
        let numbers = pair.split(separator: " ")
            .compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
        
        if numbers.count == 2 {
            firstNumbers.append(numbers[0])
            secondNumbers.append(numbers[1])
        }
    }

    firstNumbers.sort()
    // print("firstNumbers: \(firstNumbers)")
    secondNumbers.sort()
    // print("secondNumbers: \(secondNumbers)")

    var differences: [Int] = []
    for i in 0..<firstNumbers.count {
        differences.append(abs(secondNumbers[i] - firstNumbers[i]))
    }

    print("differences: \(differences.reduce(0, +))")
} catch {
    print("Error reading file: \(error)")
}

