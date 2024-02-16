<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ajax::user2</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script>
			
			window.onload = function(){
				
				// 문서 객체 생성
				const formUser2 = document.getElementsByTagName('form')[0];
				const btnSubmit = formUser2.submit;
				
				// 전송버튼
				btnSubmit.onclick=(e)=>{
					e.preventDefault();	// 기본 폼 전송 취소
					
					const uid 	= formUser2.uid.value;
					const name 	= formUser2.name.value;
					const birth = formUser2.birth.value;
					const addr 	= formUser2.addr.value;
					
					const jsonData = {
						"uid": uid,
						"name": name,
						"birth": birth,
						"addr": addr
					};
					
					/*
				 	- jquery ajax를 이용하면 json 문자열 변환없이 바로 전송 가능 (jquery 라이브러리 함수)
					- 서버측에서는 request.getParameter 수신 가능
					*/
					$.ajax({
						method: 'POST',
						url: './proc/putUser2.jsp',
						data: jsonData,
						success: function(data){
							
							// 자동으로 객체 변환되어 들어옴
							console.log(data);
							
							if(data.result > 0){
								alert('수정완료');
								location.href = './list.jsp';
							}
						}
					});
				}
				
				// 현재 페이지 url에서 파라미터 추출
				const url = location.href;
				const params = url.split('?')[1];
				const value = params.split('=')[1];
				
				console.log(value);
				
				// 서버요청
				const xhr = new XMLHttpRequest();
				xhr.open('GET', './proc/getUser2.jsp?uid='+value);
				xhr.send();
				
			}
		
		</script>
	</head>
	<body>
		<h3>user2 수정</h3>
		<a href="./list.jsp">목록이동</a>
		<form action="#">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="date" name="birth"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" name="submit" value="수정하기">
					</td>					
				</tr>
			</table>
		</form>
	</body>
</html>