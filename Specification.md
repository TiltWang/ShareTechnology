#规范文档
###目录
* 一 格式与换行
* 二 命名
* 三 Objective-C下的cocoa编码规范
* 四 注释要求
* 五 格式化
* 六 UI整理
* 七 参考文档


#序

此文档根据apple，google以及行业中比较知名的OC编码规范整理归纳而成，旨在为大家的iOS开发规范提供一份简单，统一的执行标准。
##一. 格式与换行

1.1 使用Xcode默认的设置使用4个空格来缩进。

在 Xcode > Preferences > Text Editing 将 Tab 和自动缩进都设置为 4 个空格。
1.2 方法长度不操作100行，建议不超过80行，如果方法太长可以考虑提 取其中的一部分。

1.3 方法-和方法+和返回值前面的左括号间隔一个空格，方法参数直接间隔一个空格。

1.4 条件语句的格式采用苹果推荐的代码缩进方式。

推荐的写法
```
BOOL isOk = YES;
if (isOk) {
    //...
} else {
    //...   
}
```
##二. 命名

2.1 命名统一使用驼峰命名法；只采纳有广为人知含义的缩写，比如info、msg、UI、HTTP这类。自造的缩写不被认可。总体的命名原则是清晰和一致，避免歧义。

2.2 类名需要结合项目名称来命名，确保整个项目中的自定义类的名称开头是统一的，同样要确保类名需要大写字母开头。

2.3 类名命名需结合功能或者模块，并且尾部要带上该类的类型，比如UIViewController的子类命名为JasonIndexViewController。

2.4 方法命名小写字母开头（方法以大写缩略词开始的除外），文件夹首字母大写开头。不要使用下划线开头作为方法的前缀。

2.5 定义类的变量，不需要暴露的变量均放在实现文件里定义，同时视图类变量，在类扩展下定义成属性。数据类的变量定义在@implementation下的大括号内。同时注意：局部变量不应该包含下划线。

2.6 采用US(美式)英语,不使UK(英式)英语或汉字拼音.
```
US: UIColor *myColor =[UIColor blueColor];
UK: UIColor *myColour =[UIColor blueColor];
拼音: UIColor *wodeYanSe =[UIColor blueColor];
```
####other
* 1.常量的命名 
在前面加上小写字母k作为标记.其余遵循小驼峰命名法(第一个单词全部小写,后面单词首字母大写).

```
NSTimeInterval kAnimationDuration = 0.3;
```
* 2.宏的命名 
以大写字母作为前缀,后面遵循大驼峰命名法.

```
#define KKScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define KKAppVersion @"appVersion"
```
* 3.枚举的命名 
遵循Objective-C内部框架定义方式. 
Enum中枚举内容的命名需要以该Enum类型名称开头.

```
typedef NS_ENUM(NSInteger, FulowersMoveDestination)
{
    FulowersMoveDestinationTop,
    FulowersMoveDestinationBottom,
    FulowersMoveDestinationLeft,
    FulowersMoveDestinationRight,
};
```
* 4.类的命名  
整体采用大驼峰式命名(每个单词的首字母大写). 
类前缀:采用开发者姓名的首字母大写. 
类后缀:采用对应类的全称.

```
NavigationController  导航控制器: TWNavigationController
ViewController        主页视图控制器: TWHomeViewController
TableViewController   表格控制器: TWTableViewController
TabBarController      标签控制器: TWTabBarController
```
* 5.方法的命名 
当方法参数在三个以及三个以上,换行保持对齐(冒号对齐,冒号前是参数变量,冒号后是参数值). 
方法声明:

```
+ (instancetype)initWithPersonName:(NSString *)name
                           withAge:(int)age
                           withSex:(NSString *)sex
                        withHeight:(float)height 
                        withWeight:(float)weight;
```
方法调用:避免使用冒号对齐的方式. 
* 6.属性和对象的命名 
采用修饰+类型的方式命名,BOOL类型添加is前缀,单词遵循小驼峰命名法.声明属性时,小括号中的顺序依次是:nonatomic,readonly,strong.

```
@property (nonatomic, assign) BOOL isLogin;
@property (nonatomic, weak) UITextField *loginNameTextField;
@property (nonatomic, copy) NSString *studentClientName;
@property (nonatomic, weak) UILabel *loginTipLabel;
@property (nonatomic, weak) UIButton *loginButton;
```
##三. Objective-C下的cocoa编码规范

3.1 使用#pragma mark 来分类方法，参考以下结构
```
#pragma mark – Life Cycle

#pragma mark - Events

#pragma mark – Private Methods

#pragma mark - UITextFieldDelegate

#pragma mark - UITableViewDataSource

#pragma mark - UITableViewDelegate

#pragma mark - Custom Delegates

#pragma mark – Getters and Setters 
```

3.2 重载系统方法的时候，如无特殊情况均需要先调用super的方法。

3.3 属性必须指定其类型，比如(nonatomic,strong)

