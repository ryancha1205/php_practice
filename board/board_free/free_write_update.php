<?php
	include("includes/header.php");


	//$_POST['bno']이 있을 때만 $bno 선언
	if(isset($_POST['bNo'])) {
		$bNo = $_POST['bNo'];
	}

	//bno이 없다면(글 쓰기라면) 변수 선언
	if(empty($bNo)) {
		$bID = $_POST['bID'];
		$date = date('Y-m-d H:i:s');
	}

	//항상 변수 선언
	$b_type = $_POST['b_type'];
	$bTitle = $_POST['bTitle'];
	$bContent = $_POST['bContent'];



//글 수정
if(isset($bNo)) {
	
	$sql = 'select b_no from board_free where b_no = ' . $bNo;
	$result = $con->query($sql);
	$row = $result->fetch_assoc();
	if($row['b_no']) {
		$sql = 'update board_free set b_title="' . $bTitle . '", b_content="' . $bContent . '" where b_no = ' . $bNo;
		$msgState = '수정';
	//틀리다면 메시지 출력 후 이전화면으로
			}else{
				$msg="글 수정에 실패했습니다.";
			
	?>
		<script>
			alert("<?php echo $msg?>");
			history.back();
		</script>
	<?php
		exit;
	}
	
//글 등록
} else {
		if(strlen($bTitle)<=0){
		?>
		<script>
				alert("<?php echo "The title is not written"?>");
		</script>
		<?php
		$msgState = "등록";
		}else if(strlen($bContent)<=0){
				?>
			<script>
					alert("<?php echo "The content is not written"?>");
			</script>
		<?php
		$msgState = "등록";
		}else{
	$sql = 'insert into board_free (b_no, b_type, b_title, b_content, b_date, b_hit, b_id) values(null,  "'. $b_type .'", "' . $bTitle . '", "' . $bContent . '", "' . $date . '", 0, "' . $bID . '")';
	$msgState = '등록';
	}


//메시지가 없다면 (오류가 없다면)
if(empty($msg)) {
	if(isset($sql)){
	$result = $con->query($sql);
	$msg = '정상적으로 글이 ' . $msgState . '되었습니다.';
		if(empty($bNo)) {
			$bNo = $con->insert_id;
		}
		$replaceURL = './free_view.php?bno=' . $bNo;
		//$replaceURL = './free_index.php?'.$b_type;
?>
		<script>
			alert("<?php echo $msg?>");
			location.replace("<?php echo $replaceURL?>");
		</script>
<?php
	}else{
		$msg = '글을 ' . $msgState . '하지 못했습니다.';
	}
?>
		<script>
			alert("<?php echo $msg?>");
			history.back();
		</script>
<?php
		exit;
	}
 }
?>