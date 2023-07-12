
Write-Host "Server IP address: $env:SERVER_IP"
# 连接到远程服务器
$session = New-PSSession -ComputerName $env:SERVER_IP -Credential (Get-Credential)

# 切换到应用程序目录
Invoke-Command -Session $session -ScriptBlock {
    Set-Location C:\inetpub\wwwroot\myapp
}

# 从 Git 仓库中拉取最新代码
Invoke-Command -Session $session -ScriptBlock {
    & git pull origin master
}

# 安装必要的依赖项
Invoke-Command -Session $session -ScriptBlock {
    # Install dependencies
}

# 启动应用程序
Invoke-Command -Session $session -ScriptBlock {
    # Start application
}

# 关闭远程会话
Remove-PSSession $session