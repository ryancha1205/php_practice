<?php
	include("includes/header.php");

	//$_POST['bno']이 있을 때만 $bno 선언
	if(isset($_POST['bno'])) {
		$bNo = $_POST['bno'];
	}
	if(isset($_POST['b_type'])) {
		$b_type = $_POST['b_type'];
	}


//글 삭제
if(isset($bNo)) {
	//삭제 할 글의 비밀번호가 입력된 비밀번호와 맞는지 체크
	$sql = 'select * from board_free where b_no = ' . $bNo;
	$result = $con->query($sql);
	$row = $result->fetch_assoc();
	
	//비밀번호가 맞다면 삭제 쿼리 작성
	if(isset($userLoggedIn)) {
		$sql = 'delete from board_free where b_no = ' . $bNo;
	//틀리다면 메시지 출력 후 이전화면으로
	} else {
		$msg = '비밀번호가 맞지 않습니다.';
	?>
		<script>
			alert("<?php echo $msg?>");
			history.back();
		</script>
	<?php
		exit;
	}
}

	$result = $con->query($sql);
	
//쿼리가 정상 실행 됐다면,
if($result) {
	$msg = '정상적으로 글이 삭제되었습니다.';
	$replaceURL = './free_index.php';
} else {
	$msg = '글을 삭제하지 못했습니다.';
?>
	<script>
		alert("<?php echo $msg?>");
		history.back();
	</script>
<?php
	exit;
}


?>
<script>
	alert("<?php echo $msg?>");
	location.replace("<?php echo $replaceURL?>?<?php echo $b_type?>");
</script>