# chromiumos gerrit 镜像


## 启动 gerrit

```
docker-compose -f docker-compose.gerrit.yaml up
```


## 镜像 chromiumos 仓库

### 初始化
```
./cros_mirror -r /external/gerrit/git -u https://git.chromium.org/git
```

### 同步
```
./cros_mirror -r /external/gerrit/git
```
