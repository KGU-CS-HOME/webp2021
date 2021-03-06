<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
   String typeForProfessor = (String)session.getAttribute("type");
   String getProfessorList = (String) request.getAttribute("getProfessorlist");
%>
<script src="/assets/vendors/sweetalert2/sweetalert2.all.min.js"></script>

<style>
   .team-boxed {
      color:#313437;
   }
   .team-boxed p {
      color:#7d8285;
   }
   .team-boxed h2 {
      font-weight:bold;
      margin-bottom:40px;
      padding-top:40px;
      color:inherit;
   }
   @media (max-width:767px) {
      .team-boxed h2 {
         margin-bottom:25px;
         padding-top:25px;
         font-size:24px;
      }
   }
   .team-boxed .intro {
      font-size:16px;
      max-width:500px;
      margin:0 auto;
   }
   .team-boxed .intro p {
      margin-bottom:0;
   }
   .team-boxed .people {
      padding:50px 0;
   }
   .team-boxed .item {
      text-align:center;
   }
   .team-boxed .item .box {
      text-align:center;
      padding:30px;
      background-color:#fff;
      margin-bottom:30px;
   }
   .team-boxed .item .name {
      font-weight:bold;
      margin-top:28px;
      margin-bottom:8px;
      color:inherit;
   }
   .team-boxed .item .title {
      text-transform:uppercase;
      font-weight:bold;
      color:#d0d0d0;
      letter-spacing:2px;
      font-size:13px;
   }
   .team-boxed .item .description {
      font-size:15px;
      margin-top:15px;
      margin-bottom:20px;
   }
   .team-boxed .item img {
      max-width:160px;
   }
   .team-boxed .social {
      font-size:18px;
      color:#a2a8ae;
   }
   .team-boxed .social a {
      color:inherit;
      margin:0 10px;
      display:inline-block;
      opacity:0.7;
   }
   .team-boxed .social a:hover {
      opacity:1;
   }
   #image{
      width: 100px;
      flaot: left;
   }
</style>

