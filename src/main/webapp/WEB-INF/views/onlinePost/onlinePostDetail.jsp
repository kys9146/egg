<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="icon" href="/favicon.ico" type="image/x-icon">

    <title>게시글 조회</title>
    <style>
        * {
            word-break: break-all;
        }

        @font-face {
            font-family: 'BMHANNAAir';
            src:
                url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        .container {
            width: 900px;
            /* border: 1px solid black; */
            text-align: center;
        }

        .buttons {
            text-align: right;
            height: 30px;
        }

        #title {
            font-family: 'BMHANNAAir';
            padding: 30px;
            vertical-align: middle;
            height: 100px;
            /* border: 1px solid; */
        }

        #thumbNail {
            height: 500px;
            /* border: 1px solid black; */
            object-fit: contain;
        }
        
        #thumbNailImg{
           height : 500px;
           object-fit: contain;
        }

        #storeTitle {
            padding-left: 10px;
            border-top: 1px dotted #5f5d5d;
            margin-top: 30px;
            padding: 10px;
            height: 60px;
            /* border: 1px solid black; */
            font-size: 20px;
        }

        .storeTitleP {
            font-family: 'BMHANNAAir';
            font-size: 30px;
        }

        #storeTitleSpan {
            color: red;
        }

        #thumbNailImg {
            width: 100%;
            height: 100%;
        }

        #productImg {
            width: 100%;
            height : 100%;
            object-fit: contain;
        }

        #storeLink {
            height: 250px;
            /* border: 1px solid black; */
            text-align: center;
            padding-left: 35%;
            border-bottom: 1px dotted #5f5d5d;
        }

        #product {
            height: 100%;
            width: 260px;
        }

        #productPic {
            padding: 2px;
            height: 55%;
            /* border: 1px solid; */
        }

        #productInfo {
            height: 45%;
            /* border: 1px solid black; */
        }

        #productName {
            font-family: 'BMHANNAAir';
            font-size: 17px;
            /* border: 1px solid black; */
            padding-top: 10px;
        }

        #productPrice {
            font-family: 'BMHANNAAir';
            height: 35%;
            /* border: 1px solid black; */
            padding-bottom: 10px;
            margin-top: 0px;
        }

        #productPrice {
            font-size: 20px;
        }

        #naviTab {
            margin-top: 50px;
        }

        .nav-link {
            font-family: 'BMHANNAAir';
            font-size: 23px;
        }

        #detailContent {
            margin-top: 100px;
            font-family: 'BMHANNAAir';
        }

        a {
            color: black;
            text-decoration-line: none;
        }

        .comments {
            /* width: 100%; */
            margin-top: 50px;
            /* border: 1px solid black; */
            height: 800px;
            font-family: 'BMHANNAAir';
        }

        .comment {
            position: relative;
        }

        .modifyComment {
            height: 100%;
            width: 100%;
            position: absolute;
            z-index: 1;
            /* border: 1px solid black; */
            border-top: 1px dotted black;
            /* border-bottom: 1px dotted black; */
        }

        .commentsModifyInput {
            padding-top: 5px;
            /* border-bottom: 1px dotted black; */
            padding-bottom: 5px;
        }

        .tab-content {
            height: 0;
        }

        .commentsInputArea {
            height: 300px;
            /* border: 1px solid black; */
        }

        .commentsLabel {
            text-align: left;
            font-size: 25px;
            height: 50px;
            /* border: 1px solid black; */
            vertical-align: middle;
            padding-left: 5px;
            padding-top: 10px;
            /* margin-bottom: 10px; */
            margin-bottom: 5px;
        }

        #commentsInput {
            height: 180px;
            width: 100%;
            resize: none;
            padding: 8px;
            font-size: 20px;
        }

        #commentsInput_cnt {
            height: 20px;
            text-align: left;
            padding-right: 10px;
        }

        #commentInsertBtn {
            text-align: right;
            margin-top: 10px;
            padding-right: 5px;
        }

        #commentModifyBtn {
            margin-top: 5px;
            text-align: right;
            padding-right: 5px;
        }

        .user_nickname {
            text-align: left;
            padding-left: 10px;
            padding-top: 10px;
            height: 22px;
            /* border: 1px solid black; */
            font-size: 20px;
            border-top: 1px dotted #494646;
            font-weight: bold;
            display: flex;
        }

        #user_id {
            padding-top: 5px;
        }

        .written_date {
            font-size: 15px;
            margin-left: 8px;
        }

        .comment_content {
            text-align: left;
            padding-left: 13px;
            padding-right: 10px;
            margin-top: 25px;
            font-size: 22px;
        }

        .divGroup {
            flex: 1;
        }

        #commentChange {
            text-align: right;
            font-size: 12px;
            color: #494646;
            padding-right: 10px;
            /* padding-top: 5px; */
            margin-bottom: 10px;
        }

        .dropdown {
            vertical-align: top;
            text-align: right;
        }

        #editComments {
            cursor: pointer;
            font-weight: bold;
            font-size: 16px;
        }

        .reactions {
            height: 33px;
            /* border: 1px solid black; */
            margin-top: 10px;
            padding-right: 63%;
            padding-left: 10px;
            margin-bottom: 10px;
            text-align: left;
            cursor: pointer;
        }

        .reaction {
            /* width: 40px; */
            /* border: 1px solid black; */
            height: 100%;
            float: left;
            margin-right: 15px;
        }

        .icon {
            /* border: 1px solid black; */
            /* width: 40px; */
            height: 100%;
            float: left;
        }

        .title {
            float: left;
            padding-left: 5px;
            font-size: 20px;
        }

        i {
            height: 50%;
            width: 100%;
            font-family: 'BMHANNAAir';
        }

        #likeTitle {
            text-align: left;
        }

        .blank {
            height: 20px;
            /* border-bottom: 1px dotted black; */
        }

        .modifyInput {
            height: 70px;
            width: 100%;
            resize: none;
            font-size: 20px;
            /* border-top : 1px dotted black; */
        }


        .replyInputDiv input {
            width: 100%;
            padding-left: 10px;
            padding-right: 10px;
            border-top: 0px;
            border-left: 0px;
            border-right: 0px;
            font-size: 20px;
            border-radius: 0px;

        }

        .replyInputDiv input:focus {
            outline: none;
            box-shadow: none;
        }

        .InsertReplyBtnArea {
            margin-top: 10px;
            text-align: right;
            /* margin-right: 10px; */
        }

        .reply_nickname,
        .reply_written_date,
            {
            margin-left: 20px;
        }

        .reply_reactions div {
            float: left;
            margin-left: 20px;
        }

        .commentReply {
            text-align: left;
            margin-top: 10px;
        }

        .reply_nickname {
            font-size: 18px;
            font-weight: bold;
        }

        .reply_written_date {
            font-size: 14px;
            margin-left: 8px;
        }

        .deleteReply {
            font-size: 14px;
            margin-left: 10px;
            color: red;
            cursor: pointer;
        }

        .reply_content,
        .reference_nickname {
            font-size: 20px;
            font-family: 'BMHANNAAir';
            padding-left: 15px;
        }

        .reply_content div {
            padding-left: 15px;
        }

        .reference_nickname {
            font-size: 20px;
            color: #6495ed;
            padding: 0;

        }

        .reply_replyArea:after {
            position: absolute;
        }


        /*  #popup {
            display: flex;
            justify-content: center;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, .7);
            z-index: 1;
        }

        #popup.hide {
            display: none;
        }

        #popup.has-filter {
            backdrop-filter: blur(4px);
            -webkit-backdrop-filter: blur(4px);
        }

        #popup .content {
            width : 500px;
            height : 400px;
            padding: 20px;
            background: #fff;
            border-radius: 5px;
            box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
        } */

        #popup {
            text-align: left;
            display: flex;
            justify-content: center;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, .7);
            z-index: 1;
        }

        #popup.hide {
            display: none;
        }

        #popup.has-filter {
            backdrop-filter: blur(4px);
            -webkit-backdrop-filter: blur(4px);
        }

        #popup .content {
            width: 500px;
            height: 500px;
            padding: 10px;
            background: #fff;
            border-radius: 5px;
            box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
            font-size: 17px;
        }

        .reportTitle {
            font-size: 38px;
            text-align: center;
            font-family: 'BMHANNAAir';
        }

        p {
            margin-top: 10px;
            margin-bottom: 19px;
        }

        .radios {
            margin-bottom: 15px;
            font-size: 20px;
            font-family: 'BMHANNAAir';

        }

        #reportReason {
            resize: none;
            width: 99%;
            height: 100px;
            border-radius: 3px;
        }

        .reportBtns {
            text-align: center;
            margin-top: 10px;
        }

        .likeClass {
            position: fixed;
            left: 370px;
            top: 230px;
            height: 62px;
            width: 60px;
            padding: 3px;
            text-align: center;
            cursor: pointer;
            font-size: 15px;
            font-family: 'BMHANNAAir';
            border: 3px solid #e05885;
            border-radius: 10px;
        }

        #likeEmpty {
            color: #e05885;
        }

        #likefull {
            color: white;
        }

        #likeBtnTitle {
            color: #e05885;
        }

        #likeFullBtnTitle {
            color: white;
        }

        .likeClass:hover {
            background-color: #e05885;
        }

        .likeClass:hover #likeEmpty {
            color: white;
        }

        .likeClass:hover #likeBtnTitle {
            color: white;
        }

        .likeFullClass {
            position: fixed;
            left: 370px;
            top: 230px;
            height: 62px;
            width: 60px;
            padding: 3px;
            text-align: center;
            cursor: pointer;
            font-size: 15px;
            font-family: 'BMHANNAAir';
            border: 3px solid #e05885;
            border-radius: 10px;
            background-color: #e05885;
            display: none;
        }

        .reply_content span {
            width: 300px;
        }

        .nickname_reply {
            margin-left: 15px;
        }

        #likeArea:hover i{
            color :#e05885;   
        }
        .bottomBlank{
            height : 200px;
        }
    </style>
    <script>
    //유저가 좋아요 누른 댓글 좋아요 처리하기
    function selectLike_comment(comment_no){
    	let bid='${loginSession.user_id}';
    	let post_no = comment_no;
    		$.ajax({
                url: "${pageContext.request.contextPath}/like/selectLike.do?post_no=" + post_no + "&user_id=" + bid + "&type=4",
                type: "get"
            }).done(function (data) {
                if (data == "available") {
                	$("#likeBtn"+comment_no).css("color", "#e05885"); 
                    $("#likeArea"+comment_no).attr("value","1");
                }
            }).fail(function (e) {
                console.log(e);
            });
    }
    </script>
