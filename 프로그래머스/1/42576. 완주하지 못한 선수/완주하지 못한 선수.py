from collections import Counter

def solution(participant, completion):
    participant_count = Counter(participant)
    completion_count = Counter(completion)
    
    for person in participant_count:
        if participant_count[person] != completion_count[person]:
            return person
