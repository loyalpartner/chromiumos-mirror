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
curl https://chromium.googlesource.com/?format=TEXT -o projects
./cros_mirror -r /external/gerrit/git
```

### 配置

```bash
GERRIT_ETC_DIR=/external/gerrit/etc/

# oauth2
git config --file $GERRIT_ETC_DIR/gerrit.config auth.type OAUTH

# domain
git config --file $GERRIT_ETC_DIR/gitiles.config baseUrl https://gerrit.modousos.com/plugins/gitiles
git config --file $GERRIT_ETC_DIR/gitiles.config cloneUrlType http
git config --file $GERRIT_ETC_DIR/gitiles.config gitHttpUrl https://gerrit.modousos.com
git config --file $GERRIT_ETC_DIR/gerrit.config gitHttpUrl https://review.modousos.com

```
