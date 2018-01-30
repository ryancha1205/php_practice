<?php
	include("../includes/header.php");
	
	/* 페이징 시작 */
	//페이지 get 변수가 있다면 받아오고, 없다면 1페이지를 보여준다.
	if(isset($_GET['page'])) {
		$page = $_GET['page'];
	} else {
		$page = 1;
	}
	

	//b_type 가져오기
	$b_type="";
	if(isset($_GET['b_free'])) {
		$b_free = "b_free";
		$b_type = "b_free";
	}
	if(isset($_GET['b_job'])) {
		$b_job = "b_job";
		$b_type = "b_job";

	}
	if(isset($_GET['b_love'])) {
		$b_love = "b_love";
		$b_type = "b_love";
	}
	if(isset($_GET['b_business'])) {
		$b_business = "b_business";
		$b_type = "b_business";

	}
	if(isset($_GET['b_thinking'])) {
		$b_thinking = "b_thinking";
		$b_type = "b_thinking";
	}
	if(isset($_GET['b_global'])) {
		$b_global = "b_global";
		$b_type = "b_global";

	}



	/* 검색 시작 */
	
	$subString ='';
	$searchColumn ='';
	if(isset($_GET['searchColumn'])) {
		$searchColumn = $_GET['searchColumn'];
		$subString .= '&amp;searchColumn=' . $searchColumn;
	}
	if(isset($_GET['searchText'])) {
		$searchText = $_GET['searchText'];
		$subString .= '&amp;searchText=' . $searchText;
	}
	
	if(isset($searchColumn) && isset($searchText)) {
		$searchSql = ' where ' . $searchColumn . ' like "%' . $searchText . '%"';
	} else {
		$searchSql = '';
	}
	
	/* 검색 끝 */
	

	// $sql = 'SELECT count(*) as cnt FROM board_free where b_type like "b_free"';

	// //$sql = 'select count(*) as cnt from board_free' . $searchSql;
	// $result = $con->query($sql);
	// $row = $result->fetch_assoc();
	
	// $allPost = $row['cnt']; //전체 게시글의 수

	if(isset($b_free)){
		$sql = 'SELECT count(*) as cnt FROM board_free where b_type like "b_free"';
		$result = $con->query($sql);
		$row = $result->fetch_assoc();
	}else if(isset($b_job)){
		$sql = 'SELECT count(*) as cnt FROM board_free where b_type like "b_job"';
		$result = $con->query($sql);
		$row = $result->fetch_assoc();
	}else if(isset($b_love)){	
		$sql = 'SELECT count(*) as cnt FROM board_free where b_type like "b_love"';
		$result = $con->query($sql);
		$row = $result->fetch_assoc();
	}else if(isset($b_business)){
		$sql = 'SELECT count(*) as cnt FROM board_free where b_type like "b_business"';
		$result = $con->query($sql);
		$row = $result->fetch_assoc();
	}else if(isset($b_thinking)){
		$sql = 'SELECT count(*) as cnt FROM board_free where b_type like "b_thinking"';
		$result = $con->query($sql);
		$row = $result->fetch_assoc();
	}else if(isset($b_global)){
		$sql = 'SELECT count(*) as cnt FROM board_free where b_type like "b_global"';
		$result = $con->query($sql);
		$row = $result->fetch_assoc();
	}else{
		$sql = 'select count(*) as cnt from board_free' . $searchSql;
		$result = $con->query($sql);
		$row = $result->fetch_assoc();		
	}
		$allPost = $row['cnt']; //전체 게시글의 수



	
	if(empty($allPost)) {
		$emptyData = '<tr><td class="textCenter" colspan="5">検索できません</td></tr>';

		$paging = '<ul>';
		$paging .= '<li class="page current">1</li>';
		$paging .= '</ul>';
	} else {

		$onePage = 15; // 한 페이지에 보여줄 게시글의 수.
		$allPage = ceil($allPost / $onePage); //전체 페이지의 수
		
		if($page < 1 && $page > $allPage) {
?>
			<script>
				alert("存在しないページです.");
				history.back();
			</script>
<?php
			exit;
		}
	
		$oneSection = 10; //한번에 보여줄 총 페이지 개수(1 ~ 10, 11 ~ 20 ...)
		$currentSection = ceil($page / $oneSection); //현재 섹션
		$allSection = ceil($allPage / $oneSection); //전체 섹션의 수
		
		$firstPage = ($currentSection * $oneSection) - ($oneSection - 1); //현재 섹션의 처음 페이지
		
		if($currentSection == $allSection) {
			$lastPage = $allPage; //현재 섹션이 마지막 섹션이라면 $allPage가 마지막 페이지가 된다.
		} else {
			$lastPage = $currentSection * $oneSection; //현재 섹션의 마지막 페이지
		}
		
		$prevPage = (($currentSection - 1) * $oneSection); //이전 페이지, 11~20일 때 이전을 누르면 10 페이지로 이동.
		$nextPage = (($currentSection + 1) * $oneSection) - ($oneSection - 1); //다음 페이지, 11~20일 때 다음을 누르면 21 페이지로 이동.
		
		$paging = '<ul>'; // 페이징을 저장할 변수
		
		//첫 페이지가 아니라면 처음 버튼을 생성
		if($page != 1) { 
			$paging .= '<li class="page page_start"><a href="./free_index.php?page=1' . $subString . '">始め</a></li>';
		}
		//첫 섹션이 아니라면 이전 버튼을 생성
		if($currentSection != 1) { 
			$paging .= '<li class="page page_prev"><a href="./free_index.php?page=' . $prevPage . $subString . '">前</a></li>';
		}
		
		for($i = $firstPage; $i <= $lastPage; $i++) {
			if($i == $page) {
				$paging .= '<li class="page current">' . $i . '</li>';
			} else {
				$paging .= '<li class="page"><a href="./free_index.php?page=' . $i . $subString . '">' . $i . '</a></li>';
			}
		}
		
		//마지막 섹션이 아니라면 다음 버튼을 생성
		if($currentSection != $allSection) { 
			$paging .= '<li class="page page_next"><a href="./free_index.php?page=' . $nextPage . $subString . '">次</a></li>';
		}
		
		//마지막 페이지가 아니라면 끝 버튼을 생성
		if($page != $allPage) { 
			$paging .= '<li class="page page_end"><a href="./free_index.php?page=' . $allPage . $subString . '">最後</a></li>';
		}
		$paging .= '</ul>';
		
		/* 페이징 끝 */
		
		
		$currentLimit = ($onePage * $page) - $onePage; //몇 번째의 글부터 가져오는지
		$sqlLimit = ' limit ' . $currentLimit . ', ' . $onePage; //limit sql 구문
		
		if(isset($b_free)){
		$sql = 'SELECT * FROM board_free where b_type like "b_free"' . $searchSql .' order by b_no desc' . $sqlLimit;
		$result = $con->query($sql);
	}else if(isset($b_job)){
		$sql = 'SELECT * FROM board_free where b_type like "b_job"'. $searchSql .' order by b_no desc' . $sqlLimit;
		$result = $con->query($sql);
	}else if(isset($b_love)){	
		$sql = 'SELECT * FROM board_free where b_type like "b_love"'. $searchSql .' order by b_no desc' . $sqlLimit;
		$result = $con->query($sql);
	}else if(isset($b_business)){
		$sql = 'SELECT * FROM board_free where b_type like "b_business"'. $searchSql .' order by b_no desc' . $sqlLimit;
		$result = $con->query($sql);
	}else if(isset($b_thinking)){
		$sql = 'SELECT * FROM board_free where b_type like "b_thinking"'. $searchSql .' order by b_no desc' . $sqlLimit;
		$result = $con->query($sql);
	}else if(isset($b_global)){
		$sql = 'SELECT * FROM board_free where b_type like "b_global"'. $searchSql .' order by b_no desc' . $sqlLimit;
		$result = $con->query($sql);
	}else{
		$sql = 'select * from board_free' . $searchSql .' order by b_no desc' . $sqlLimit; //원하는 개수만큼 가져온다. (0번째부터 20번째까지
		$result = $con->query($sql);
	
	}
		
	}	