3.4 使用#import引入oc/oc++文件，使用#include引入c/c++文件

3.5 尽量减少公开的api接口数量。

3.6 枚举的定义使用如下的方式

下面是系统的 UISearchBarStyle 的枚举定义的方式
```
typedef NS_ENUM(NSUInteger, UISearchBarStyle) {
    UISearchBarStyleDefault,    // currently UISearchBarStyleProminent
    UISearchBarStyleProminent,  // used my Mail, Messages and Contacts
    UISearchBarSty****leMinimal     // used by Calendar, Notes and Music
}
```
##四 注释要求
注释是为了解释说明,方法或变量等命名规范合理,清楚易懂,可以不添加注释,含有复杂逻辑的代码必须添加注释.注释需要实时更新,跟随代码的变动进行更改或者删除. 
4.1 新版Xcode自带有添加注释的功能

单行注释：在方法的地方按 Command+/
标注的功能，快捷键是Command + Option + /
需要在方法名的上面（空白）的地方按 Command + Option + / 才管用
4.2 在新建一个类的时候，需要在头文件中添加注释，来表明这个类的作用。

4.3 在创建接口类的时候，同样需要在头文件添加注释，来表明这个类的用处。

4.4 一些过于简单的注释尽量不要加。
* 例子：
1.公开类方法注释 
在.h文件中声明类方法,采用文档注释,要写明方法的具体作用,所有参数的含义以及返回的参数值.

```
/**
 创建person对象的类方法

 @param name 姓名
 @param age 年龄
 @param sex 性别
 @param height 身高
 @param weight 体重
 @return 返回person类对象
*/

+ (instancetype)initWithPersonName:(NSString *)name
                           withAge:(int)age
                           withSex:(NSString *)sex
                        withHeight:(float)height
                        withWeight:(float)weight;
```
2.私有的对象方法注释 
在.m文件中实现对象方法,采用文档注释, 要写明方法的具体作用, 如果有参数和返回值,需要添加所有参数的含义以及返回的参数值.
```
/**
 搭建tableview的UI
*/
- (void)setupTableViewUI
```
3.方法内部逻辑代码注释 
复杂逻辑代码在代码上方进行注释,注释方式采用双斜杠+单个空格+具体注释内容
```
- (void)viewDidLoad {
    [super ViewDidLoad];
    // 注释
    if(...) {
        ...
    } 
}
```
4.属性注释
```
/**
 登陆按钮
*/
@property (nonatomic, weak) UIButton *loginBtn;
```
5.标记 
在函数分组和使用#pragma mark - 给重要逻辑代码添加标记,方便阅读
```
#pragma mark - Lifecycle
- (instancetype)init 
- (void)dealloc 
- (void)viewDidLoad 
- (void)viewWillAppear:(BOOL)animated 
- (void)didReceiveMemoryWarning 

#pragma mark - IBActions
- (IBAction)submitData:(id)sender 

#pragma mark - Public
- (void)publicMethod 

#pragma mark - Private
- (void)privateMethod 

#pragma mark - Custom Protocol
- (void)tabbarBottomView:(TWTabbarBottomView *)tabbarBottomView didSelectIndex:(NSUInteger)index didSelectBtn:(BYBottomButton *)selectBtn

#pragma mark - UITextFieldDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView;
- (void)textViewDidEndEditing:(UITextView *)textView;

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

#pragma mark - NSObject
- (NSString *)description 
```
6.打印 
关于NSLog,在项目或者SDK完成最终版本时,需要去掉打印的注释(可以使用pch预编译文件来禁止NSLog打印)

##五 格式化

5.1 if和case语句

不论if或者else下有一个还是多个语句，都必须带上大括号。同样case语句也是如此。
推荐写法
```
if (!error) {
  return success;
}
```
不允许的写法
```
if (!error)
  return success;
```
或  
```
if (!error) return success;
```
5.2 布尔值

推荐的写法：
```
if (someObject) {
    //...
}
if (![anotherObject boolValue]) {
    //...
}
```
5.3 三元操作符

当需要提高代码的清晰性和简洁性时，三元操作符?:才会使用。
推荐写法
```
NSInteger value = 5;
result = (value != 0) ? x : y;

BOOL isHorizontal = YES;
result = isHorizontal ? x : y;
```
不推荐的写法
```
result = a > b ? x = c > d ? c : d : y;
```
5.4 Init方法

Init方法应该遵循Apple生成代码模板的命名规则。返回类型应该使用instancetype而不是id
```
- (instancetype)init {
  self = [super init];
  if (self) {
    // ...
  }
  return self;
}
```
5.5 类构造方法

当类构造方法被使用时，它应该返回类型是instancetype而不是id。这样确保编译器正确地推断结果类型。
```
@interface Airplane
+ (instancetype)airplaneWithType:(RWTAirplaneType)type;
@end
```
5.6 CGRect函数

