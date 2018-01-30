<?php
	include("includes/header.php");
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>자유게시판 글쓰기</title>
	<link rel="stylesheet" href="./css/normalize.css" />
	<link rel="stylesheet" href="./css/board.css" />
</head>
<body>

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
	 <?php
	 //게시글 종류
	 $b_type="";
	 	if(isset($_GET['b_free'])){
	 		$b_type = "b_free";
	 	}
	 	if(isset($_GET['b_job'])){
	 		$b_type = "b_job";
	 	}
	 	if(isset($_GET['b_love'])){
	 		$b_type = "b_love";
	 	}
	 	if(isset($_GET['b_business'])){
	 		$b_type = "b_business";
	 	}
	 	if(isset($_GET['b_thinking'])){
	 		$b_type = "b_thinking";
	 	}
	 	if(isset($_GET['b_global'])){
	 		$b_type = "b_global";
	 	}


		if(isset($_GET['bno'])) {
		$bNo = $_GET['bno'];
		
		$sql = 'select * from board_free where b_no = ' . $bNo;
		$result = $con->query($sql);
		$row = $result->fetch_assoc();

	}


	?> 


	<article class="boardArticle">
		<h3>Bulletine board</h3>
		<div id="boardWrite">
			<form action="free_write_update.php" method="post">
				<table id="boardWrite">
					<caption class="readHide"></caption>
					<tbody>
						<tr>

							<!-- <th scope="row"><label for="bID">작성자</label></th> -->
							<td class="id"><input type="hidden" name="bID" id="bID" value="<?php echo $userLoggedIn?>"></td>
						</tr>
						<tr>
<!-- 								<td><input type="text" name="bNo" value="<?php echo $bNo?>"></td>					
 -->						</tr> 
						<?php
						if(isset($bNo)){
						?>
						<tr>
							<th scope="row"><label for="bTitle">タイトル</label></th>
							<td class="title"><input type="text" name="bTitle" id="bTitle" value="<?php echo $row['b_title']?>"></td>
						</tr>

						<tr>
							<th scope="row"><label for="bContent">内容</label></th>
							<td class="content"><textarea name="bContent" id="bContent"><?php echo $row['b_content']?></textarea></td>
						</tr>

						<?php
					}else{
						?>

							<tr>
							<th scope="row"><label for="bTitle">掲示板</label></th>
							<td>
								<select name="b_type">


							<option <?php echo $b_type=='b_free'?'selected="selected"':null?> value="b_free">自由掲示板</option>
							<option <?php echo $b_type=='b_job'?'selected="selected"':null?> value="b_job">就職相談</option>
							<option <?php echo $b_type=='b_love'?'selected="selected"':null?> value="b_love">恋愛相談</option>
							<option <?php echo $b_type=='b_business'?'selected="selected"':null?>  value="b_business">ビジネス相談</option>
							<option <?php echo $b_type=='b_thinking'?'selected="selected"':null?> value="b_thinking">悩み相談</option>
							<option <?php echo $b_type=='b_global'?'selected="selected"':null?> value="b_globl">国際交流場</option>


							</select>
						</td>
							</tr>
						<tr>
							<th scope="row"><label for="bTitle">タイトル</label></th>
							<td class="title"><input type="text" name="bTitle" id="bTitle"></td>
						</tr>
						<tr>
							<th scope="row"><label for="bContent">内容</label></th>
							<td class="content"><textarea name="bContent" id="bContent"></textarea></td>
						</tr>
					<?php
					}
					?>

					</tbody>
				</table>
				<div class="btnSet">
					<button type="submit" class="btnSubmit btn">作成</button>
					<a href="./free_index.php?<?php echo $b_type?>" class="btnList btn">目録</a>
				</div>
			</form>
		</div>
	</article>
</body>
</html>