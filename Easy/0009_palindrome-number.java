class Solution {
    public boolean isPalindrome(int x) {
        if (x < 0){
            return false;
        }
        int temp = x;
        int y = 0;
        while (temp != 0){
            int last_num = temp % 10;
            y = 10 * y + last_num;
            temp /= 10;
        }
        return y == x;

        
    }
}

