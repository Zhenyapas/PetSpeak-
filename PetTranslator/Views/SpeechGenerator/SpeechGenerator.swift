import Foundation


func getPetPhrase(for pet: Pet, isReversed: Bool) -> String {
    let commonPhrases = [
        "Хочу гуляти!", "Дай їсти!", "Грайся зі мною!",
        "Мені сумно...", "Дай мені спокій", "Де моя іграшка?",
        "Погладь мене!", "Я втомився", "Хто там за дверима?", "Я хочу спати"
    ]
    
    if isReversed {
        let count = Int.random(in: 1...8)
        return pet == .cat ? String(repeating: "мяу ", count: count).trimmingCharacters(in: .whitespaces) :
        String(repeating: "вуф ", count: count).trimmingCharacters(in: .whitespaces)
    } else {
        return commonPhrases.randomElement() ?? "Я не знаю, що сказати..."
    }
}


let phrase = getPetPhrase(for: .cat, isReversed: false)


