let input = readLine()!.split(separator: " ").map{Int($0)!}
let add = Int(readLine()!)!

var (hour, minuite) = (input[0],input[1])

minuite += add

while minuite >= 60 {
    if minuite >= 60 {
        hour += 1
        minuite -= 60
    }
}
if hour >= 24 {
    hour -= 24
}
print(hour, minuite)
