<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ajax::user3</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script>
		
			window.onload = function(){
				
				// 문서 객체 생성
				const formUser3 = document.getElementsByTagName('form')[0];
				const btnSubmit = formUser3.submit;
				
				// 전송버튼
				btnSubmit.onclick=(e)=>{
					e.preventDefault();
					
					const uid 	= formUser3.uid.value;
					const name 	= formUser3.name.value;
					const birth = formUser3.birth.value;
					const hp 	= formUser3.hp.value;
					const addr 	= formUser3.addr.value;
					
					const jsonData = {
							"uid": uid,
							"name": name,
							"birth": birth,
							"hp": hp,
							"addr": addr
					};
					
					$.ajax({
						method: 'POST',
						url: './proc/putUser3.jsp',
						data: jsonData,
						success: function(data){
							
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
				xhr.open('GET', './proc/getUser1.jsp?uid='+value);
				xhr.send();
				
				// 응답처리
				xhr.onreadystatechange = function(){
					
					// 응답완료
					if(xhr.readyState == XMLHttpRequest.DONE){
					
						// 요청성공
						if(xhr.status == 200){
							const resData = JSON.parse(xhr.responseText);
							console.log(resData);
							
							formUser3.uid.value = resData.uid;
							formUser3.name.value = resData.name;
							formUser3.birth.value = resData.birth;
							formUser3.hp.value = resData.hp;
							formUser3.addr.value = resData.addr;
						}else{
							// 요청실패
							console.log('요청실패...');
						}
					}	
				}
			}
			
		</script>
	</head>
	<body>
		<h3>user3 수정</h3>
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
					<td>휴대폰</td>
					<td><input type="text" name="hp"></td>
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