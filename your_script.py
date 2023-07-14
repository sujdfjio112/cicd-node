import winrm
import os

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


# 指定要拉取代码的目录
username = 'Administrator'
git_dir = 'C:\\Users\\' + username + '\\Desktop\\ccc\\cicd-node'

# 检查目录是否存在
if not os.path.exists(git_dir):
    print(f'Error: Directory not found: {git_dir}')
    exit(1)

# 更改当前工作目录
os.chdir(git_dir)

# 执行 Git pull 命令，并捕获输出
output = subprocess.check_output('git pull', shell=True)

# 输出 Git pull 命令的输出
print(output.decode('utf-8'))