class Solution {
    public int[] sortedSquares(int[] nums) {
        int left = 0, right = nums.length - 1;
        int[] result = new int[nums.length];
        //\u4ece\u540e\u5f80\u524d\u586b\u65b0\u7684\u7a7a\u6570\u7ec4
        int index = nums.length - 1;
        while (left <= right) {
            if (nums[left] * nums[left] > nums[right] * nums[right]) {
                //index\u6bcf\u6b21\u7528\u5b8c\u9700\u8981-1\uff0c\u76f8\u5f53\u4e8e\u65b0\u6570\u7ec4\u9700\u8981\u586b\u7684\u7a7a\u4f4d\u5f80\u524d\u79fb\u52a81\u4f4d
                result[index--] = nums[left] * nums[left];
                left++;
            } else {
                result[index--] = nums[right] * nums[right];
                right--;
            }
        }
        return result;
    }
}

