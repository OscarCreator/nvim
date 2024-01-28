return {
    {
        'hsanson/vim-android',
        ft = { "java", "kotlin", "xml" },
        config = function()
            vim.g.android_sdk_path = "/opt/android_sdk/platforms/android-33"
        end,
    },
}
