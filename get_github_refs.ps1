# get_github_refs.ps1

# Gọi API GitHub để lấy dữ liệu từ URL "https://api.github.com/repos/nguyen-phat-281100/demo-git2/git/refs"
$response = Invoke-RestMethod -Uri "https://api.github.com/repos/nguyen-phat-281100/demo-git2/git/refs"

# Trích xuất các từ cuối cùng của trường "ref" và loại trừ "master", "head", và "main"
$refs = $response | ForEach-Object { $_.ref -replace '.*/', '' } | Where-Object { $_ -notin @("master", "head", "main") }

# Chuyển đổi danh sách thành mảng JSON và in kết quả
$refsArray = $refs | ConvertTo-Json -Compress
Write-Output $refsArray
