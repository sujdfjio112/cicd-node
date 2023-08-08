import winrm
import os

# 从环境变量中获取 WinRM 连接信息
host = os.environ["WINRM_HOST"]
username = os.environ["WINRM_USERNAME"]
password = os.environ["WINRM_PASSWORD"]

# 创建 WinRM 会话对象
session = winrm.Session(host, auth=(username, password))

# 要跳转到的文件路径
path = r'C:\Users\Administrator\Desktop\ccc\cicd-node'

# 构建 PowerShell 命令
powershell_command = f"cd '{path}'; git pull"

# 在远程服务器上执行 PowerShell 命令
result = session.run_cmd("powershell.exe", ["-Command", powershell_command])

# 检查命令执行结果
if result.status_code == 0:
    print('Yes!')
else:
    print('No!')