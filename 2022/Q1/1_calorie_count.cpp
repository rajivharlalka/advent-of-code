#include <bits/stdc++.h>
using namespace std;

int main()
{
  freopen("./input.txt", "r", stdin);
  freopen("./output.txt", "w", stdout);

  string s;
  int sum = 0;
  int number_of_lines = 2244;
  vector<int> ans;
  while (number_of_lines--)
  {
    // cout << s << endl;
    getline(cin, s);
    if (s.length() == 0)
    {
      // cout << "cat" << endl;
      sum = 0;
    }
    else
    {
      // cout << "Hello" << endl;
      sum += stoi(s);
    }

    ans.push_back(sum);
    // cout << s << ans << sum;
  }
  sort(ans.begin(), ans.end());
  cout << ans[ans.size() - 1] + ans[ans.size() - 2] + ans[ans.size() - 3];
}