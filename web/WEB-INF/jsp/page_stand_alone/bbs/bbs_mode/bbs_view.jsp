<%--
  Created by IntelliJ IDEA.
  User: gabri
  Date: 2021-07-19
  Time: 오후 6:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String getBBS = (String) request.getAttribute("getBBS");
  String getComment = (String) request.getAttribute("getComments");
  String getAllFile = (String) request.getAttribute("bbsFiles");
  String bbs_type = (String) request.getAttribute("bbs_type");
%>
<script src="/assets/vendors/sweetalert2/sweetalert2.all.min.js"></script>
<div>
  <div class="h2 px-2" id="view_title"></div>
  <hr>
    <div class="row px-md-2">
      <div class="col-md" id="view_writer"></div>
      <div class="col-md-auto" id="view_count"></div>
      <div class="col-md-auto" id="view_lastModified"></div>
    </div>
  <hr>
  <div class="px-2" id="view_download"></div>
  <div class="" id="view_content"></div>
  <hr>

  <c:if test="${bbs_type =='\"free\"' && user.type != null}">
    <div class="px-2 mt-2 mb-5 h3">추천</div>
    <div class="d-flex justify-content-center" id="view_likes"></div>
    <hr>
  </c:if>

<%--    댓글리스트--%>
    <div>
      <div class="list-group" id="comments">
        <div class="px-2 mt-2 mb-5 h3">댓글</div>
      </div>
    </div>

<%--  댓글 입력 창--%>
  <c:if test="${user != null}">
    <hr>
    <div class="px-2 my-2">댓글 쓰기</div>
    <div class="input-group mb-3">
    <input type="text" class="form-control" id="commentInput" placeholder="댓글은 최대 200자 까지 작성 가능합니다." aria-label="comment" aria-describedby="button-addon2">
    <div class="input-group-append">
    <button class="btn btn-outline-secondary" type="button" id="commentButton" onClick="insertComment()"> 쓰기 </button>
    </div></div>
  </c:if>

  <hr>

  <div class="mt-3 d-grid gap-2 d-flex justify-content-between" id="view_buttons"></div>

</div>

  <!-- Modal -->
  <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header" id="myModalHeader">
          <%--                    <h5 class="modal-title" id="staticBackdropLabel">수정하기</h5>--%>
          <%--                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
        </div>
        <div class="modal-body" id = "myModalBody"></div>
        <div class="modal-footer" id="myModalFooter">
          <%--                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>--%>
          <%--                        <button type="button" class="btn btn-primary">추가하기</button>--%>
        </div>
      </div>
    </div>
  </div>

  <script>

    var header = $('#myModalHeader');
    var body = $('#myModalBody');
    var footer = $('#myModalFooter');

  </script>
