# 测试连接
ping 115.159.102.152

# 连接到远程服务器，并添加目标计算机到TrustedHosts配置设置中
$session = New-PSSession -ComputerName $env:SERVER_IP -Credential (Get-Credential) -SessionOption (New-PSSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck)

# 添加目标计算机到TrustedHosts配置设置中
Invoke-Command -Session $session -ScriptBlock {
    Set-Item WSMan:\localhost\Client\TrustedHosts -Value $env:SERVER_IP -Force
}

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