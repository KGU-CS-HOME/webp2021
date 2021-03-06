<%--
  Created by IntelliJ IDEA.
  User: jinny
  Date: 2021-07-14
  Time: 오전 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//    String typeForLab = (String)session.getAttribute("type");
    String getAllMajor = (String)request.getAttribute("getAllMajor");
%>

<style>

.card-title{
    text-align: center;
    margin-top: 10px;
    margin-bottom: 10px;
}

#labCard{
    margin: 20px;
}

#majorCard{
    align-items: center;
    justify-content: center;
}
.card-body{
    text-align: center;
}

</style>
<div>
    <div class="team-boxed">
        <div class="container" >
            <div class="row people" id="majorCard" ></div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
        makeMajorCard();
    })
    function makeMajorCard(){
        var major = <%=getAllMajor%>;
        var list = $('#majorCard');
        var text = '';

        for(var i=0; i<major.length; i++){
            text+= ''
            +'<div class="py-5 card bg-light my-3 col-lg-6" id="labCard" style="max-width: 30rem;">'
            +'<h2 class="text-center my-3">'+major[i].major_name+'</h2>'
            +'<div class="card-body">'
            +'<h6>학과 사무실 위치</h6>'
            +'<p class="card-text mb-3">'+major[i].major_location+'</p>'
            +'<h6>학과 전화번호</h6>'
            +'<p class="card-text">'+major[i].major_contact+'</p>'
            +'</div></div>';

            //     +'<div class="card" style="width: 18rem;">'
            //     +'<div class="card-header">'
            //     +'<div class="box shadow rounded-3" style="height:350px" id="major'+i+'">'
            //     +'<div class="py-4">'
            //     +'<h4 class="name">'+major[i].major_name+'</h4>'
            //     +'<p class="title">연구실 위치 : '+major[i].major_location+'</p>'
            //     +'<p class="description">연구실 전화번호 : '+major[i].major_contact+'</p>';
            // text+='</div></div></div>';
        }
        list.append(text);
    }

</script>
