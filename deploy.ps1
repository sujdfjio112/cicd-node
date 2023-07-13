
# 测试连接
Test-NetConnection -ComputerName $env:SERVER_IP -Port 3389

Write-Host "SERVER_IP = `"`"$env:SERVER_IP`"`"" -NoNewline
Write-Host "USERNAME = `"`"$env:USERNAME`"`"" -NoNewline
Write-Host "PASSWORD = `"`"$env:PASSWORD`"`"" -NoNewline

# # 指定要创建的文件路径和内容
# $FilePath = "C:\temp\test.txt"
# $FileContent = "Hello, World!"

# # 在远程服务器上创建文件并设置内容
# Invoke-Command -ComputerName $ComputerName -Credential $Credential -ScriptBlock {
#     Set-Content -Path $using:FilePath -Value $using:FileContent
# }

# # 切换到应用程序目录
# Invoke-Command -Session $session -ScriptBlock {
#     Set-Location C:\inetpub\wwwroot\myapp
# }

# # 从 Git 仓库中拉取最新代码
# Invoke-Command -Session $session -ScriptBlock {
#     & git pull origin master
# }

# # 安装必要的依赖项
# Invoke-Command -Session $session -ScriptBlock {
#     # Install dependencies
# }

# # 启动应用程序
# Invoke-Command -Session $session -ScriptBlock {
#     # Start application
# }

# # 关闭远程会话
# Remove-PSSession $session