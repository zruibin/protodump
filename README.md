<!-- 
    README.md
    Created by Ruibin.Chow on 2023/03/05.
    Copyright (c) 2023年 Ruibin.Chow All rights reserved.
    Suggest: using Typora for editing and export
 -->

> Copy From [dummylua-tutorial/tools/protodump](https://github.com/Manistein/dummylua-tutorial)

## modify

**fix build.sh for macosx and linux.**

## How to usage

```lua
-- 如果是首次使用，那么需要先编译Lua源码，生成lua和luac这两个可执行文件
-- 如果protodump目录下已经有这两个文件，那么不需要每次使用都重新编译
./build.sh

-- 将Lua源码转化为易于分析的信息
./dump.sh path_to_script
```
