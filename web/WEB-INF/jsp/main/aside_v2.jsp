<%--
  Created by IntelliJ IDEA.
  User: Gabriel Yoon
  Date: 2021-07-29
  Time: 오전 2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="sidebar" class="active fixed-top" style="z-index: 1040">
    <div class="sidebar-wrapper active">
        <div class="sidebar-header">
            <div class="d-flex justify-content-between">
                <div class="logo">
                    <a href="main.kgu">
                        <%--                        <img src="/img/logo/kgu_logo(500x300).png" alt="Logo" srcset="" style="height: auto">--%>
                        KGU
                    </a>
                </div>
                <div class="toggler">
                    <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                </div>
            </div>
        </div>


        <div class="sidebar-menu">
            <ul class="menu" id="asideMenu"></ul>
        </div>


        <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
    </div>
</div>

<script>

    $(document).ready(function () {
        makeAsideMenu(); //Aside Menu 제작
    })

    function makeAsideMenu() {
        var menuTabList = <%=menuTabList%>;
        var menuPageList = <%=menuPageList%>;
        var majorAllInfo = <%=majorAllInfo%>;
        var major =<%=major%>;
        var list = $('#asideMenu');

        var tab5start=0;
        for(var a=0 ; a<menuPageList.length; a++){
            if(menuPageList[a].tab_id == 5){
                tab5start=a;
                console.log(tab5start);
                break;
            }
        }
        var tab5end=0;
        for(var a=0 ; a<menuPageList.length; a++){
            if(menuPageList[a].tab_id == 6){
                tab5end=a;
                console.log(tab5end);
                break;
            }
        }

        var text = '';
        text += '<li class="sidebar-title">공통메뉴</li>';
        //기본 메뉴
        for (var i = 0; i < 3; i++) {
            text += '<li class="sidebar-item  has-sub">'
                + '<a href="#" class="sidebar-link">'
                + '<i class="bi bi-stack"></i>'
                + '<span>' + menuTabList[i].tab_title + '</span>'
                + '</a>';
            for (var j = 0; j < menuPageList.length; j++) {
                if (menuTabList[i].tab_id == menuPageList[j].tab_id) {
                    text += '<ul class="submenu active" style="display: block;">'
                        + '<li class="submenu-item ">'
                        + '<a href="' + menuPageList[j].page_path + '?major=main&&num=' + menuPageList[j].page_id + '">' + menuPageList[j].page_title + '</a>'
                        + '</li>'
                        + '</ul>';
                }
            }
            text += '</li>';
        }

        //전공 선택
        text += '<li class="sidebar-title">전공메뉴</li>';
        text += '<li class="sidebar-item  has-sub">'
            + '<a href="#" class="sidebar-link">'
            + '<i class="bi bi-stack"></i>'
            + '<span>' + menuTabList[3].tab_title + '</span>'
            + '</a>';
        for (var i = 0; i < majorAllInfo.length; i++) {
            text += '<ul class="submenu active" style="display: block;">'
                + '<li class="submenu-item dropend">'
                + ' <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink' + i + '" data-bs-toggle="dropdown" aria-expanded="false">' + majorAllInfo[i].major_name + '</a>';
                // drop menu start
            text += '<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink' + i + '" style="z-index: 9999">';
            for(var j=tab5start; j<tab5end; j++){
                var url = menuPageList[j].page_path+'?major='+majorAllInfo[i].major_id+'&&num='+menuPageList[j].page_id;
                text += '<li><a class="dropdown-item" href="'+url+'">' + menuPageList[j].page_title + '</a></li>';
            }
            text += '</ul>';
                //drop menu end
            text += '</li>'
                + '</ul>';
        }
        text += '</ul></div>';

        list.append(text);
    }
</script>