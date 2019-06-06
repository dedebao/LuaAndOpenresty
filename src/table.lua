--[[
table的用法
Table 类型实现了一种抽象的“关联数组”。即可用作数组，也可以用作map。
lua中没有数组和map，都是用table这个类型
-- 初始化表
mytable = {}
-- 指定值
mytable[1]= "Lua"
mytable[2]= "Lua2"
mytalbe["k1"] = v1;
-- 移除引用
mytable = nil
-- lua 垃圾回收会释放内存
lua类似数组的table ，索引值从1开始，，而不是0
talbe   key可以为 number 或字符串，，也可以是其他类型
table 是内存地址 赋值给变量

]]
--数组
mytable={"a","b","hello","world"}
print(mytable[1],mytable[2],mytable[3],mytable[4]);
print("------------------")
--map
mytable1 = {key1 = "v1",k2="v2",k3="v3"}
print(mytable1["key1"],mytable1["k2"],mytable1["k3"]);
print("------------------")
--数组与map混合
mytable2 = {"a",key1 = "v1","b",k2="v2",k3="v3","hello","world"}
print(mytable2[1],mytable2["key1"],mytable2[2],mytable2["k2"],mytable2[3],mytable2[4]);