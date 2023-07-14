import winrm
import os
import subprocess

# 从环境变量中获取 WinRM 连接信息
host = os.environ["WINRM_HOST"]
username = os.environ["WINRM_USERNAME"]
password = os.environ["WINRM_PASSWORD"]

# 创建 WinRM 会话对象
session = winrm.Session(host, auth=(username, password))

# # 在远程服务器上创建一个新的文本文件
# filename = "test.txt"
# content = "Hello, World!"
# command = f"New-Item -ItemType File -Path .\\{filename}; Set-Content -Path .\\{filename} -Value '{content}'"
# result = session.run_ps(command)

# # 打印命令执行结果
# print(result.std_out)
# print(result.std_err)

# # 在远程服务器上拉取最新的代码
# command = 'cd /d "C:\\Users\\Administrator\\Desktop\\ccc\\cicd-node" && git pull'
# result = session.run_cmd("powershell", ["-Command", command])

# # 打印命令执行结果
# print(result.std_out)
# print(result.std_err)


# 要跳转到的文件路径
path = "C:\Users\Administrator\Desktop\ccc\cicd-node"


# 构建 PowerShell 命令
powershell_command = f"cd '{path}'"

# 使用 run_ps 方法在远程服务器上执行 PowerShell 命令
result = session.run_ps(powershell_command)

# 检查命令执行结果
if result.status_code == 0:
    print("成功跳转到指定文件夹！")
else:
    print(f"跳转到指定文件夹失败：{result.std_err}")

