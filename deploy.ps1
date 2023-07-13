$env:SERVER_IP = "115.159.102.152"
# 测试连接
Test-NetConnection -ComputerName 115.159.102.152 -Port 3389

Set-Item WSMan:\localhost\Client\TrustedHosts -Value "115.159.102.152" -Concatenate -Force

# 指定远程服务器的计算机名或 IP 地址
$ComputerName = $env:SERVER_IP

# 指定远程服务器的用户名和密码
$Username = $env.USERNAME
$Password = ConvertTo-SecureString $env.PASSWORD -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential($Username, $Password)

# 指定要创建的文件路径和内容
$FilePath = "C:\temp\test.txt"
$FileContent = "Hello, World!"

# 在远程服务器上创建文件并设置内容
Invoke-Command -ComputerName $ComputerName -Credential $Credential -ScriptBlock {
    Set-Content -Path $using:FilePath -Value $using:FileContent
}

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