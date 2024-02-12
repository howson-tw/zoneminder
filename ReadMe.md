# 常用指令
```cmd
sudo nautilus
```
```cmd
sudo chown -R www-data:www-data classic_modify_20240110601
```
```cmd
sudo chmod -R 755 *
```

# 安裝方式
- How to Install ZoneMinder on Ubuntu 22.04 | 20.04 LTS
  - <https://linux.how2shout.com/how-to-install-zoneminder-on-ubuntu-22-04-20-04-lts/>
  - ```
    date.timezone = Asia/Taipei
    ```

# 其他zonemider問題
- Montage will only display 6 of 8 cameras
  - <https://forums.zoneminder.com/viewtopic.php?t=32050>
- Multi-Port, Storage Areas and more
  - <https://medium.com/zmninja/multi-port-storage-areas-and-more-d5836a336c93>
- stream error: socket_sendto PROBLEM
  - <https://forums.zoneminder.com/viewtopic.php?t=25167>
- Socket does not exist #4
  - <https://github.com/linuxserver/docker-zoneminder/issues/4>
- ZoneMinder 1.36.33 - Montage Review problem
  - <https://forums.zoneminder.com/viewtopic.php?t=32605>
  - php.ini位置
    - /etc/php/*/apache2/php.ini

# SSL
- [教學][Ubuntu 架站] 為 Ubuntu 22.04 上的 Apache 配置 Let’s Encrypt SSL 憑證
  - <https://ui-code.com/archives/645>

# phpMyAdmin
- 安裝
  - [教學][Ubuntu 架站] 在 Ubuntu 22.04 上安裝 phpMyAdmin（Nginx）
    - <https://ui-code.com/archives/689>
- 使用者新增、授權、撤銷授權
  - <https://zack7498.gitbooks.io/mysql/content/chapter1/2shi-yong-zhe-xin-zeng-3001-shou-quan-3001-che-xiao-shou-quan.html>
  - phpMyAdmin不允許使用root登入，故要用上述方法新增使用者於phpMyAdmin使用。

# Cockpit Console
- Ubuntu 20.04 安裝 Cockpit Console
  - <https://www.ltsplus.com/linux/ubuntu-20-04-install-cockpit-console>

# 其他
- VirtualBox 如何開機後自動啟動虛擬機【Windows排程設定教學】
  - <https://eheima.com/7512/virtualbox-autostart>
- 您的Virtualbox虛擬機是否停止工作？ 試試這個
  - <https://ubunlog.com/zh-TW/%E6%82%A8%E7%9A%84virtualbox%E8%99%9B%E6%93%AC%E6%A9%9F%E5%B7%B2%E5%81%9C%E6%AD%A2%E5%B7%A5%E4%BD%9C%EF%BC%8C%E8%AB%8B%E5%98%97%E8%A9%A6%E4%BB%A5%E4%B8%8B%E6%93%8D%E4%BD%9C/>
