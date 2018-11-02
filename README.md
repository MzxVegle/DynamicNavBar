# 基于SSM动态导航栏
前端：Jquery+BootStrap+HTML  
后端：SpringMVC+Spring+Mybatis+MySql  
后端为MVC框架，页面的渲染主要在前端，前后端分离明确，目前只能动态到二级菜单，算法不太好的说。  
数据库用的是MySql，表只有一个，通过Mybatis的resultMap来实现自查询。灵活方便且省表，但是如果
内容多了起来估计效率也不会高，毕竟是一种类似于递归的方法。