<script>
  $(document).ready(function(){
    makeViewTitle();
    makeViewContent();
    makeViewWriter();
    makeViewCount();
    makeViewLastModified();
    makeViewButtons();
    makeViewComments();
    makeDownloads();
    makeLikeButton();
    // makeCommentButton();
  })


  function makeViewComments() {
    var comments = $('#comments');
    var commentsList = <%=getComment%>;
    var text='';
    if(commentsList == null){
      text+='아직 댓글이 없습니다.'
    }
    else {
      for(var i=0;i< commentsList.length;i++){
        var comment = commentsList[i];
        text+='<a class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">'
        +'<h3 class="my-2"><i class="bi bi-person-circle"></i></h3>'
        +'<div class="d-flex gap-2 w-100 justify-content-between">'
        +'<div>'
        +'<h6 class="mb-0">'+comment.writer_name+'</h6>'
        +'<p class="mb-0 opacity-75">'+comment.comment+'</p>'
        +'</div>'
        +'<small class="text-nowrap">'+ formatDate(commentsList[i].comment_date)+'</small>'
        +'</div>'
        if(user!=null){
          if(user.id == commentsList[i].writer_id){
            text +='<button style="width: 70px;" class="btn btn-dark mx-1" type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="makeModifyCommentModal('+i+')">수정</button><button style="width: 70px;" class="btn btn-dark mx-1" type="button"  onclick="deleteComment('+i+')">삭제</button>'
          }
          else if(user.type =='홈페이지관리자'){
            text += '<button style="width: 70px;" class="btn btn-dark mx-1" type="button" onclick="deleteComment('+i+')">삭제</button>'
          }
        }
        text+='</a>'

      }
    }
    comments.append(text);

  }

  function makeDownloads() {
    // view_download
    var view_download = $('#view_download');
    var getAllFile = <%=getAllFile%>;
    var a = '<div>';
    if(getAllFile.length == 0)
      view_download.remove();
    a += '첨부파일: ';
    for(var i = 0 ; i < getAllFile.length ; i++){
      var it = getAllFile[i];
      if(type.for_header == '기타')
        a  += '<span>'+it.original_FileName + '&nbsp&nbsp </span>';
      else
        a += '<a href="download.kgu?id='+it.id+'&path=/uploaded/bbs">' + it.original_FileName + '</a>&emsp;&nbsp;';
    }
    a += '</div><hr>'
    view_download.append(a);
  }

  var major = <%=major%>;
  var num = <%=num%>;
  var id = <%=id%>;
  var type = <%=type%>;
  var user = <%=user%>;
  var getBBS = <%=getBBS%>;

  function formatDate(date) {  //주어진 날짜를 yyyy-mm-dd 형식으로 반환해주는 함수
    var d = new Date(date),
    month = '' + (d.getMonth() + 1),
   day = '' + d.getDate(),
   year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
  }

  function insertComment(){
    var comment = $('#commentInput').val();
    var user_id = user.id;
    var user_name = user.name;
    var comment_date = formatDate(new Date());
    var data = user_id+"-/-/-"+user_name+"-/-/-"+comment+"-/-/-"+comment_date+"-/-/-"+id;
      $.ajax({
        url: "ajax.kgu", //AjaxAction에서
        type: "post", //post 방식으로
        data: {
          req: "insertComment", //이 메소드를 찾아서
          data: data //이 데이터를 파라미터로 넘겨줍니다.
        },
        success: function (data) { //성공 시
            location.reload();
        }
      })
  }


  function makeViewTitle() {
    var content = $('#view_title');
    content.append(getBBS.title);
  }
  function makeViewContent() {
    var content = $('#view_content');
    content.append(getBBS.text);
  }
  function makeViewWriter(){
    var content = $('#view_writer');
    content.append('<span>작성자 : '+getBBS.writer_name+'</span>');
  }
  function makeViewCount(){
    var content = $('#view_count');
     content.append('<span>조회수 : '+getBBS.views+'</span>');
  }
  function makeViewLastModified(){
    var content = $('#view_lastModified');
    var date = formatDate(getBBS.last_modified);
    content.append('<span>작성일 : '+date+'</span>');
  }

  function deleteComment(i){
    var commentsList = <%=getComment%>;
    var data = commentsList[i].id;
    swal.fire({
      title: '댓글을 삭제하시겠습니까?',
      icon: 'warning',
      showConfirmButton: true,
      showCancelButton: true

    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: "ajax.kgu", //AjaxAction에서
          type: "post", //post 방식으로
          data: {
            req: "deleteComment", //이 메소드를 찾아서
            data: data //이 데이터를 파라미터로 넘겨줍니다.
          },
          success: function (data) { //성공 시
            if (data == 'success')
              location.reload();
          }
        })
      }
    })
  }

  function modifyComment(i){
    var commentsList = <%=getComment%>;
    var commentId = commentsList[i].id;
    var comment_date = formatDate(new Date());
    var modifiedComment = $('#modifyComment').val();
    var data = modifiedComment+'-/-/-'+comment_date+'-/-/-'+commentId;
      $.ajax({
        url: "ajax.kgu", //AjaxAction에서
        type: "post", //post 방식으로
        data: {
          req: "modifyComment", //이 메소드를 찾아서
          data: data //이 데이터를 파라미터로 넘겨줍니다.
        },
        success: function (data) { //성공 시
          if (data == 'success') {
            location.reload();
          }
        }
      })
  }


  function makeModifyCommentModal(i){
    var commentsList = <%=getComment%>;
    var modal_header = '';
    modal_header += '<h5 class="modal-title" id="staticBackdropLabel">수정하기</h5>';
    modal_header += '<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>';

    var modal_body = '';
    modal_body += '<div>댓글</div><input type="text" class="form-control" id="modifyComment" name="new_table" value="'+commentsList[i].comment+'" placeholder="comment">';

    var modal_footer = '';
    modal_footer += '<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>';
    modal_footer += '<button type="button" class="btn btn-secondary pull-right" data-dismiss="modal" aria-label="Close" onclick="modifyComment('+i+')">완료</button>';

    header.html(modal_header);
    body.html(modal_body);
    footer.html(modal_footer);
  }


  function makeViewButtons() {
    var view_buttons = $('#view_buttons');
    var listUrl = 'bbs.kgu?major='+major+'&num='+num+'&mode=list';
    var modifyUrl = 'bbs.kgu?major='+major+'&num='+num+'&mode=modify&id='+id;
    var text = '';
    text+='<div><a href="'+listUrl+'"><div class="btn btn-secondary">목록</div></a></div>'

    if(user != null){
      if(user.id== getBBS.writer_id){
        text += '<div>'
                +'<a href="'+modifyUrl+'"><div class="btn btn-primary mx-1">수정</div></a>'
                +'<a onclick="deleteBbs()"><div class="btn btn-danger mx-1">삭제</div></a>'
                +'</div>'
      } else if(type.board_level == 0){
        text += '<div>'
                +'<a onclick="deleteBbs()"><div class="btn btn-danger mx-1">삭제</div></a>'
                +'</div>'
      }
      view_buttons.append(text);
    }

  }

  function makeLikeButton(){
    var bbs_type = <%=bbs_type%>;
    if(bbs_type=='free'){
      var view_likes = $('#view_likes');
      var text = '';
      var already_like = getBBS.already_like;
      text+='<button type="button" class="btn border position-relative">'
      if (user==null || already_like.indexOf(user.id) != -1) {
        text+='<h1><i class="bi bi-hand-thumbs-up-fill"></i></h1>';
      }
      else {
        text+='<h1><i class="bi bi-hand-thumbs-up" onclick="liked()"></i></h1>';
      }
      text+='<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">+'
              +getBBS.likes
              +'<span class="visually-hidden">unread messages</span></span></button>'
      view_likes.html(text);
    }
  }

  function liked() {
    var data =
    <%=getBBS%>.
    id;
    var view_likes = $('#view_likes');
    var text = '';


    $.ajax({
      url: 'ajax.kgu',
      type: 'post',
      data: {
        req: 'likeBoard',
        data: data
      },
      success: function (data) {
        if (data == 'success') {
          text += '<h1><i class="bi bi-hand-thumbs-up-fill"></i></h1>'
          view_likes.html(text)
          swal.fire({
            title: '추천 성공!',
            icon: 'success',
            showConfirmButton: true

          }).then(function () {
            location.reload();
          });
        } else if (data == 'already') {
          swal.fire({
            title: '이미 추천한 글입니다.',
            icon: 'warning',
            showConfirmButton: true

          });
        } else {
          swal.fire({
            title: '서버에러',
            text: '다음에 다시 시도해주세요',
            icon: 'error',
            showConfirmButton: true

          });
        }
      }
    });
  }


  function deleteBbs() {
    var getBBS = <%=getBBS%>;
    var id = getBBS.id;
    var title = getBBS.title;
    var writer_id = getBBS.writer_id;
    var writer_name = getBBS.writer_name;
    var last_modified = getBBS.last_modified;
    var data = id + "-/-/-" + major + "-/-/-" + writer_id + "-/-/-" + writer_name + "-/-/-" + title + "-/-/-" + num + "-/-/-" + last_modified;

    swal.fire({
      title: '정말로 삭제하시나요?',
      text: '다시 되돌릴 수 없습니다.',
      icon: 'warning',
      showConfirmButton: true,
      showCancelButton: true

    }).then((result) => {
      if (result.isConfirmed) {

        $.ajax({
          url: "ajax.kgu", //AjaxAction에서
          type: "post", //post 방식으로
          data: {
            req: "deleteBbs", //이 메소드를 찾아서
            data: data //이 데이터를 파라미터로 넘겨줍니다.
          },
          success: function (data) { //성공 시
            if (data == 'success') {
              swal.fire({
                title : '해당 내용이 삭제되었습니다.',
                icon : 'success',
                showConfirmButton: true

              }).then(function (){
                location.href = 'bbs.kgu?major=' + major + '&num=' + num + '&mode=list';
              });
            } else {
              swal.fire({
                title : '권한이 부족합니다.',
                icon : 'error',
                showConfirmButton: true

              });
            }
          }
        })
      }
    })
  }
</script>

<style>

  #view_content{
    min-height: 500px;
  }

   #view_content img {
     max-width:100%;
     width: 100% !important;
     height: auto !important;
     object-fit:cover;
   }
</style>


