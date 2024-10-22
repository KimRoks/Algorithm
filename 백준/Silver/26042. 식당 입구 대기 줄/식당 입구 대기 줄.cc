#include <iostream>
#include <deque>
#include <algorithm>
#include <climits>

using namespace std;

int main() {
    int n;
    scanf("%d", &n);
    
    deque<int> q;
    int maxCount = 0;
    int resultCount = 0;
    int resultLastStudent = INT_MAX;

    for (int i = 0; i < n; ++i) {
        int type;
        scanf("%d", &type);
        
        if (type == 1) {
            int student;
            scanf("%d", &student);
            q.push_back(student);
        } else {
            q.pop_front();
        }
        
        int currentCount = q.size();
        if (currentCount > maxCount) {
            maxCount = currentCount;
            resultCount = currentCount;
            resultLastStudent = q.back();
        } else if (currentCount == maxCount) {
            resultCount = currentCount;
            resultLastStudent = min(resultLastStudent, q.back());
        }
    }

    printf("%d %d\n", resultCount, resultLastStudent);
    return 0;
}
