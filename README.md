# AAEye

这是一个监控iOS APP请求的库，仍在一步一步慢慢摸索和学习阶段，希望有问题可以直接提给我，大家一起探讨，我在工作之余，仍会继续完善AAEye.


## 功能

- [x] 检测手机型号.
- [x] 检测手机网络以及IP地址.
- [x] 监控网络, 包括请求和响应的所有信息.
- [ ] 提供一个沙盒文件浏览器可用于查看沙盒目录的文件.

## 特点

- [x] 方便: 一行代码接入
- [x] 自动: 零代码入侵
- [x] 安全: Release包可不打入一行代码

## 使用

在`AppDelegate`中用下面的代码导入进来:

然后在 `application:didFinishLaunchingWithOptions`初始化GodEye:

```ruby
#if defined (DEBUG)||defined(_DEBUG)
    [AAWatchEye share];
#endif
```



## 作者

email: adu.vikings@gmail.com

github: [adu](https://github.com/morrios)

## 感谢
感谢开源社区Github，它给了我很多思路和灵感。

## 开源协议
GodEye开源在 MIT 协议下，详细请查看 LICENSE 文件。