推荐用法
```
CGRect frame = self.view.frame;

CGFloat x = CGRectGetMinX(frame);
CGFloat y = CGRectGetMinY(frame);
CGFloat width = CGRectGetWidth(frame);
CGFloat height = CGRectGetHeight(frame);
CGRect frame = CGRectMake(0.0, 0.0, width, height);
```
不推荐的用法
```
CGRect frame = self.view.frame;

CGFloat x = frame.origin.x;
CGFloat y = frame.origin.y;
CGFloat width = frame.size.width;
CGFloat height = frame.size.height;
CGRect frame = (CGRect){ .origin = CGPointZero, .size = frame.size };
```

5.7 黄金路径

当使用条件语句编码时，左手边的代码应该是"golden" 或 "happy"路径。也就是不要嵌套if语句，多个返回语句也是OK。

推荐写法
```
- (void)someMethod {
  if (![someOther boolValue]) {
    return;
  }

  //Do something important
}
```
不推荐的写法
```
- (void)someMethod {
  if ([someOther boolValue]) {
    //Do something important
  }
}
```
5.8 单例模式

单例对象应该使用线程安全模式来创建共享实例。
```
+ (instancetype)sharedInstance {
  static id sharedInstance = nil;

  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[self alloc] init];
  });

  return sharedInstance;
}
```
5.9 布局中的空格

每个方法或者功能块之间为了结构清晰，应当有且只有一行空格。
```
@interface SomeClass:NSObject

@property (noatomic, strong) UIView *aView

- (void)someMethod;

@end

@implementation SomeClass

- (void)setAView:(NSInteger )aview {

}

- (void)someMethod {

}
@end
```
5.10 Getters and Setters放在最底部

控制器可能会有非常多的view属性和其他属性,如果所有的getters and setters放在前面，就会导致在implementation代码顶部有大量的初始化代码，这就导致主要的逻辑代码挪到后面去了，其他人阅读代码是不太方便的。

5.11赋值 
在”=”号左右两边各间隔一个空格.
```
static const int count = 0; 
```
5.12
类方法或对象方法 
方法的”+/-”号和左侧小括号间隔一个空格
```
- (void)viewDidLoad {

}
```
5.13.属性声明 
property和左侧小括号间隔一个空格,逗号和下一个属性修饰符间隔一个空格,右侧小括号和属性类型间隔一个空格,属性类型和属性变量间隔一个空格.声明字符串类型时,NSString和号间隔一个空格,号和属性变量相连,应是NSString *studentClientName,不是NSString* studentClientName,也不是NSString * studentClientName.
```
@property (nonatomic, assign, readwrite) BOOL isLogin;
@property (nonatomic, copy, readwrite) NSString *studentClientName;
```
5.14.for循环 
for和左侧小括号间隔一个空格, i和”<=”间隔一个空格, ”<=”和”3”间隔一个空格, ”3”后面紧跟着封号 ,封号和i间隔一个空格
```
for (int i = 0; i <= 3; i++) {
    // 语句
}
```
5.15.条件语句 
关于大括号,任何需要大括号的都不能省略. 
采用
```
if (isLogin) {   
    return success;
}
```
不是
```
if (isLogin)
    return success;
```
也不是
```
if (isLogin) return success;
```
5.16.case语句 
当一个case语句包含多行代码时,大括号应该加上.如case 2所示.
```
switch (condition) {
    case 1:  
        // ...
        break;  
    case 2: 
    {
        // ...  
        // Multi-line example using braces  
        break;  
    }  
    case 3:   
        // ...  
        break;  
    default:   
        // ...  
        break;  
}
```
当在switch使用枚举类型时，default是不需要的.
```
switch (FulowersMoveDestination) {
    case FulowersMoveDestinationTop:  
        // ...  
        break;  
    case FulowersMoveDestinationBottom:  
        // ...  
        break;  
    case FulowersMoveDestinationLeft:  
        // ...  
        break;  
    case FulowersMoveDestinationRight:  
        // ...  
        break;  
}
```

统一采用shared+类名作为单例类的方法名
```
@implementation TWNetworkTool
+ (instancetype)sharedNetworkTool {
    static TWNetworkTool *instance;
    {    
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{        
            instance = [[TWNetworkTool alloc]init];
        });
    }    
    return instance;
}
@end
```
##六 UI整理
搭建UI时,使用setup作为方法名前缀,将相应UI布局放在对应方法中
```
- (void)setupUI
- (void)setupTableViewUI
- (void)setupNavigationUI
- (void)setupCollectionViewUI
```
##七 参考文档

未尽事项可参考以下连接
```
https://www.jianshu.com/p/86b9fab84b53
http://ios.jobbole.com/81932/
https://github.com/NYTimes/objective-c-style-guide
https://github.com/raywenderlich/objective-c-style-guide#language
https://blog.csdn.net/cherish_joy/article/details/73788007?utm_source=copy
https://github.com/NYTimes/objective-c-style-guide
```

