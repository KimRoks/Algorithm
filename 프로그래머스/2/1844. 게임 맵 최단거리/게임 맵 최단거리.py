from collections import deque

def solution(maps):
    n = len(maps)
    m = len(maps[0])
    
    visited = [[-1] * m for _ in range(n)]
    
    q = deque([(0, 0)])
    visited[0][0] = 1
    
    dn = [-1, 1, 0, 0]
    dm = [0, 0, -1, 1]
    
    while q:
        currentN, currentM = q.popleft()
        
        for i in range(4):
            nextN = currentN + dn[i]
            nextM = currentM + dm[i]
            
            if 0 <= nextN < n and 0 <= nextM < m and maps[nextN][nextM] == 1 and visited[nextN][nextM] == -1:
                visited[nextN][nextM] = visited[currentN][currentM] + 1
                q.append((nextN, nextM))
    
    return visited[n-1][m-1]
