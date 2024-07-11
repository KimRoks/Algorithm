let hm = readLine()!.split(separator: " ").map { Int($0)! }

var (h, m) = (hm[0], hm[1])

m -= 45

if m < 0 {
    h -= 1
    m = 60 + m
} else if m > 59 {
    h += 1
    m -= 60
} 
if h >= 24 {
    h -= 24
} else if  h < 0 {
    h = 24 + h
}

print(h, m)