<script>
   $(document).ready(function(){
      makeProfessorCard();
   })
   var typeForProfessor=<%=typeForProfessor%>;
   function makeProfessorCard(){
      var professor =<%=getProfessorList%>;
      var prolist = $('#professorCard');
      var text ='';
      for (var i = 0; i < professor.length; i++) {
         text+='<div class="col-lg-4 col-md-6">'
                 +'<div class="card">'
                 +'<svg class="card-img-top" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="'+professor[i].prof_color+'"></rect></svg>'
                 // +'<img src="https://via.placeholder.com/340x120/87CEFA/000000" alt="Cover" class="card-img-top">'
                 +'<div class="card-body text-center">'
                 +'<img src="'+professor[i].prof_img+'" style="height:130px;margin-top:-65px" alt="User" class="img-fluid img-thumbnail rounded-pill border-0 mb-3">'
                 +'<h5 class="card-title">'+professor[i].prof_name+' ??????</h5>'
                 +'<p class="">????????? : '+professor[i].prof_email+'</p>'
                 +'<p class="">????????? ?????? : '+professor[i].prof_location+'</p>'
                 +'<p class ="">????????? : '+professor[i].prof_call+'</p>'
                 +'<p class ="">???????????? : '+professor[i].prof_lecture+'</p>'
                 +'</div>'

         if(typeForProfessor.for_header=='?????????') {
            text += '<div class="card-footer">'
                    +'<button class="btn btn-primary mx-2" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="makeModifyProModal('+i+')">??????</button>'
                    +'<button class="btn btn-danger mx-2" onclick="deleteProfessor('+i+')">??????</button></div>'
         }

            text+='</div></div>';

      }
      if(typeForProfessor.for_header=='?????????') {
         <!-- Button trigger modal -->
         text +='<div><button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#staticBackdrop1">????????? ??????</button><div>'

      }
      prolist.append(text);
   }
   function makeModifyProModal(i) {
      var list = $('#myModalbody');
      var professor1 = <%=getProfessorList%>;
      var a = '';
      a += '<div>????????? ??????</div><input type="text" class="form-control" id="modify_pro_name" name="pro_name1" value="' + (professor1[i].prof_name) + '" placeholder="????????? ??????">'
      a += '<div>????????? ??????</div><input type="text" class="form-control" id="modify_pro_location" name="pro_location1" value="' + (professor1[i].prof_location) + '" placeholder="????????? ??????">'
      a += '<div>????????? </div><input type="text" class="form-control" id="modify_pro_call" name="pro_call1" value="' + (professor1[i].prof_call) + '" placeholder="?????????">'
      a += '<div>????????? </div><input type="text" class="form-control" id="modify_pro_email" name="pro_email1" value="' + (professor1[i].prof_email) + '" placeholder="?????????">'
      a += '<div>???????????? </div><input type="text" class="form-control" id="modify_pro_lecture" name="pro_lecture1" value="' + (professor1[i].prof_lecture) + '" placeholder="????????????">'
      a += '<div>???????????? </div><input type="color" class="form-control" id="modify_pro_color" name="pro_color1"  value="' + (professor1[i].prof_color) + '" placeholder="#777777">'
      a+='<div>????????? ??????</div>'
      a+='<div id="fileUploadSection"><div class="input-group">'
      a+='<input type="file" class="form-control" name="uploadFile" id="uploadFile" accept="image/*">'
      a+='<button class="btn btn-secondary" class="input-group-text" onclick="uploadfile()"><i class="bi bi-upload"></i> ?????????</button>'
      a+='</div></div>'
      a+='<mark>(?????? ???????????? ????????? ????????? ????????? ????????? ????????? ???????????????.)</mark>'
       a += '<button type="button" class="btn btn-dark pull-right my-2" data-dismiss="modal" aria-label="Close" onclick="modifyProModal('+i+')">??????</button>';

      list.html(a);
   }
   var file_id; //????????? ?????? ??????????????? uploadedFile????????? ????????? ???????????? ????????? ??????????????? ???????????? (??? ???????????? ?????? ?????? ??????)
   var file_path; //????????? ???????????? ????????????
   function uploadfile(){
      var formData = new FormData();
      var folder='/uploaded/professor';//????????? ??? ?????? folder ?????? ????????? ???????????? ????????????. (???????????? /??? ?????? ?????? ????????????.)
      // alert($('input[name=uploadFile]')[0].files[0])
      if($('input[name=uploadFile]')[0].files[0]!=null){
         formData.append("file_data",$('input[name=uploadFile]')[0].files[0]);
         formData.append("file_type", "image"); //??????????????? ?????? ?????? ?????? (????????? ???????????? null??? ??????.)
         formData.append("board_level", "0"); // board_level ?????? (?????? ????????? ?????????. ???????????? ????????? 1, ???????????? ????????? 2??? ???????????? ???.)

         $.ajax({
            url : 'upload.kgu?folder='+folder,
            type : "post",
            async:false,
            data : formData,
            processData : false,
            contentType : false,
            success : function(data){//???????????? ??????
               if(data=='fail'){
                  swal.fire({
                     title : '??????',
                     icon : 'error',
                     showConfirmButton: true

                  });
               }
               else {
                  var fileLog=data.split("-/-/-");
                  file_id=fileLog[0];
                  file_folder=folder;
                  file_path=folder+'/'+fileLog[1];
                  var a='';
                  a+='<div class="input-group"><span class="input-group-text">????????????</span><input type="text" class="form-control" value="'+fileLog[1]+'" readonly></div>';
                  a+='<div class="input-group"><a href="download.kgu?id='+file_id+'&&path='+file_folder+'"><button class="btn btn-secondary"><i class="bi bi-download"></i> ????????????</button></a>'
                  a+='<button class="btn btn-danger" onclick="modifyProfessorFile()"><i class="bi bi-x-circle-fill"></i> ???????????? ????????????</button></div>';
                  $('#fileUploadSection').html(a);
               }
            }
         })
      }else{
         swal.fire({
            title : '????????? ??????????????????.',
            icon : 'warning',
            showConfirmButton: true

         });
      }
      // return address;
   }

   function modifyProModal(i){ // ????????? ?????? ???????????? DB??? ?????? ?????? ??? ????????? ??????
      var professor2 = <%=getProfessorList%>;
      var id = professor2[i].id;
      var prof_img='';
      if(file_path!=null)
         prof_img = file_path;
      else
         prof_img = professor2[i].prof_img

      var name = $('input[name=pro_name1]').val();
      var location1 = $('input[name=pro_location1]').val();
      var call = $('input[name=pro_call1]').val();
      var email = $('input[name=pro_email1]').val();
      var lecture = $('input[name=pro_lecture1]').val();
      var color = $('input[name=pro_color1]').val();
      var update = prof_img+"-/-/-" + name + "-/-/-" + location1 + "-/-/-" + call +  "-/-/-" + email +  "-/-/-" + lecture +  "-/-/-" + id + "-/-/-" + color;

         $.ajax({
            url : "ajax.kgu",
            type : "post",
            data : {
               req : "modifyProfessor",
               data : update
            },
            dataType : "json",
            success : function(data) {
               swal.fire({
                  title : '????????? ?????????????????????.',
                  icon : 'success',
                  showConfirmButton: true

               }).then(function (){
                  location.reload();
               });
            }
         })
      }



   function deleteProfessor(i) {
      var professor3 = <%=getProfessorList%>;
      var id = professor3[i].id;
      swal.fire({
         title: '????????? ???????????????????',
         text: '?????? ????????? ??? ????????????.',
         icon: 'warning',
         showConfirmButton: true,
         showCancelButton: true

      }).then((result) => {
         if (result.isConfirmed) {
            $.ajax({
               url: "ajax.kgu",
               type: "post",
               data: {
                  req: "deleteProfessor",
                  data: id
               },
               success: function (data) {
                  swal.fire({
                     title: '?????????????????? ?????????????????????.',
                     icon: 'success',
                     showConfirmButton: true

                  }).then(function () {
                     location.reload();
                  });
               }
            })
         }
      })
   }

   function insertProfessor() { //????????? ?????? ??????
      var prof_img = file_path;
      var major = <%=major%>;
      var name1 = $('#add_pro_name').val();
      var location2= $('#add_pro_location').val();
      var call2= $('#add_pro_call').val();
      var email2= $('#add_pro_email').val();
      var lecture2= $('#add_pro_lecture').val();
      var color2 = $('#add_pro_color').val();
      var data2 =prof_img+'-/-/-'+name1+'-/-/-'+location2+'-/-/-'+call2+'-/-/-'+email2+'-/-/-'+lecture2+'-/-/-'+color2+'-/-/-'+major;


         $.ajax({
            url : "ajax.kgu",
            type : "post",
            data : {
               req : "insertProfessor",
               data : data2
            },

            success : function(data2) {
               if (data2== 'success'){
                  swal.fire({
                     title : '????????? ?????????????????????.',
                     icon : 'success',
                     showConfirmButton: true

                  }).then(function (){
                     location.reload();
                  });
               }
               else
                  swal.fire({
                     title : '?????? ??????',
                     icon : 'error',
                     showConfirmButton: true

                  });
            }

         })
   }

   function modifyProfessorFile(){
      $.ajax({
         url: 'delete.kgu?fileId=' + file_id + '&&folder=' + file_folder,
         type: 'post',
         success: function (data) {//???????????? ??????
            $('#fileUploadSection').html('<div class="input-group"><input type="file" class="form-control" name="uploadFile" id="uploadFile" accept="image/*"><button class="btn btn-secondary" class="input-group-text" onclick="uploadfile()"><i class="bi bi-upload"></i> ?????????</button></div>');
         }
      })
   }
