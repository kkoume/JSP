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
				
			}
			
		</script>
	</head>
	<body>
		
	</body>
</html>