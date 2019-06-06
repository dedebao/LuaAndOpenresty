local function main()
  print("hello world")
end

--[[ 比较两个数的大小(普通写法)]]
local function getMax(num1,num2)

  if(num1>num2) then
    result=num1;
  else
    result=num2;
  end
  return result;
end

--[[ 比较两个数的大小(匿名写法)]]
local getMax2=function (num1,num2)

if(num1>num2) then
    result=num1;
  else
    result=num2;
  end
  return result;
end

--[[函数也可以作为参数传递]]
local function println(result)
  print("最终结果:",result);
end

local function getSum(num1,num2,functionPrintln)
    result=num1+num2;
    functionPrintln(result)
end


--[[lua的函数允许返回多个值]]
local function init()
  return "aa",456
end
local x,y=init()
print(x,y)

--main()
--print("结果:",getMax(1,2))
--print("结果:",getMax2(4,2))
--getSum(5,6,println)

--[[
lua运算符
+ 加法  
- 减法  
* 乘法  
/ 除法  
% 取余  
^ 乘幂  
- 负号

print(1 + 2)       -->打印 3
print(5 / 10)      -->打印 0.5。 这是Lua不同于c语言的
print(5.0 / 10)    -->打印 0.5。 浮点数相除的结果是浮点数
-- print(10 / 0)   -->注意除数不能为0，计算的结果会出错
print(2 ^ 10)      -->打印 1024。 求2的10次方

local num = 1357
print(num % 2)       -->打印 1
print((num % 2) == 1) -->打印 true。 判断num是否为奇数
print((num % 5) == 0)  -->打印 false。判断num是否能被5整数


二）关系运算符

==  等于，检测两个值是否相等，相等返回 true，否则返回 false 
~=  不等于，检测两个值是否相等，相等返回 false，否则返回 true  不想java !=,,~=
> 大于，如果左边的值大于右边的值，返回 true，否则返回 false  
< 小于，如果左边的值大于右边的值，返回 false，否则返回 true  
>=  大于等于，如果左边的值大于等于右边的值，返回 true，否则返回 false  
<=  小于等于， 如果左边的值小于等于右边的值，返回 true，否则返回 false

三）逻辑运算符
and 逻辑与操作符。(A and B) 若 A 为 假，则返回 A，否则返回 B
or  逻辑或操作符。(A or B) 若 A 为 真，则返回 A，否则返回 B
not 逻辑非操作符。与逻辑运算结果相反，如果条件为 true，逻辑非为 false。 永远只返回 true 或者 false

四）其他运算符
..  连接两个字符串 a..b ，其中 a 为 "Hello " ， b 为 "World", 输出结果为 "Hello World"。
# 一元运算符，返回字符串或表的长度。 #"Hello" 返回 5
很多字符串连接 我们如果采用..这个运算符 ，性能是很低
推荐使用 table 和 table.concat() 来进行很多字符串的拼接
]]


--[[
控制结构
1）单个 if 分支 型
if 条件 then
  --body  
end
条件为真 ，执行if中的body
2）两个分支 if-else 型
if 条件 then
  --条件为真 执行此body  
else
  --条件为假 执行此body
end
3）多个分支 if-elseif-else 型
if 条件一 then
  --条件为真 执行此body  
elseif  条件二  then
  .....
elseif  条件三  then
  .....
else
  --条件为假 执行此body
end

二）循环 - while 型控制结构
Lua 跟其他常见语言一样，提供了 while 控制结构，语法上也没有什么特别的。但是没有提供 do-while 型的控制结构，但是提供了功能相当的 repeat。
while 型控制结构语法如下，当表达式值为假（即 false 或 nil）时结束循环。也可以使用 break 语言提前跳出循环。
while 条件表达式 do
--body
end
continue继续执行，lua是没有这个概念
break 终端循环，lua是有的
值得一提的是，Lua 并没有像许多其他语言那样提供类似 continue 这样的控制语句用来立即进入下一个循环迭代（如果有的话）。
因此，我们需要仔细地安排循环体里的分支，以避免这样的需求。

三）循环 - repeat 控制结构
repeat  ---重复执行
    --body
until 条件       条件为真时就结束
1）until的条件表达式  为真 就结束
2）repeat until 控制结构 ，他至少会执行一遍
Lua 中的 repeat 控制结构类似于其他语言（如：C++ 语言）中的 do-while，但是控制方式是刚好相反的。简单点说，执行 repeat 循环体后，
直到 until 的条件为真时才结束，而其他语言（如：C++ 语言）的 do-while 则是当条件为假时就结束循环。
以下代码将会形成死循环：
x = 10
repeat
    print(x)
until false
该代码将导致死循环，因为until的条件一直为假，循环不会结束
除此之外，repeat 与其他语言的 do-while 基本是一样的。同样，Lua 中的 repeat 也可以在使用 break 退出。

四）for 控制结构
for 语句有两种形式：数字 for 和范型 for。
1）数字型 for 的语法如下：
for var = begin, finish, step do
    --body
end
关于数字 for 需要关注以下几点： 
1.var 从 begin 变化到 finish，每次变化都以 step 作为步长递增 var 
2.begin、finish、step 三个表达式只会在循环开始时执行一次 
3.第三个表达式 step 是可选的，默认为 1 
4.控制变量 var 的作用域仅在 for 循环内，需要在外面控制，则需将值赋给一个新的变量 5.循环过程中不要改变控制变量的值，那样会带来不可预知的影响
for i = 1, 5 do
  print(i)
end

2）for 泛型
对lua的table类型进行遍历
泛型 for 循环通过一个迭代器（iterator）函数来遍历所有值：
-- 打印数组a的所有值
local a = {"a", "b", "c", "d"}
for i, v in ipairs(a) do
  print("index:", i, " value:", v)
end
-- output:
index:  1  value: a
index:  2  value: b
index:  3  value: c
index:  4  value: d
Lua 的基础库提供了 ipairs，这是一个用于遍历数组的迭代器函数。在每次循环中，i 会被赋予一个索引值，
同时 v 被赋予一个对应于该索引的数组元素值。

下面是另一个类似的示例，演示了如何遍历一个 table 中所有的 key
-- 打印table t中所有的key
for k in pairs(t) do
    print(k)
end
pairs是可以把数组类型和哈希类型索引值，都会迭代出来

二）虚变量

当一个方法返回多个值时，有些返回值有时候用不到，要是声明很多变量来一一接收，显然不太合适（不是不能）。
Lua 提供了一个虚变量，以单个下划线（“_”）来命名，用它来丢弃不需要的数值，仅仅起到占位的作用。

local start, finish = string.find("hello", "he") --start 值为起始下标，finish
                                                 --值为结束下标
print ( start, finish )                          --输出 1   2

local start = string.find("hello", "he")      -- start值为起始下标
print ( start )                               -- 输出 1

local _,finish = string.find("hello", "he")   --采用虚变量（即下划线），接收起
                                              --始下标值，然后丢弃，finish接收
                                              --结束下标值
print ( finish )                              --输出 2

代码倒数第二行，定义了一个用 local 修饰的 虚变量（即 单个下划线）。使用这个虚变量接收 string.find() 第一个返回值，静默丢掉，这样就直接得到第二个返回值了。

虚变量不仅仅可以被用在返回值，还可以用在迭代等。

local t = {1, 3, 5}

print("all  data:")
for i,v in ipairs(t) do
    print(i,v)
end

print("")
print("part data:")
for _,v in ipairs(t) do
    print(v)
end

执行结果：
# luajit test.lua
all  data:
1   1
2   3
3   5

part data:
1
3
5



]]