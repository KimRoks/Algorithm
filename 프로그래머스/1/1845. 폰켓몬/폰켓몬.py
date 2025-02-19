def solution(nums):
    unique_nums = set(nums)
    
    count = len(nums) // 2

    if len(unique_nums) < count:
        return len(unique_nums)
    else:
        return count

