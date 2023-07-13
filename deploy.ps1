
# 测试连接
Test-NetConnection -ComputerName $env:SERVER_IP -Port 3389

$ServerIpAddress = $env:SERVER_IP
$Username = $env:USERNAME
$Password = ConvertTo-SecureString $env:PASSWORD -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential($Username, $Password)

# Add remote server to TrustedHosts list
New-Item -Path WSMan:\localhost\Client\TrustedHosts -Type Container
Set-Item WSMan:\localhost\Client\TrustedHosts -Value $ServerIpAddress -Concatenate  

# Connect to remote server using PowerShell Remoting
Enter-PSSession -ComputerName $ServerIpAddress -Credential $

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