?>


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>자유게시판</title>
	<link rel="stylesheet" href="./css/normalize.css" />
	<link rel="stylesheet" href="./css/board.css" />
</head>
<body>



	<div class="user_details column">
		<a href="<?php echo $userLoggedIn; ?>">  <img src="../<?php echo $user['profile_pic']; ?>"> </a>

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

	<article class="boardArticle">
<!-- 		<h3>掲示板</h3>
 -->		<div id="boardList">
			<table style="margin-top:10px">
<!-- 				<caption class="readHide">タイトル無し</caption>
 -->				<thead>
					<tr>
						<th scope="col" class="no">番号</th>
						<th scope="col" class="title">タイトル</th>
						<th scope="col" class="author">作成者</th>
						<th scope="col" class="date">作成日</th>
						<th scope="col" class="hit">閲覧数</th>
					</tr>
				</thead>
				<tbody>
						<?php
						if(isset($emptyData)) {
							echo $emptyData;
						} else {
							while($row = $result->fetch_assoc())
							{
								$datetime = explode(' ', $row['b_date']);
								$date = $datetime[0];
								$time = $datetime[1];
								if($date == Date('Y-m-d'))
									$row['b_date'] = $time;
								else
									$row['b_date'] = $date;
						?>
						<tr>
							<td class="no"><?php echo $row['b_no']?></td>
							<td class="title">
								<a href="./free_view.php?bno=<?php echo $row['b_no']?>"><?php echo $row['b_title']?></a>
							</td>
							<td class="author"><?php echo $row['b_id']?></td>
							<td class="date"><?php echo $row['b_date']?></td>
							<td class="hit"><?php echo $row['b_hit']?></td>
						</tr>
						<?php
							}
						}
						?>
				</tbody>
			</table>

			<div class="btnSet">
				<a href="./free_write.php?<?php echo $b_type?>" class="btnWrite btn" style="margin-right:140px;background-color:white;margin-top:10px;font-size:20px;color:black">書く</a>
			</div>


			<div class="paging">
				<?php echo $paging ?>
			</div>
			<div class="searchBox">
				<form action="./free_index.php" method="get">
					<select name="searchColumn">
						<option <?php echo $searchColumn=='b_title'?'selected="selected"':null?> value="b_title">タイトル</option>
						<option <?php echo $searchColumn=='b_content'?'selected="selected"':null?> value="b_content">内容</option>
						<option <?php echo $searchColumn=='b_id'?'selected="selected"':null?> value="b_id">作成者</option>
					</select>
					<input type="text" name="searchText" value="<?php echo isset($searchText)?$searchText:null?>">
					<button type="submit">検索</button>
				</form>
			</div>
		</div>
	</article>

	<div class="user_details column2">
		<ul class="a2" style="list-style: none; font-size:25px">
			<li><a style="margin-left:15px" href="./free_index.php">전체글보기</a></li><br><br>
			<li><a style="margin-left:15px" href="./free_index.php?b_free">자유게시판</a></li><br><br>
			<li><a style="margin-left:15px" href="./free_index.php?b_job">취직상담</a></li><br><br>
			<li><a style="margin-left:15px" href="./free_index.php?b_love">연애상담</a></li><br><br>
			<li><a style="margin-left:15px" href="./free_index.php?b_business">사업상담</a></li><br><br>
			<li><a style="margin-left:15px" href="./free_index.php?b_thinking">고민상담</a></li><br><br>
			<li><a style="margin-left:15px" href="./free_index.php?b_global">국제교류</a></li><br><br>

		</ul>
	</div>


</body>
</html>