</script>

<div>
   <div class="team-boxed">
      <div class="container">
         <div class="row people d-flex align-content-stretch " id="professorCard"></div>
      </div>
   </div>
</div>
<!-- Modal /  ????????? ?????? ??????-->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="staticBackdropLabel">????????????</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body" id = "myModalbody"></div>
      </div>
   </div>
</div>


<div>
   <!-- Modal / ????????? ?????? ??????-->
   <div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel1" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="staticBackdropLabel1">????????? ????????????</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="modalReset">
               <div>????????? ?????? </div>
               <input type="text" class="form-control" id="add_pro_name" name="add_pro_name1" value="" placeholder="????????? ??????">
               <div>????????? ??????</div>
               <input type="text" class="form-control" id="add_pro_location" name="add_pro_location1" value="" placeholder="????????? ??????">
               <div>?????????</div>
               <input type="text" class="form-control" id="add_pro_call" name="add_pro_call1" value="" placeholder="?????????">
               <div>?????????</div>
               <input type="text" class="form-control" id="add_pro_email" name="add_pro_email1" value="" placeholder="?????????">
               <div>????????????</div>
               <input type="text" class="form-control" id="add_pro_lecture" name="add_pro_lecture1" value="" placeholder="????????????">
               <div>???????????? </div>
               <input type="color" class="form-control" id="add_pro_color" name="add_pro_color1"  value="#777777" placeholder="#777777">

               <div>????????? ??????</div>
               <div id="fileUploadSection">
                  <div class="input-group">
                     <input type="file" class="form-control" name="uploadFile" id="uploadFile" accept="image/*">
                     <button class="btn btn-secondary" class="input-group-text" onclick="uploadfile()"><i class="bi bi-upload"></i> ?????????</button>
                  </div>
                  <mark>(?????? ???????????? ????????? ????????? ????????? ????????? ????????? ???????????????.)</mark>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-danger" data-bs-dismiss="modal">??????</button>
                  <button type="button" class="btn btn-success" aria-label="Close" onclick="insertProfessor()">??????</button>
               </div>
            </div>
         </div>
      </div>
<%--modal end--%>