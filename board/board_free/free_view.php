<?php
	include("includes/header.php");
	$bNo = $_GET['bno'];

//if there is bno and if there is no cookie,
	//then update the query b_hit +1 where bNo
	//if there is no result, then it happens an error, so need to go back 
	// but if the result is succeeded then after updating the hit, set the cookie
	// like setcookie('board_free_' .$bNo, TRUE, time()+(60*60*24),'/');

	if(!empty($bNo) && empty($_COOKIE['board_free_' . $bNo])) {
		$sql = 'update board_free set b_hit = b_hit + 1 where b_no = ' . $bNo;
		$result = $con->query($sql); 
		if(empty($result)) {
			?>
			<script>
				alert('오류가 발생했습니다.');
				history.back();
			</script>
			<?php 
		} else {
		// if the post is new, gotta set the Cookie
			//cookie name = 'board_free_' + bNo
			setcookie('board_free_' . $bNo, TRUE, time() + (60 * 60 * 24), '/');
		}
	}
	//then fetch those posts datas from database and let it happen
	
	$sql = 'select b_title, b_type, b_content, b_date, b_hit, b_id from board_free where b_no = ' . $bNo;
	$result = $con->query($sql);
	$row = $result->fetch_assoc();
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>자유게시판 | Ryan's Library</title>
	<link rel="stylesheet" href="./css/normalize.css" />
	<link rel="stylesheet" href="./css/board.css" />
</head>

<div class="user_details column">
		<a href="<?php echo $userLoggedIn; ?>">  <img src="<?php echo $user['profile_pic']; ?>"> </a>

		<div class="user_details_left_right">
			<a href="<?php echo $userLoggedIn; ?>">
			<?php 
			echo $user['first_name'] . " " . $user['last_name'];

			 ?>
			</a>
			<br>
			<?php echo "Posts: " . $user['num_posts']. "<br>"; 
			echo "Likes: " . $user['num_likes'];

			?>
		</div>

	</div>

<body>
	<article class="boardArticle">
		<h3>自由掲示板</h3>
		<div id="boardView">
			<h3 id="boardTitle"><?php echo $row['b_title']?></h3>
			<div id="boardInfo">
				<span id="boardID">作成者: <?php echo $row['b_id']?></span>
				<span id="boardDate">作成日: <?php echo $row['b_date']?></span>
				<span id="boardHit">閲覧: <?php echo $row['b_hit']?></span>
			</div>
			<div id="boardContent"><?php echo $row['b_content']?></div>
			<div class="btnSet">
				
				
			<?php
			$sql1 = 'select b_id from board_free where b_no = ' . $bNo;
			$result1 = $con->query($sql);
			$row = $result1->fetch_assoc();
			if($row['b_id']==$userLoggedIn){
			?>
			<a href="./free_write.php?bno=<?php echo $bNo?>">修正</a>
			<a href="./free_delete.php?bno=<?php echo $bNo?>">削除</a>
				<?php
				}else{
					?>
				
				<?php
				}
				?>
				<a href="./free_index.php?<?php echo $row['b_type']?>">目録</a>

			</div>
			<div id="boardComment">
			<?php require_once('./free_comment.php') ?>
			</div>
		</div>
	</article>
</body>
</html>