</head>

<body>
	<!-- 종아요 버튼 -->
    <div class="likeClass">
        <i class="far fa-heart fa-2x" id="likeEmpty"></i>
        <span id="likeBtnTitle">찜하기</span>
    </div>
    <div class="likeFullClass">
        <i class="far fa-heart fa-2x" id="likefull"></i>
        <span id="likeFullBtnTitle">찜하기</span>
    </div>
    <div class="container mt-3">
        <c:if test="${loginSession.type==0}">
            <div class="buttons">
                <button type="button" class="btn btn-warning" id="modify">게시글
                    수정</button>
                <button type="button" class="btn btn-danger" id="delete">게시글
                    삭제</button>
            </div>
        </c:if>
        <div class="row" id="title">
            <h2>${PostDTO.title}</h2>
        </div>
        <div class="row" id="thumbNail">
            <img src="${pageContext.request.contextPath}/onlinePostThumbNail/${ImageDTO.system_name}" id="thumbNailImg">
        </div>
        <div class="row" id="storeTitle">
            <p class="storeTitleP">
                <span class="storeTitleP" id="storeTitleSpan">잠깐!! </span>준비물은
                챙기셨나요?
            </p>
        </div>
        <div class="row" id="storeLink">
            <div id="product">
                <a href="/product//toProductDetail.do?product_no=${ProductDTO.product_no}">
                    <div id="productPic">
                        <img src="${pageContext.request.contextPath}/productThumbnail/${ProductDTO.image_path}"
                            id="productImg">
                    </div>
                    <div id="productInfo">
                        <div id="productName">${ProductDTO.name}</div>
                        <div id="productPrice">
                            <p>${ProductDTO.price}원</p>
                        </div>
                    </div>
                </a>

            </div>
        </div>
        <div class="row" id="naviTab">

            <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="detail-tab" data-bs-toggle="tab" data-bs-target="#detail"
                        type="button" role="tab" aria-controls="detail" aria-selected="true">상세설명</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="comments-tab" data-bs-toggle="tab" data-bs-target="#comments"
                        type="button" role="tab" aria-controls="comments" aria-selected="false">후기 및 Q&A</button>
                </li>

            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="detail" role="tabpanel" aria-labelledby="detail-tab">
                    <div id="detailContent">${PostDTO.content}</div>
                    <div class="bottomBlank"></div>
                </div>
                <div class="tab-pane fade" id="comments" role="tabpanel" aria-labelledby="comments-tab">
                    <div class="comments">
                        <div class="commentsInputArea">
                            <div class="commentsLabel">
                                <label id="commentsLabel">댓글 달기</label>
                            </div>
                            <div class="commentsInput">
                                <!-- <textarea id="commentsInput"></textarea> -->
                                <textarea id="commentsInput" name="commentsInput" cols="30" rows="10"
                                    placeholder="강의 후기 또는 궁금한 점을 남겨주세요! (150자 이내)"></textarea>

                                <div id="commentInsertBtn">
                                    <span id="commentsInput_cnt">(0 / 150)</span>
                                    <button id="insertComment" class="btn btn-success">댓글
                                        등록</button>
                                </div>
                            </div>
                        </div>
                        <div class="allComments">
                            <div class="commentsLabel">
                                <label id="commentsLabel">전체 댓글 (${CommentList.size()})</label>
                            </div>
                            <c:forEach var="dto" items="${CommentList}">
                                <div class="comment">
                                    <div class="modifyComment" value="${dto.comment_no}" hidden>
                                        <div>
                                            <div class="commentsModifyInput">
                                                <!-- <textarea id="commentsInput"></textarea> -->
                                                <textarea class="modifyInput" name="${dto.comment_no}" cols="30"
                                                    rows="10">${dto.content}</textarea>

                                                <div id="commentModifyBtn">
                                                    <span class="modifyInput_cnt" name="${dto.comment_no}">(0
                                                        / 150)</span>
                                                    <button id="cancelModify" class="btn btn-warning"
                                                        onclick="commentFormVisible(${dto.comment_no})">취소</button>
                                                    <button id="updateComment" class="btn btn-primary"
                                                        onclick="updateComment(${dto.comment_no},'${dto.content}')">댓글
                                                        수정</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="commentForm" value="${dto.comment_no}">
                                        <div class="user_nickname">
                                            <div class="divGroup" id="user_id">
                                                <label>${dto.user_nickname} |</label><label class="written_date">
                                                    ${dto.written_date}</label>
                                            </div>
                                            <div class="divGroup"></div>
                                            <div class="divGroup" id="commentChange">
                                                <div class="dropdown">
                                                    <c:if
                                                        test="${dto.user_id eq loginSession.user_id || loginSession.type==0}">
                                                        <ul class="btn btn-default dropdown-toggle" type="button"
                                                            id="dropdownMenuButton1" data-bs-toggle="dropdown"
                                                            aria-expanded="false" aria-label="Left Align">
                                                            <!-- <span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span> -->
                                                            <label id="editComments">댓글 편집</label>
                                                        </ul>
                                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                                            <li class="dropdown-item"
                                                                onclick="pressModify(${dto.comment_no},'${dto.content}')">
                                                                수정</li>
                                                            <li class="dropdown-item"
                                                                onclick="checkDelete(${dto.comment_no})">삭제</li>
                                                        </ul>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="comment_content">${dto.content}</div>

                                        <div class="reactions">
                                            <div class="reaction replyArea" id="${dto.comment_no}">
                                                <div class="icon" id="replyIcon">
                                                    <i class="far fa-comment-dots fa-2x"></i>
                                                </div>
                                                <div class="title" id="replyTitle">답글</div>
                                            </div>
                                            <div class="reaction" id="likeArea${dto.comment_no}" onclick="likeComment(${dto.comment_no})" value="0">
                                                <div class="icon" id="likeIcon">
                                                    <i class="fas fa-heart fa-2x" id="likeBtn${dto.comment_no}"></i>
                                                </div>
                                                <script>selectLike_comment(${dto.comment_no})</script>
                                                <!-- <i class="fas fa-heart"></i> -->
                                                <div class="title" id="likeTitle">좋아요</div>
                                            </div>

                                            <c:if
                                                test="${dto.user_nickname ne loginSession.user_nickname && loginSession.type!=0}">
                                                <div class="reaction reportArea"
                                                    onclick="showPopup(2,${dto.comment_no})">
                                                    <div class="icon" id="reportIcon">
                                                        <i class="fas fa-times fa-2x"></i>
                                                    </div>
                                                    <div class="title" id="reportTitle">신고</div>
                                                </div>
                                            </c:if>
                                        </div>


                                        <div class="replies" name="${dto.comment_no}" hidden>
                                            <div class="replyInputArea">
                                                <div class="replyInputDiv">
                                                    <input type="text" class="form-control reply_input"
                                                        placeholder="답글을 입력해 주세요." name="${dto.comment_no}">
                                                </div>
                                                <div class="InsertReplyBtnArea">
                                                    <button type="button" class="btn btn-secondary insertReplyBtn"
                                                        name="${dto.comment_no}"
                                                        onclick="insertReply(${dto.comment_no})">답글 등록</button>
                                                </div>
                                            </div>
                                            <div class="commentReplyArea" id="commentReplyArea${dto.comment_no}">
                                            </div>
                                            <div class="blank"></div>
                                        </div>
                                    </div>
                                    
                            </c:forEach>
                        </div>
                    </div>
                    <div class="bottomBlank"></div>
                </div>
            </div>
        </div>
        <form method="post" id="reportForm" action="/report/insertReport.do">
            <div id="popup" class="hide">

                <div class="content">
                    <input type="hidden" name="type" id="type" value=2>
                    <input type="hidden" name="target_no" id="target_no">
                    <div class="reportTitle">
                        <p>신고하기</p>
                    </div>
                    <div class=" radios">
                        <input type="radio" class="reportType" name="report_title" value=1> <span>부적절한 언행 사용(욕설, 성적 발언,
                            정치,
                            종교 혐오 발언 등)</span><br>
                    </div>
                    <div class=" radios">
                        <input type="radio" class="reportType" name="report_title" value=2> <span>유해한 컨텐츠 사용(광고, 거짓정보,
                            자극적인
                            컨텐츠)</span><br>
                    </div>
                    <div class=" radios">
                        <input type="radio" class="reportType" name="report_title" value=3> <span>따돌림 혹은 괴롭힘</span><br>
                    </div>
                    <div class=" radios">
                        <input type="radio" class="reportType" name="report_title" value=4> <span>지적 재산권 침해 및 저작권
                            침해</span><br>
                    </div>
                    <div class=" radios">
                        <input type="radio" class="reportType" name="report_title" value=5> <span>기타</span><br>
                    </div>
                    <textarea type="text" id="reportReason" name="report_content" disabled></textarea>
                    <div class="reportBtns">
                        <button type="button" class="btn btn-secondary" onclick="closePopup()">취소</button>
                        <button type="button" class="btn btn-warning" id="reportBtn">신고</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <script>



        //댓글 입력 시 댓글 글자수를 세어주는 기능
        $(document).ready(function () {
        	
            $('#commentsInput').on('keyup', function () {
                $('#commentsInput_cnt').html("(" + $(this).val().length + " / 150)");

                if ($(this).val().length > 150) {//150자가 넘는 경우
                    $(this).val($(this).val().substring(0, 150)); //150자까지만 잘라서 표기
                    $('#commentsInput_cnt').html("(150 / 150)");
                    alert("150자 이상 입력하실 수 없습니다.");
                }
            });
            
            

        });
        $(document).on("keyup", ".reply_input", function () {
            if ($(this).val().length > 150) {//150자가 넘는 경우
                $(this).val($(this).val().substring(0, 150)); //150자까지만 잘라서 표기 
                alert("150자 이상 입력하실 수 없습니다.");
            }
        })

        //댓글 편집 버튼을 내려오게 하는 이벤드
        $(document).ready(function () {
            $('.dropdown-toggle').dropdown()
            selectLike(); //좋아요 눌렀는지 확인해주는 함수
        });

        //댓글 수정 입력시 댓글 수를 세어주는 기능
        $(document).on("keyup", ".modifyInput", function () {
            let name = this.name;
            console.log(name);
            commentCnt = $("span[name='" + name + "']")[0];
            console.log(commentCnt);
            commentCnt.innerHTML = "(" + $(this).val().length + " / 150)"
            if ($(this).val().length > 150) {
                $(this).val($(this).val().substring(0, 150));
                commentCnt.innerHTML = "(" + $(this).val().length + " / 150)"
                alert("150자 이상 입력하실 수 없습니다.");
            }
        });

        //댓글 등록 버튼 클릭 시 이벤트
        //AJAX RETURN : 새로 입력된 댓글이 추가된 전체 리스트 가져오기
        $("#insertComment").on("click", function () {
            console.log("여깄어요");
            if ($("#commentsInput").val() != "") { //댓글창이 비어있지 않은 경우
                let content = $("#commentsInput").val(); //댓글창 내용
                let post_no = ${ PostDTO.post_no }; //post_no
                let type = 1;
                $.ajax({
                    url: "/comment/insertComment.do"
                    , type: "post"
                    , data: { content: content, post_no: post_no, type: type }
                }).done(function (data) {
                    console.log(data);
                    $("#commentsInput").val("");
                    printComment(data);
                }).fail(function (rs) {
                    console.log(rs);
                })
            } else {
                alert("댓글을 입력해 주세요.");
            }
        })

        $(document).on("click", "#modify", function () {
            location.href = "/onlinePost/toModifyPost.do?post_no=" + ${ PostDTO.post_no };
        })

        $(document).on("click", "#delete", function () {
            if (confirm("게시글을 정말 삭제하시겠습니까?")) {
                location.href = "/onlinePost/deletePost.do?post_no=" + ${ PostDTO.post_no };
            }

        })

        /* //상단 게시글 수정 버튼 클릭 이벤트
        document.getElementById("modify").onclick = function () {
            alert("수정 버튼이 눌렸어!");
            location.href = "/onlinePost/toModifyPost.do?post_no=" + ${ PostDTO.post_no };
        } */


        //상단 게시글 삭제 버튼 클릭 이벤트
        /* document.getElementById("delete").onclick = function () {
            /* alert("삭제 버튼이 눌렸어요!"); 
            location.href = "/onlinePost/deletePost.do?post_no=" + ${ PostDTO.post_no };
        } */

        //댓글 삭제 버튼 클릭시 이벤트
        //삭제 하시겠습니까? 확인창 --> OK누르면 삭제 처리
        //AJAX RETURN : 댓글 삭제 후 전체 댓글 list 불러오기
        function checkDelete(comment_no) {
            if (confirm("삭제 하시겠습니까?")) {
                let post_no = ${ PostDTO.post_no }
                let type = 1;
                $.ajax({
                    url: "/comment/deleteComment.do"
                    , type: "post"
                    , data: { comment_no: comment_no, post_no: post_no, type: type }
                }).done(function (data) {
                    console.log(data);
                    printComment(data);
                }).fail(function (rs) {
                    console.log(rs);
                });
            } else {
                console.log(comment_no);
                return false;
            }
        }

        //AJAX로 전체 댓글을 띄워주는 용도의 함수
        //댓글 변경 시마다 적용되고 있음.
        //PARAMETER : Commentlist => 리스트를 넣으면 foreach 돌려서 생성
        function printComment(Commentlist) {
            $(".allComments").empty();
            var option = "<div class='commentsLabel'><label id='commentsLabel'>전체 댓글 (" + Commentlist.length + ")</label></div>";
            $(".allComments").append(option);
            Commentlist.forEach(function (dto) {
                option = "<div class='comment'>\
                    <div class='modifyComment' value='"+ dto.comment_no + "' hidden>\
                        <div >\
                            <div class='commentsModifyInput'>\
                                <textarea class='modifyInput' name='"+ dto.comment_no + "' cols='30' rows='10'\
                                    >"+ dto.content + "</textarea>\
                                <div id='commentModifyBtn'>\
                                    <span class='modifyInput_cnt' name='"+ dto.comment_no + "'>(0 / 150)</span>\
                                    <button id='cancelModify' class='btn btn-warning' onclick='commentFormVisible("+ dto.comment_no + ")'>취소</button>\
                                    <button id='updateComment' class='btn btn-primary' onclick=\"updateComment("+ dto.comment_no + ",'" + dto.content + "')\">댓글 수정</button>\
                                </div>\
                            </div>\
                        </div>\
                    </div>\
                    <div class='commentForm' value='"+ dto.comment_no + "'>\
                        <div class='user_nickname'>\
                            <div class='divGroup' id='user_id'>\
                            <label>"+ dto.user_nickname + " |</label><label class='written_date'> " + dto.written_date + "</label>\
                            </div>\
                            <div class='divGroup'></div>\
                            <div class='divGroup' id='commentChange"+ dto.comment_no + "'>\
                            <div class='dropdown' id='dropdown"+ dto.comment_no + "'>\
                            </div>\
                            </div>\
                        </div>\
                        <div class='comment_content'>"+ dto.content + "</div>\
                        <div class='reactions' id='reactions"+ dto.comment_no + "'>\
                            <div class='reaction replyArea' id='"+ dto.comment_no + "'>\
                                <div class='icon' id='replyIcon'><i\
                                        class='far fa-comment-dots fa-2x'></i>\
                                </div>\
                                <div class='title' id='replyTitle'>답글</div>\
                            </div>\
                            <div class='reaction' id='likeArea"+dto.comment_no+"' onclick='likeComment("+dto.comment_no+")' value='0'>\
                                <div class='icon' id='likeIcon'> <i class='fas fa-heart fa-2x' id='likeBtn"+dto.comment_no+"'></i>\
                                </div>\
                                <div class='title' id='likeTitle'>좋아요</div>\
                            </div>\
                        </div>\
                        <div class='replies' hidden>\
                        <div class='replyInputArea'>\
                            <div class='replyInputDiv'>\
                                <input type='text' class='form-control reply_input' placeholder='답글을 입력해 주세요.' name='"+ dto.comment_no + "'>\
                            </div>\
                            <div class='InsertReplyBtnArea'>\
                                <button type='button' class='btn btn-secondary insertReplyBtn' name='"+ dto.comment_no + "' onclick='insertReply(" + dto.comment_no + ")'>답글 등록</button>\
                            </div>\
                        </div>\
                        <div class='commentReplyArea' id='commentReplyArea"+ dto.comment_no + "'>\
                        </div>\
                    </div>\
                        <div class='blank'></div>\
                    </div>\
                    <form method='post' id='reportForm' action='/report/insertReport.do'> \
                    <div id='popup' class='hide'>\
                        <div class='content'>\
                            <input type='hidden' name='type' id='type' value=2>\
                            <input type= 'hidden' name='target_no' id='target_no'>\
                            <div class='reportTitle'>\
                                <p>신고하기</p>\
                            </div>\
                            <div class='radios'>\
                                <input type='radio' class='reportType' name='report_title' value=1> <span>부적절한 언행 사용(욕설, 성적 발언, 정치, 종교 혐오 발언 등)</span><br>\
                            </div>\
                            <div class='radios'>\
                                <input type='radio' class='reportType' name='report_title' value=2> <span>유해한 컨텐츠 사용(광고, 거짓정보, 자극적인 컨텐츠)</span><br>\
                            </div>\
                            <div class='radios'>\
                                <input type='radio' class='reportType' name='report_title' value=3> <span>따돌림 혹은 괴롭힘</span><br>\
                            </div>\
                            <div class='radios'>\
                                <input type='radio' class='reportType' name='report_title' value=4> <span>지적 재산권 침해 및 저작권 침해</span><br>\
                            </div>\
                            <div class='radios'>\
                                <input type='radio' class='reportType' name='report_title' value=5> <span>기타</span><br>\
                            </div>\
                            <textarea type='text' id='reportReason' name='report_content' disabled></textarea>\
                            <div class='reportBtns'>\
                                <button type='button' class='btn btn-secondary' onclick='closePopup()''>취소</button>\
                                <button type='button' class='btn btn-warning' id='reportBtn'>신고</button>\
                            </div>\
                        </div>\
                    </div>\
                </form>\
                </div>"
                $(".allComments").append(option);
                if (dto.user_nickname == '${loginSession.user_nickname}' || ${ loginSession.type }== 0) {// 내가 쓴 댓글이라면 댓글 편집 버튼 띄우기
                $("div[id='dropdown" + dto.comment_no + "']").append("<ul class='btn btn-default dropdown-toggle' type='button'\
                            id='dropdownMenuButton1' data-bs-toggle='dropdown'\
                            aria-expanded='false' aria-label='Left Align'>\
                            <label id='editComments'>댓글 편집</label>\
                        </ul>\
                        <ul class='dropdown-menu' aria-labelledby='dropdownMenuButton1'>\
                        <li class='dropdown-item' onclick=\"pressModify("+ dto.comment_no + ",'" + dto.content + "')\">수정</li>\
                            <li class='dropdown-item'\
                                onclick='checkDelete("+ dto.comment_no + "," + dto.post_no + ")'>\
                                삭제\
                            </li>\
                        </ul>")
            }else { // 다른 사람의 댓글인 경우 신고 버튼 띄우기
                $("div[id='reactions" + dto.comment_no + "']").append("<div class='reaction reportArea' onclick='showPopup(2," + dto.comment_no + ")'>\
                            <div class='icon' id='reportIcon'><i class='fas fa-times fa-2x'></i>\
                            </div>\
                            <div class='title' id='reportTitle'>신고</div>\
                        </div>")

            }
            selectLike_comment(dto.comment_no);
        })


        };


        // 댓글 편집 메뉴에 있는 댓글 '수정'버튼을 눌렀을 때
        // PARAMETER : comment_no, origin_comment (수정할 댓글 번호 + 기존 댓글 내용을 넣어줌)
        function pressModify(comment_no, origin_comment) {
            console.log("하이루루");
            let commentDiv = $("div[value='" + comment_no + "']");
            modifyComment = commentDiv[0];
            let modifyInput = $("textarea[name='" + comment_no + "']")
            commentForm = commentDiv[1];
            console.log(modifyComment);
            console.log(commentForm);
            modifyComment.hidden = false;
            commentForm.style.visibility = "hidden";
            let textarea = ($("textarea[name='" + comment_no + "']")[0])
            textarea.value = origin_comment;
            console.log((textarea.value).length);
            commentCnt = $("span[name='" + comment_no + "']")[0];
            console.log(commentCnt);
            commentCnt.innerHTML = "(" + (textarea.value).length + " / 150)"
            return;

        }

        //댓글 수정창 닫고 기존 댓글 내용으로 보여주기
        //수정하다 취소 버튼 클릭 시 적용
        function commentFormVisible(comment_no) {
            let commentDiv = $("div[value='" + comment_no + "']");
            modifyComment = commentDiv[0];
            commentForm = commentDiv[1];
            console.log(modifyComment);
            console.log(commentForm);
            commentForm.style.visibility = "visible"
            modifyComment.hidden = true;
            return
        }

        //댓글이 실제로 수정되는 메서드
        function updateComment(comment_no, origin_content) {
            let textarea = $("textarea[name='" + comment_no + "']");
            let content = textarea[0].value;
            let post_no = ${ PostDTO.post_no }
            let type = 1;
            console.log(textarea);
            console.log(content);
            if (content == "") { //수정창이 비어있는 경우 --> 댓글을 입력해 주세요.
                alert("댓글을 입력해 주세요.");
                return;
            }
            if (origin_content != content) { //수정내용과 기존 내용이 같이 않다면 (수정 되었다면)
                $.ajax({
                    url: "/comment/modifyComment.do"
                    , type: "post"
                    , data: { comment_no: comment_no, content: content, post_no: post_no, type: type }
                }).done(function (data) {
                    console.log(data);
                    printComment(data);
                }).fail(function (rs) {
                    console.log(rs);
                })
            } commentFormVisible(comment_no);
        }

        //답글 등록 메서드
        function insertReply(comment_no) {
            let content = $("input[name='" + comment_no + "']")[0].value;
            console.log(content);
            let post_no = ${ PostDTO.post_no }
            let type = 1;
            
            //실시간 알림
           let typed = 2;
           let from_NN = '${loginSession.user_nickname}';
           let sendType = 1;

                
            if (content == "") { //입력창에 내용이 없다면
                alert("답글을 입력해 주세요.");
                return;
            } else { //내용이 있는 경우
                $.ajax({
                    url: "/comment/insertReply.do"
                    , type: "post"
                    , data: { comment_no, comment_no, post_no: post_no, content: content, type: type }
                }).done(function (data) {
                	
                	$.ajax({
                		url:"/comment/getReceiver.do?comment_no="+comment_no
                		, type:"get"
                	}).done(function(result){
                		console.log("닉넴뽑아오기 성공")
                		let receiver = result
                        //실시간 알림
          				let msg = typed+","+post_no+","+post_no+","+sendType+","+from_NN+","+receiver;
                        ws.send(msg);
                	}).fail(function(e){
                		console.log(e);
                	});
                    console.log(data);
                    $("input[name='" + comment_no + "']").val("");
                    getReplies(data, comment_no);
                }).fail(function (rs) {
                    console.log(rs);
                })
            }
        }

        //답글 아이콘을 눌렀을 때 답글창 표시
        //해당 댓글의 모든 답글 가져오기
        $(document).on("click", ".replyArea", function () {
            let comment_no = ($(this)).attr('id');
            let commentForm = ($(this).parent().parent())[0];
            if (commentForm.children[3].hidden) { //답글창이 닫혀 있는 경우
                $.ajax({
                    url: "/comment/getAllReplies.do"
                    , type: "post"
                    , data: { comment_no: comment_no }
                }).done(function (data) {
                    console.log(data);
                    getReplies(data, comment_no);
                }).fail(function (rs) {
                    console.log(rs);
                })
            } commentForm.children[3].hidden = !commentForm.children[3].hidden;
        })



        //printComment와 같이 리스트를 받아와 띄워주는 메서드
        //PARAMETER : data, comment_no ==> 답글 리스트, 부모 댓글 번호(그 답글창에 띄워줘야 하므로)
        function getReplies(data, comment_no) {
            $("div[id='commentReplyArea" + comment_no + "']").empty();
            if (data.length == 0) { //답글이 없는 경우
                $("div[id='commentReplyArea" + comment_no + "']").append("등록된 답글이 없습니다.");
                return;
            }
            data.forEach(function (dto) {
                var option = "<div class='commentReply'>\
                   <div class='reply_nickname' id='reply_nickname"+ dto.comment_no + "'><span class='nickname_reply'>" + dto.user_nickname + " |</span>\
                                               <span class='reply_written_date'>"+ dto.written_date + "</span>\
                                               </div>\
                                               <div class='reply_content' id='reply_content"+ dto.comment_no + "'></div>\
                   <div class='reply_reactions' id='reply_reactions"+ dto.comment_no + "'>\
                   </div>\
               </div>\
               <div class='blank'></div>\
               <div class='reply_replyArea' id='reply_replyArea"+ dto.comment_no + "' hidden>\
               <div class='replyInputDiv' >\
                   <input type='text' class='form-control reply_input' id='reply_replyInput"+ dto.comment_no + "' name=" + dto.comment_no + ">\
               </div>\
               <div class='InsertReplyBtnArea' >\
                   <button type='button' class='btn btn-secondary replyReplyBtn' value='"+ dto.comment_no + "' onclick='insertReply_reply(" + dto.parent_no + "," + dto.comment_no + ")'>답글 등록</button>\
               </div>\
          </div/ >"

                $("div[id='commentReplyArea" + comment_no + "']").append(option);
          
                if (dto.reference_nickname != " ") {
                    $("div[id='reply_content" + dto.comment_no + "']").append("<span class='reference_nickname'>@" + dto.reference_nickname + " </span>" + dto.content);
                } else {
                    $("div[id='reply_content" + dto.comment_no + "']").append("<span class='reference_nickname'></span>" + dto.content);
                }
                var reference_no = dto.reference_no;
                 
                if (dto.user_id == '${loginSession.user_id}') { //내가 쓴 댓글인 경우, 삭제 버튼과 좋아요 버튼 넣기
                    $("div[id='reply_nickname" + dto.comment_no + "']").append("<span class='deleteReply' onclick='deleteReply(" + dto.comment_no + "," + dto.parent_no + ")'>삭제</span>")
                    $("div[id='reply_reactions" + dto.comment_no + "']").append("<div class='reply_like' id='likeArea"+dto.comment_no+"' onclick='likeComment("+dto.comment_no+")' value='0'>\
                                <i class='fas fa-heart fa-1x'  id='likeBtn"+dto.comment_no+"'></i>\
                            </div>")
                } else if (${ loginSession.type }== 0){ //내가 관리자라면 다른 댓글에 신고 빼고, 모든 댓글 삭제버튼 넣기
                $("div[id='reply_nickname" + dto.comment_no + "']").append("<span class='deleteReply' onclick='deleteReply(" + dto.comment_no + "," + dto.parent_no + ")'>삭제</span>")
                $("div[id='reply_reactions" + dto.comment_no + "']").append("<div class='reply_reply' id='reply_reply" + dto.comment_no + "' onclick=\"reply_reply(" + dto.comment_no + ",'" + dto.user_nickname + "')\">\
                            <i class='fas fa-comment-dots fa-1x reply_reply'></i>\
                            </div>\
                    		<div class='reply_like' id='likeArea"+dto.comment_no+"' onclick='likeComment("+dto.comment_no+")' value='0'>\
                                <i class='far fa-heart fa-1x'  id='likeBtn"+dto.comment_no+"'></i>\
                            </div>\
                            ")
            }else{ //일반 유저인 경우
                $("div[id='reply_reactions" + dto.comment_no + "']").append("<div class='reply_reply' id='reply_reply" + dto.comment_no + "' onclick=\"reply_reply(" + dto.comment_no + ",'" + dto.user_nickname + "')\">\
                            <i class='far fa-comment-dots fa-1x reply_reply'></i>\
                            </div>\
                            <div class='reply_like' id='likeArea"+dto.comment_no+"' onclick='likeComment("+dto.comment_no+")' value='0'>\
                                <i class='fas fa-heart fa-1x'  id='likeBtn"+dto.comment_no+"'></i>\
                            </div>\
                    		<div class='reportArea' onclick='showPopup(2,"+ dto.comment_no + ")''>\
    	                   <i class='fas fa-times fa-1x'></i>\
    		               </div>")
            }
                if(reference_no==-1){
                	$("div[id='reply_content" + dto.comment_no + "']").append("<br><span class='reference_nickname'>[삭제된 댓글의 답글입니다.]</span>");
                	$("div[id='reply_reactions" + dto.comment_no + "']").empty();
                }
            selectLike_comment(dto.comment_no);
            
        })
        }
        //대댓글(답글의 답글)쓰기를 누른 경우
        //@유저 닉네임이 태그된 input창 띄우기
        function reply_reply(comment_no, user_nickname) {
            console.log($("div[id='reply_replyArea" + comment_no + "']"));
            console.log($("Input[id='reply_replyInput" + comment_no + "']")[0]);
            console.log($("Input[id='reply_replyInput" + comment_no + "']").attr("placeholder", "@" + user_nickname + " 답글을 입력해 주세요."));
            $("div[id='reply_replyArea" + comment_no + "']")[0].hidden = !$("div[id='reply_replyArea" + comment_no + "']")[0].hidden
        }

        //대댓글 추가
        function insertReply_reply(parent_no, comment_no) {
            console.log(comment_no);
            let replyInput = $("Input[id='reply_replyInput" + comment_no + "']")[0];
            content = replyInput.value;
            console.log(content);
            let post_no = ${ PostDTO.post_no }
            
            //실시간 알림
            let typed = 2;
            let from_NN = '${loginSession.user_nickname}';
            let sendType=1;
            
            if (content == "") { //대댓글 입력창이 비어있는 경우
                alert("답글을 입력해 주세요.");
            } else {
                $.ajax({
                    url: "/comment/insertReply_reply.do"
                    , type: "post"
                    , data: { comment_no: comment_no, parent_no: parent_no, content: content, post_no: post_no }
                }).done(function (data) {
                	$.ajax({
                		url:"/comment/getReceiver.do?comment_no="+comment_no
                		, type:"get"
                	}).done(function(result){
                		console.log("닉넴뽑아오기 성공")
                		
                		let receiver = result
                        //실시간 알림
          				let msg = typed+","+post_no+","+post_no+","+sendType+","+from_NN+","+receiver;
                        ws.send(msg);
                	}).fail(function(e){
                		console.log(e);
                	});
                    console.log(data);
                    getReplies(data, parent_no);
                }).fail(function (rs) {
                    console.log(rs);
                })
            }
        }


        //답글 삭제
        //확인 없이 그냥 삭제
        function deleteReply(comment_no, parent_no) {
            $.ajax({
                url: "/comment/deleteReply.do"
                , type: "post"
                , data: { comment_no: comment_no, parent_no: parent_no }
            }).done(function (data) {
                getReplies(data, parent_no);
            }).fail(function (rs) {
                console.log(rs);
            })
        }

        /*         function toReportPage(comment_no) {
                    location.href = "/report/toReportPage?comment_no=" + comment_no;
                }
         */

        //신고 팝업을 띄우는 메서드
        //신고 타입(댓글인지, 게시글인지), 해당 번호
        function showPopup(type, target_no) {
            const popup = document.querySelector('#popup');
            popup.classList.add('has-filter');
            popup.classList.remove('hide');
            $("input:radio[name='report_title']:radio[value=1]").prop('checked', true); // 선택하기
            $("#target_no").val(target_no);
            $("#type").val(type);
        }

        //팝업 닫기
        function closePopup() {
            const popup = document.querySelector('#popup');
            popup.classList.add('hide');
        }


        //신고창에서 신고 사유를 선택하는 경우
        $(".reportType").on("click", function () {
            // $("#phoneCheck").attr("disabled",false);
            if ($(this).val() == 5) { //기타 선택시 
                $("#reportReason").attr("disabled", false);//input창 열리기
                return;
            } $("#reportReason").attr("disabled", true); //input창 닫기
        })


        //신고창에서 신고 버튼 눌렀을 때 처리
        $(document).on("click", "#reportBtn", function () {
            var reportForm = $("#reportForm").serialize(); //form을 json으로 해서 보내기
            $.ajax({
                url: "/report/insertReport.do"
                , type: "post"
                , data: reportForm
            }).done(function (rs) {
                if (rs == "success") {
                    alert("신고 완료되었습니다.");
                } else {
                    alert("오류가 생겼습니다. 다시 시도해 주시길 바랍니다.");
                } closePopup();
            }).fail(function (rs) {
                console.log(rs);
            });
        })


        //온라인 게시글 좋아요 버튼 처리
        $('.likeClass').click(function () {
            let bid = '${loginSession.user_id}'
            let post_no = '${PostDTO.post_no}'


            $(this).css("display", "none")
            $(".likeFullClass").css("display", "block");

            $.ajax({
                url: "${pageContext.request.contextPath}/like/plus.do?post_no=" + post_no + "&user_id=" + bid + "&type=1",
                type: "get"
            }).done(function (data) {
                if (data == "available") {
                    console.log("좋아요 성공")
                } else if (data == "unavailable") {
                    alert("좋아요 요청 실패");
                }
            }).fail(function (e) {
                console.log(e);
            })
        })

        //좋아요 취소 처리
        $('.likeFullClass').click(function () {
            let bid = '${loginSession.user_id}'
            let post_no = '${PostDTO.post_no}'


            $(this).css("display", "none")
            $(".likeClass").css("display", "block");

            $.ajax({
                url: "${pageContext.request.contextPath}/like/minus.do?post_no=" + post_no + "&user_id=" + bid + "&type=1",
                type: "get"
            }).done(function (data) {
                if (data == "available") {
                    console.log("좋아요 취소 성공")
                } else if (data == "unavailable") {
                    alert("좋아요 취소 요청 실패");
                }
            }).fail(function (e) {
                console.log(e);
            })
        })
        //유저가 이 게시글에 좋아요를 눌렀을 경우 좋아요버튼이 눌린채로 표시
        function selectLike() {
            let bid = '${loginSession.user_id}'
            let post_no = '${PostDTO.post_no}'
            $.ajax({
                url: "${pageContext.request.contextPath}/like/selectLike.do?post_no=" + post_no + "&user_id=" + bid + "&type=1",
                type: "get"
            }).done(function (data) {
                if (data == "available") {
                    $(".likeFullClass").css("display", "block")
                    $(".likeClass").css("display", "none");
                } else if (data == "unavailable") {
                    $(".likeFullClass").css("display", "none")
                    $(".likeClass").css("display", "block");
                }
            }).fail(function (e) {
                console.log(e);
            });
        }
        

        //댓글 좋아요 처리
        function likeComment(comment_no){
        	let bid = '${loginSession.user_id}';
        	let post_no = comment_no;
        	let value = $("#likeArea"+comment_no).attr("value");
        	
        	//실시간 알림 요소 
        	let from_NN = '${loginSession.user_nickname}';
        	let receiver;
        	let type=3;
        	let sendPostNO='${PostDTO.post_no}';
        	let sendType = 1;
        	
        	if(value=="0"){ //좋아요가 눌려있지 않는 경우
        		$("#likeBtn"+comment_no).css("color", "#e05885"); 
                $("#likeArea"+comment_no).attr("value","1");
                console.log($("#likeArea"+comment_no).attr("value"));
            	$.ajax({
                    url: "${pageContext.request.contextPath}/like/plusReply.do?post_no=" + post_no + "&user_id=" + bid + "&type=4",
                    type: "get"
                }).done(function (data) {
                    if (data != "unavailable") {
                        console.log("좋아요 성공")
						receiver= data
                        
						//실시간 알림
						let msg = type+","+post_no+","+sendPostNO+","+sendType+","+from_NN+","+receiver;
                        ws.send(msg);
                    } else {
                        alert("좋아요 요청 실패");
                    }
                    return;
                }).fail(function (e) {
                    console.log(e);
                })
        	}else{//좋아요가 눌려있는 경우
        		$("#likeBtn"+comment_no).css("color", "black"); 
                $("#likeArea"+comment_no).attr("value","0");
                console.log($("#likeArea"+comment_no).attr("value"));
                $.ajax({
                    url: "${pageContext.request.contextPath}/like/minus.do?post_no=" + post_no + "&user_id=" + bid + "&type=4",
                    type: "get"
                }).done(function (data) {
                    if (data == "available") {
                        console.log("좋아요 취소 성공")
                    } else if (data == "unavailable") {
                        alert("좋아요 취소 요청 실패");
                    }
                }).fail(function (e) {
                    console.log(e);
                })
        	}
        	
        	
        }
        
        
        
        
    </script>
</body>

</html>