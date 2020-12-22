in_file = open("/home/nathan/Programming/advent2020/day2/input", "r")
raw = in_file.read()
lines = raw.split('\n')

data = []
for x in lines:
    if len(x) > 0:
        elements = x.split(' ')
        nums = elements[0].split('-')
        low = int(nums[0])
        high = int(nums[1])
        char = elements[1].strip(':')
        password = elements[2]
        data.append({'low': low, 'high': high, 'char': char, 'password': password})

total = 0
for d in data:
    p = d['password']
    c = d['char']
    h = d['high']
    l = d['low']
    count = 0
    for x in p:
        if x == c:
            count = count + 1

    if count in range(l,h):
        total = total + 1
        print(f'Invalid: {d}')

print(total)
