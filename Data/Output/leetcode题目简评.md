## leetcode题目简评

[toc]

#### 0000.资料
[官网](https://leetcode.com/problemset/all/)

[leetcode详解，几百题](https://github.com/azl397985856/leetcode)

[代码速查表](https://github.com/OUCMachineLearning/OUCML/tree/master/%E4%BB%A3%E7%A0%81%E9%80%9F%E6%9F%A5%E8%A1%A8)

[图解leetcode](https://github.com/MisterBooo/LeetCodeAnimation)

#### 0001.two-sum [两数之和](https://leetcode-cn.com/problems/two-sum) (easy)  
one-pass hash table

#### 0005.longest-palindromic-substring [最长回文子串](https://leetcode-cn.com/problems/longest-palindromic-substring)  (medium)
* 法1:中心扩散
* 法2:动态规划
* 法3:[Manacher算法](https://www.cnblogs.com/cloudplankroader/p/10988844.html)

#### 0010.regular-expression-matching [正则表达式匹配](https://leetcode-cn.com/problems/regular-expression-matching)  (hard)
* 《剑指offer》第10题
* 和0072.Edit-Space类似

<img src="https://www.zhihu.com/equation?tex=d[i][j]=\begin{cases}
d[i-1][j-1]& p[j]='.'\\
s[i] == p[j]\quad \&\& \quad d[i - 1][j - 1] & p[j]=a\\
d[i][j - 2]\quad ||\quad d[i-1][j] & p[j-1:j]='.*'\\
d[i][j - 2]\quad ||\quad (d[i-1][j]\quad \&\&\quad s[i]==p[j-1])      & p[j-1:j]='a*'
\end{cases}
\notag
" alt="d[i][j]=\begin{cases}
d[i-1][j-1]& p[j]='.'\\
s[i] == p[j]\quad \&\& \quad d[i - 1][j - 1] & p[j]=a\\
d[i][j - 2]\quad ||\quad d[i-1][j] & p[j-1:j]='.*'\\
d[i][j - 2]\quad ||\quad (d[i-1][j]\quad \&\&\quad s[i]==p[j-1])      & p[j-1:j]='a*'
\end{cases}
\notag
" class="ee_img tr_noresize" eeimg="1">

#### 0015.3sum [三数之和](https://leetcode-cn.com/problems/3sum)  (medium)
* 先排序，在排序的基础上，虽然也是O(n^2)复杂度，但可以利用双指针尽量提高效率

#### 0020.valid-parentheses [有效的括号](https://leetcode-cn.com/problems/valid-parentheses) (easy)
* 栈的使用  

#### 0021.merge-two-sorted-lists [合并两个有序链表](https://leetcode-cn.com/problems/merge-two-sorted-lists)  (easy)
* 《剑指offer》，经典题，引入一个头节点
* 代码模版：
```c++
ListNode*head=new ListNode(0);
ListNode*p=head;
...
return head->next;
```

#### 0026.remove-duplicates-from-sorted-array [删除排序数组中的重复项](https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array)  (easy)
* O(n)的解法，注意原地操作

#### 0053.maximum-sum-subarray [最大子序和](https://leetcode-cn.com/problems/maximum-subarray)  (easy)
* less is more，O(n)的简洁解法，也可用分治

#### 0054.spiral-matrix [螺旋矩阵](https://leetcode-cn.com/problems/spiral-matrix) (medium)
* 《剑指offer》
* 简洁的写法
```c++
vector<int> spiralOrder(vector<vector<int>>& matrix) {
        vector<int>ret;
        int m=matrix.size();
        if(!m)return ret;
        int n=matrix[0].size();
        int b=0,t=m-1,l=0,r=n-1;
        while(1){
            for(int j=l;j<=r;j++)ret.push_back(matrix[b][j]);
            if(++b>t)break;
            for(int i=b;i<=t;i++)ret.push_back(matrix[i][r]);
            if(--r<l)break;
            for(int j=r;j>=l;j--)ret.push_back(matrix[t][j]);
            if(--t<b)break;
            for(int i=t;i>=b;i--)ret.push_back(matrix[i][l]);
            if(++l>r)break;
        }
        return ret;
}
```

#### 0056.merge-intervals [合并区间](https://leetcode-cn.com/problems/merge-intervals)  (medium)
* 先sort再遍历
* 复习sort的cmp函数定义（这题不需要cmp函数）

```c++
static bool cmp1(vector<int> &a, vector<int> &b){
		return a[0] < b[0] || (a[0] == b[0] && a[1] < b[1]);
}
```

#### 0065.valid-number [有效数字](https://leetcode-cn.com/problems/valid-number) (hard)
* 《剑指offer》，书上的代码结构很简洁，值得学习
* 也可以用有限状态机来做

```c++
int pointer;
bool isNumber(string s) {
    if(s=="")return -1;
    scanSpace(s);
    bool numeric=scanInteger(s);
    if(s[pointer]=='.'){
        ++pointer;
        numeric=scanUnsignedInteger(s)||numeric;
        //用||因为整数、小数部分有一即可
    }
    if(s[pointer]=='e'||s[pointer]=='E'){
        ++pointer;
        numeric=numeric&&scanInteger(s);
    }
    scanSpace(s);
    return numeric&&s[pointer]=='\0';
}
```


#### 0072.edit-distance [编辑距离](https://leetcode-cn.com/problems/edit-distance)  (hard)
* 很漂亮的动态规划

<img src="https://www.zhihu.com/equation?tex=D[i][j]=\begin{cases}D[i-1][j-1]&A[i]=B[i]\\min(D[i-1][j-1],D[i-1][j],D[i][j-1])+1&A[i]!=B[i]\\\end{cases}\notag
" alt="D[i][j]=\begin{cases}D[i-1][j-1]&A[i]=B[i]\\min(D[i-1][j-1],D[i-1][j],D[i][j-1])+1&A[i]!=B[i]\\\end{cases}\notag
" class="ee_img tr_noresize" eeimg="1">

#### 0079.word-search [单词搜索](https://leetcode-cn.com/problems/word-search)  (medium)
* 经典回溯法

#### 0084.largest-rectangle-in-histogram [柱状图中最大的矩形](https://leetcode-cn.com/problems/largest-rectangle-in-histogram) (hard)
* 单调栈，[很好的文章](https://blog.csdn.net/lucky52529/article/details/89155694)

```c++
int largestRectangleArea(vector<int> &heights)
{
    stack<int> st;
    int top = 0;
    int maxarea = 0;
    heights.insert(heights.begin(), 0);
    heights.push_back(0);  //左右插0，利于边界条件
    for (int i = 0; i < heights.size(); i++)
    {
        top = i;
        while (!st.empty() && heights[i] < heights[st.top()])
        {
            top = st.top();
            st.pop();
            maxarea = max(maxarea, heights[top] * (i-1 - st.top()));
        }//求出栈处往左右延伸的最大矩形面积
        st.push(i);
    }
    return maxarea;
}
```
* 单调栈模版
```c++
stack<int> st;
//此处一般需要给数组最后添加结束标志符
for (遍历这个数组)
{
	if (栈空 || 栈顶元素大于等于当前比较元素)
	{
		入栈;
	}
	else
	{
		while (栈不为空 && 栈顶元素小于当前元素)
		{
			栈顶元素出栈;
			更新结果;
		}
		当前数据入栈;
	}
}
```

#### 0088.merge-sorted-array [合并两个有序数组](https://leetcode-cn.com/problems/merge-sorted-array)  (easy)
* 注意原地操作

#### 0101.symmetric-tree [对称二叉树](https://leetcode-cn.com/problems/symmetric-tree)  (easy)
* 递归
```c++
bool isSymmetric(TreeNode* root) {
    if(!root)return 1;
    else return isSymmetric1(root->left,root->right);
}
bool isSymmetric1(TreeNode* a,TreeNode* b) {
    if(!(a||b))return 1;
    else if(!(a&&b))return 0;
    else return a->val==b->val&&isSymmetric1(a->left,b->right)&&isSymmetric1(a->right,b->left);
}
```

#### 0102.binary-tree-level-order-traversal [二叉树的层序遍历](https://leetcode-cn.com/problems/binary-tree-level-order-traversal)  (medium)
* 《剑指offer》第32-II题
* 队列，设变量curNum和nextNum分别保存本层和下层的数的个数
* 析构vector：`vector<int>().swap(num);`

#### 0103.binary-tree-zigzag-level-order-traversal [二叉树的锯齿形层次遍历](https://leetcode-cn.com/problems/binary-tree-zigzag-level-order-traversal)  (medium)
* 《剑指offer》第32-III题
* 在0102的基础上保存层数的奇偶性

#### 0104.maximum-depth-of-binary-tree [二叉树的最大深度](https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/) (easy)
* 方法一：递归
* 方法二：BFS，queue
* 方法三：DFS，stack，[利用c++的pair](https://blog.csdn.net/sevenjoin/article/details/81937695)(https://blog.csdn.net/sevenjoin/article/details/81937695)，或者python的tuple

#### 0105. construct-binary-tree-from-preorder-and-inorder-traversal [从前序与中序遍历序列构造二叉树](https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/) (medium)
* 《剑指offer》第7题

#### 0121. best-time-to-buy-and-sell-stock [买卖股票的最佳时机](https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/) (easy)
* O(n)遍历，记录之前的数组最小值

#### 0122. best-time-to-buy-and-sell-stock-ii [买卖股票的最佳时机 II](https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-ii/) (easy)


#### 0121. best-time-to-buy-and-sell-stock-iii [买卖股票的最佳时机 III](https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-iii/) (hard)
* [超巧妙的方法](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii/discuss/404387/Intuitive-Python-O(n)-Time-and-O(1)-Space)，本质上是贪心的思想，先记录maxp的位置，一定会取到股票的最大最小值high、low处，再做处理

```python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        def max_p(ps):
            if not ps or len(ps) == 1:
                return 0, 0, 0
            very_low = 0
            low = 0
            high = 0
            profit = 0

            for i, p in enumerate(ps):
                if p < ps[low]:
                    low = i
                elif p - ps[low] > profit:
                    high = i
                    very_low = low
                    profit = p - ps[low]
                    
            return very_low, high, profit
        
        low, high, profit = max_p(prices)
        _, _, profit_right = max_p(prices[0:low])
        _, _, profit_left = max_p(prices[high+1:])
        _, _, profit_middle = max_p(prices[low:high+1][::-1])
        
        return profit + max(profit_left, profit_middle, profit_right)
```



#### 0125.valid-palindrome [验证回文串](https://leetcode-cn.com/problems/valid-palindrome) (easy)

``` python
def isPalindrome(self, s: str) -> bool:
		s = ''.join(i for i in s if i.isalnum()).lower()
		return s == s[::-1]
```

#### 0136.single-number [只出现一次的数字](https://leetcode-cn.com/problems/single-number) (easy)

* 位运算，xor性质

#### 0137.single-number-II [只出现一次的数字 II](https://leetcode-cn.com/problems/single-number-ii) (medium)

* 非常巧妙的方法，多设一个数记录状态，位运算与有限状态机的结合，本质上，位运算的意义在于将n位信息转化为O(1)

```python
def singleNumber(self, nums: List[int]) -> int:
    seen_once = seen_twice = 0
    for num in nums:
        # first appearance: 
        # add num to seen_once, don't add to seen_twice because of presence in seen_once

        # second appearance: 
        # remove num from seen_once, add num to seen_twice

        # third appearance: 
        # don't add to seen_once because of presence in seen_twice, remove num from seen_twice
        
        seen_once = ~seen_twice & (seen_once ^ num)
        seen_twice = ~seen_once & (seen_twice ^ num)
    return seen_once

```

#### 0145.binary-tree-postorder-traversal [二叉树的后序遍历](https://leetcode-cn.com/problems/binary-tree-postorder-traversal) (hard)

两种方法：

* 方法一：教科书，先一路向左，用tag记录节点的右子树是否遍历

```c++
struct WTreeNode{TreeNode* TNode;bool tag;};
vector<int> postorderTraversal(TreeNode* root) {
    vector<int> ret;
    stack<WTreeNode*>s;
    TreeNode* p=root;
    if(root==NULL) return ret;
    WTreeNode* l;
    while(!s.empty()||p){
        if (p!=NULL){ //左子树不断入栈
            l=new WTreeNode; 
            l->TNode=p;l->tag=0;
            s.push(l);
            p=p->left;
        }
        else{
            l=s.top();
            s.pop();
            if(l->tag==1){
                ret.push_back(l->TNode->val);
            }
            else{   //右子树没输出
                l->tag=1;
                s.push(l);
                p=l->TNode->right;
            }
        }  
    }
    return ret;
}
```

*引申：二叉树非递归遍历的模版

```c++
while(!s.empty()||p){
		if (p!=NULL){
		}
		else{
		}
}
```

* 方法二：后序遍历是左右根，倒过来是根右左，相当于左右遍历顺序相反的DFS，用栈即可，得到结果再reverse

```c++
vector<int> postorderTraversal1(TreeNode* root) {
    vector<int> ret;
    stack<TreeNode*>s;
    vector<int>invert;
    s.push(root);
    while(!s.empty()){
        TreeNode *p=s.top();s.pop();
        if(p!=NULL){
            invert.push_back(p->val);
            s.push(p->left);
            s.push(p->right);
        }
    }
    reverse(invert.begin(),invert.end());
    return invert;
}
```

#### 0146.lru-cache [LRU缓存机制](https://leetcode-cn.com/problems/lru-cache) (hard)
* 双向链表+Map，自己实现双向链表可以高效实现move to head操作，也可以用STL的list

#### 0153.find-minimum-in-rotated-sorted-array [寻找旋转排序数组中的最小值](https://leetcode-cn.com/problems/find-minimum-in-rotated-sorted-array) (medium)
* 二分法，注意相等的情况

#### 0154.find-minimum-in-rotated-sorted-array-ii [寻找旋转排序数组中的最小值 II](https://leetcode-cn.com/problems/find-minimum-in-rotated-sorted-array-ii) (hard)
* 如果有重复数字，则难以判断mid是在左边还是右边，r-=1是解决这一问题的关键代码
```c++
int findMin(vector<int>& numbers) {
    //if(numbers.size()==0)return -1;
    int l=0,r=numbers.size()-1;
    int mid;
    while(l<r){
        if(r-l==1)
            return (numbers[l]<=numbers[r])?numbers[l]:numbers[r];
        mid=(l+r)/2;
        if(numbers[mid]>numbers[r]) l=mid;
        else if(numbers[mid]<numbers[l])r=mid;
        else
            r-=1;
            //return minArraySeq(numbers,l,r);
    }
    return 1;
}
```

#### 0155.min-stack [最小栈](https://leetcode-cn.com/problems/min-stack) (easy)

* 用另一个栈记录min的变化值

#### 0161.one-edit-distance [相隔为 1 的编辑距离](https://leetcode-cn.com/problems/one-edit-distance) (medium)
* 遍历较短的数字，直到遇到第一个和长数组对应位置不等的元素，再做判断处理

#### 0167.two-sum-ii-input-array-is-sorted [两数之和 II - 输入有序数组](https://leetcode-cn.com/problems/two-sum-ii-input-array-is-sorted) (easy)

<img src="https://www.zhihu.com/equation?tex=O(log_{2}N)" alt="O(log_{2}N)" class="ee_img tr_noresize" eeimg="1">

#### 0169. majority-element [多数元素](https://leetcode-cn.com/problems/majority-element) (easy)

* 方法一：hashmap

* 方法二：随机算法，先取再**验证**

* 方法三：[Boyer-Moore Voting Algorithm](https://zhuanlan.zhihu.com/p/85474828)：核心是利用这个数据的前缀特性，用军队打仗理解；每个非众数都会和一个数配对 

```c++
int majorityElement(vector<int> nums) {
    int solider = nums[0];
    int count=0;
    for(int i=0;i<nums.length();i++){
        if(nums[i]==solider){       //队伍增加了同胞
            count++;
        }
        else{       //没人去抵抗了
            if(count==0){
                solider=nums[i];
                count++;
            }else {
                count--;        //抓住一个人
            }  
        }
    }
    return solider;   
}
```



0170.two sum III - Data structure design

0172.Factorial Trailing Zeroes

n/5+n/5^2+n/5^3+… 递归即可

0190.Reverse Bits

细节：

1）注意定义uint32_t

2）左移不要越界

0191.Number of 1 bits

注意优先级，位运算优先级很低

0198.House Robber

动态规划

0203.Remove Linked List Elements

注意：

1）sentinel node，简化操作       在LRU cache也有应用

2）C++，注意delete元素

0206.Remove Linked List

0215.Kth largest element in an array

方法1:排序

方法2:Heap，保证size不大于k

方法3:快排变体，quick select   https://www.cnblogs.com/shawshawwan/p/9220818.html

0217.Contains Duplicate

可以预处理先sort

0219.Contains Duplicate II

是否有邻近的重复

用HashMap

  有一种方法，用了JAVA的treeset: self-balancing Binary Search Tree (BST)

0220.Contains Duplicate III

1)multiset C++ 平衡二叉树     

https://blog.csdn.net/sodacoco/article/details/84798621

  lower_bound: https://www.cnblogs.com/tocy/p/STL_lower_bound_intro.html

2）巧妙的方法，注意到数据结构特点，没有邻近数，因此可以用bucket数据结构

  桶排序     =>基数排序 https://blog.csdn.net/qq_41900081/article/details/86831408

0226.Invert Binary Tree

0229.Majority Element II

很巧妙的方法 https://leetcode.com/problems/majority-element-ii/discuss/466876/Python-O(N)-time-O(1)-Space-Explanation-in-Comments 

0240.Search a 2D Matrix II

同剑指offer面试题4

0653.Two Sum IV - Input is a BST



1209.remove-all-adjacent-duplicates-in-string-ii

利用pair和栈