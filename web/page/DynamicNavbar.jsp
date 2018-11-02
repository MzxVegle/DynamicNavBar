<%--
  Created by IntelliJ IDEA.
  User: Vegle
  Date: 2018/11/2
  Time: 18:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>动态导航栏</title>
      <script src="../js/jquery-3.3.1.min.js"></script>
      <link href="../css/bootstrap.css" rel="stylesheet" type="text/css">
      <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">
      <script src="../js/popper.min.js"></script>
      <script src="../js/bootstrap.js"></script>
      <script src="../js/jquery-ui.min.js"></script>
      <script src="../js/Msgbox.js"></script>

      <script src="/js/CodeRegex.js"></script>
  </head>
  <script>
    $(document).ready(function () {
        generateNavBarTag();
    });
      function generateNavBarTag() {
          $.post("/loadCmsNavBar","",function (navbarTag) {
              var navBar =$(".navbar-nav");

              for(var index in navbarTag){
                  var node = navbarTag[index];
                  var nodeChild = node.cmsNavBarList;
                  //  创建一个列表并设置列表类
                  var li = document.createElement("li");
                  var navLink = document.createElement("a");
                  li.appendChild(navLink);
                  navBar.append(li);
                  li.className = "nav-item";
                  navLink.className = "nav-link";
                  navLink.href = "#";
                  //当存在子节点的时候需要做的事情
                  if(nodeChild.length!=0){
                      //  当子节点存在时候，需要新增一个下拉菜单的标签
                      li.classList.add("dropdown");
                      navLink.classList.add("dropdown-toggle") ;
                      navLink.innerHTML = node.nodeName+" <span class='caret'>";
                      navLink.setAttribute("data-toggle","dropdown");
                      //创建下拉列表
                      var dropdownMenu = document.createElement("div");
                      dropdownMenu.className = "dropdown-menu";
                      // 将下拉菜单放置到li中
                      li.appendChild(dropdownMenu);
                      for(var child in nodeChild){
                          var dropItem = document.createElement("a");
                          dropItem.className="dropdown-item";
                          dropItem.href = "#";
                          dropItem.innerHTML = nodeChild[child].nodeName;

                          dropItem.setAttribute("url",nodeChild[child].url);
                          dropItem.setAttribute("name","dropItem");
                          dropdownMenu.appendChild(dropItem);


                          // $("div").on("click","#dropItem-"+child,function (e) {
                          //     e.stopPropagation();
                          //     var index = $(this).attr("index");
                          //     alert(index);
                          //     var txt = $(this).text();
                          //     console.log(nodeChild[index]);
                          //     var url = nodeChild[index].url;
                          //     alert(url);
                          //     $("#panel").load("/page","page="+url);
                          // });
                          if(child<(nodeChild.length-1)){
                              //  在最后一个之前添加分隔符
                              dropdownMenu.innerHTML+="<div class='dropdown-divider'></div>"
                          }
                      }

                  }
                  else
                  {
                      //  当不存在子节点需要做的事
                      navLink.innerHTML = node.nodeName;
                      navLink.classList.add("noneList");
                      navLink.setAttribute("url",node.url);
                      navLink.setAttribute("name","noneList");
                      var noneList = document.getElementsByName("noneList");
                      for(var n = 0;n<noneList.length;n++){
                          noneList[n].onclick = function () {
                              $("#panel").load("/page","page="+this.getAttribute("url"))
                          }
                      }

                  }

              }
              var dropItems = document.getElementsByName("dropItem");
              for(var i=0;i<dropItems.length;i++){
                  dropItems[i].onclick = function () {
                      $("#panel").load("/page","page="+this.getAttribute("url"))

                  }
              }
              console.log(navbarTag)
          },"json");
      }
  </script>
  <body>
  <nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="border-radius:0px;">
    <div class="container">
      <div class="navbar-brand"><label >个人博客后台管理系统</label></div>

      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#target-menu">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="target-menu">
        <ul class="navbar-nav">


        </ul>
        <ul class="ml-auto" style="margin: 0px">

          <form class="form-inline" style="margin-bottom: 0; ">
            <label class="navbar-text" id="userlabel" style="margin-right:5px"></label>
            <button type="button" class="btn btn-danger" id="logout" >注销</button>
          </form>
        </ul>
      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>
  </body>
</html>
