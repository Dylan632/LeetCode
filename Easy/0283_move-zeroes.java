class Solution {
    public void moveZeroes(int[] nums) {
        int slowIndex = 0;
        for (int fastIndex = 0; fastIndex < nums.length; fastIndex++) {
            if (nums[fastIndex] != 0) {
                nums[slowIndex] = nums[fastIndex];
                slowIndex++;
            }
        }
        for (int j = slowIndex; j < nums.length; j++) {
            nums[j] = 0;
        }
    }
}

