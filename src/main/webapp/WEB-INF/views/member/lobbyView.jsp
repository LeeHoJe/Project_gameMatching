<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>대기실</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style>
/* img { position : absolute;} */
#img1 {
	z-index: 2;
	left: 10px;
}

#img2 {
	z-index: 2;
	left: 10px;
}

#img1_2 {
	z-index: 1;
	left: 50%;
	top: 50%;
}

body {
	height: 100%;
	font-family: Arial, Helvetica, sans-serif;
	display: grid;
	justify-items: center;
	align-items: center;
	background-color: #3a3a3a;
}

#main {
	height: 100%;
	margin-top: 5%;
	display: grid;
	justify-items: center;
	align-items: center;
	background-color: white;
	border-radius: 7px;
	box-shadow: 0px 0px 5px 2px black;
}

table {
	justify-items: center;
	align-items: center;
	background-color: white;
	border-radius: 7px;
	box-shadow: 0px 0px 5px 2px black;
}

#btn {
	width: 200px;
	padding: 20px;
	border: none;
	border-radius: 50px;
	color: white;
	font-weight: bold;
	background-color: black;
	cursor: pointer;
	outline: none;
}

#btn_list {
	width: 200px;
	padding: 20px;
	border: none;
	border-radius: 50px;
	color: white;
	font-weight: bold;
	background-color: black;
	cursor: pointer;
	outline: none;
}

#chart_container {
	height: 300px;
	width: 300px;
}
</style>
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3">

				<div id="my_info"
					style="display: none; float: right; margin-top: 20%;">
					<table id="table_color1" style="text-align: center;">
						<thead>
							<tr>
								<td>| Name |</td>
								<td>| K |</td>
								<td>| D |</td>
								<td>| A |</td>
								<td>| K.D.A |</td>
								<td>| Position |</td>
								<td>| Champ |</td>

							</tr>
						</thead>
						<tbody id="my_list_info"></tbody>
					</table>
				</div>



			</div>

			<div id="main" class="col-md-6">
				<div class="" style="padding: 10px; width: 100%;">
					<h1>LoL-AutoMatching: Duo</h1>
					<hr>
					<!-- style="position:relative" -->
					<!-- <form class="row g-3 needs-validation" novalidate style="margin-left:30px"> -->
					<!-- 왼쪽 -->
					<div
						style="float: left; width: 33%; height: 800px; padding: 10px; text-align: center;">

						<div class="">
							<label for="validationCustom01" class="form-label">User
								name</label> <input type="UserName" class="form-control"
								id="summoner_name" value=${sessionScope.login.userNm } required
								style="background-color: black; color: white;">
						</div>

						<div class="row">
							<div id="rank_info">
								<table style="float: right; width: 100%;">
									<thead>
										<tr>
											<td>Name</td>
											<td>Tier</td>
											<td>Win</td>
											<td>Lose</td>
										</tr>
									</thead>
									<tbody id="my_list">

									</tbody>
								</table>
							</div>
						</div>
						<br>
						<div style="display: flex;">
							<!-- <input type="UserName" class="form-control" id="my_tier" value='' required
                  style="background-color: black; color: white; width: 110px;"> -->

							<!-- 이미지 -->
							<img id="img1" src='' style="width: 200px; margin-top: 10px;">

							<button id=btn type="button" class=""
								style="width: auto; height: auto; padding: 10px; margin-left: 10px;"
								onclick='toggleBtn1()'>view</button>
						</div>
						<!-- <div>
                
                <label for="validationCustom04" class="form-label">주포지션</label>
                <select class="form-select" id="validationCustom04" required>
                  <option selected disabled value="">Choose...</option>
                  <option>Top</option>
                  <option>Jungle</option>
                  <option>Mid</option>
                  <option>AdCarry</option>
                  <option>Supporter</option>
                </select>
                <br>
                <label for="validationCustom04" class="form-label">선호포지션</label>
                <select class="form-select" id="validationCustom04" required>
                  <option selected disabled value="">Choose...</option>
                  <option>Top</option>
                  <option>Jungle</option>
                  <option>Mid</option>
                  <option>AdCarry</option>
                  <option>Supporter</option>
                </select>
              </div> -->

						<!-- View-차트 -->
						<div id="chart_container">
							<!-- 파이차트 -->

							<div id="chartList" style="display: none;">
								<div id="chart_container" style="height: auto;">
									<canvas id="myChart"></canvas>
								</div>
								<!-- 차트바 -->
								<div id="chart_container" style="height: auto; width: 300px;">
									<canvas id="myChart_bar"></canvas>
								</div>
							</div>
						</div>
					</div>


					<!-- 가운데 -->
					<div style="float: left; width: 33%; height: 650px; padding: 10px;">
						<!-- <button class="btn btn-primary" type="submit" style="position: absolute; margin-left: 500px;">듀오찾기</button> -->




						<button id="btn_list" type="button" class=""
							style="position: absolute; margin-top: 10%; margin-left: 1%;">듀오찾기</button>

					</div>


					<!-- 오른쪽 -->
					<div
						style="float: left; width: 33%; height: 1100px; padding: 10px; text-align: center;">

						<div class="">
							<!-- style="margin-left: 31%" -->
							<label for="validationCustom02" class="form-label">Team
								name</label> <input type="text" class="form-control" id="team_name"
								value="" style="background-color: black; color: white;">

							<div class="row">
								<div id="rank_info">
									<table style="float: right; width: 100%;">
										<thead>
											<tr>
												<td>Name</td>
												<td>Tier</td>
												<td>Win</td>
												<td>Lose</td>
											</tr>
										</thead>
										<!-- <tbody id="user_list"> -->
										<tbody id="user_list2"
											style="display: none; text-align: center;">
											<c:forEach items="${LobbyList }" var="lobby">
												<tr onclick="fn_click(this)">
													<td class="lo_userNm">${lobby.userNm }</td>
													<td>${lobby.userTier}</td>
													<td>${lobby.userWins}</td>
													<td>${lobby.userLosses}</td>
												</tr>
											</c:forEach>
										</tbody>

									</table>
								</div>
							</div>
							<br>
							<!-- 이미지 -->
							<img id="img2" src='' style="width: 200px; margin-top: 10px;">


							<!-- View-차트 -->
							<div id="chart_container">
								<!-- 파이차트 -->

								<div id="chartList2" style="display: none;">
									<div id="chart_container" style="height: auto;">
										<canvas id="user_Chart"></canvas>
									</div>
									<!-- 차트바 -->
									<div id="chart_container" style="height: auto; width: 300px;">
										<canvas id="user_Chart_bar"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div id="team_info" style="display: none; margin-top: 20%;">
					<table style="text-align: center;">
						<thead>
							<tr>
								<td>| Name |</td>
								<td>| K |</td>
								<td>| D |</td>
								<td>| A |</td>
								<td>| K.D.A |</td>
								<td>| Position |</td>
								<td>| Champ |</td>
							</tr>
						</thead>
						<tbody id="user_list_info"></tbody>

					</table>
				</div>
			</div>
		</div>
	</div>

	<script>

    let id_code = '';
    let count1 = 0;
    let count1_top = 0;
    let count1_jungle = 0;
    let count1_midle = 0;
    let count1_bottom = 0;
    let count1_utility = 0;

    /* view-my_info */
    function toggleBtn1() {
      // 토글 할 버튼 선택 (btn1)
      const btn1 = document.getElementById('chartList');
      const btn2 = document.getElementById('my_info');
      // btn1 숨기기 (display: none)
      if (btn1.style.display !== 'none') {
        btn1.style.display = 'none';
      }
      // btn` 보이기 (display: block)
      else {
        btn1.style.display = 'block';
      }
      //btn2
      if (btn2.style.display !== 'none') {
        btn2.style.display = 'none';
      }
      // btn` 보이기 (display: block)
      else {
        btn2.style.display = 'block';
      }

      let summoner_name = $('#summoner_name').val();
      let my_tier = '';
      let img_src = '';
      //let summoner_name = '잡초아저씨';
      $.ajax({
          url: 'https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/'+summoner_name+'?api_key='+api_key
        , dataType: 'json'//응답 데이터 타입
        , success: function (data_id) {//정상처리시 리턴 data에 담김
          console.log(data_id['id']);
          let id_my = data_id['id'];
          let puid_my = data_id['puuid'];
          // return id_code;
          $.ajax({
              url: 'https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/'+id_my+'?api_key='+api_key
            , dataType: 'json'//응답 데이터 타입
            , success: function (res) {//정상처리시 리턴 data에 담김
              console.log(res);
              let str = '';
              for (let i = 0; i < res.length; i++) {
                let type = res[i]['queueType'];
                if (type == 'RANKED_SOLO_5x5') {
                  //str += '<tr onclick="fn_click(this)">';
                  str += '<tr>';
                  //str += '<tr>';
                  str += '<td>' + res[i]['summonerName'] + '</td>';
                  str += '<td>' + res[i]['tier'] + ' ' + res[i]['rank'] + '</td>';
                  str += '<td>' + res[i]['wins'] + '</td>';
                  str += '<td>' + res[i]['losses'] + '</td>';
                  str += '</tr>';
                  let rank_info = (res[i]['tier'] + ' ' + res[i]['rank'] + ' ' + res[i]['wins'] + ' ' + res[i]['losses']);
                  console.log(rank_info);
                  my_tier = (res[i]['tier']);
                  console.log(my_tier)
                  if (my_tier == "CHALLENGER") {
                    img_src = '${pageContext.request.contextPath }/resources/ranked-emblem/emblem-challenger.png'
                  }
                  if (my_tier == "GRANDMASTER") {
                    img_src = '${pageContext.request.contextPath }/resources/ranked-emblem/emblem-grandmaster.png'
                  }
                  if (my_tier == "MASTER") {
                    img_src = '${pageContext.request.contextPath }/resources/ranked-emblem/emblem-master.png'
                  }
                  if (my_tier == "DIAMOND") {
                    img_src = '${pageContext.request.contextPath }/resources/ranked-emblem/emblem-diamond.png'
                  }
                  if (my_tier == "EMERALD") {
                    img_src = '${pageContext.request.contextPath }/resources/ranked-emblem/emblem-emerald.webp'
                  }
                  if (my_tier == "PLATINUM") {
                    img_src = '${pageContext.request.contextPath }/resources/ranked-emblem/emblem-platinum.png'
                  }
                  if (my_tier == "GOLD") {
                    img_src = '${pageContext.request.contextPath }/resources/ranked-emblem/emblem-gold.png'
                  }
                  if (my_tier == "SILVER") {
                    img_src = '${pageContext.request.contextPath }/resources/ranked-emblem/emblem-silver.png'
                  }
                  if (my_tier == "BRONZE") {
                    img_src = '${pageContext.request.contextPath }/resources/ranked-emblem/emblem-bronze.png'
                  }
                  if (my_tier == "IRON") {
                    img_src = '${pageContext.request.contextPath }/resources/ranked-emblem/emblem-iron.png'
                  }
                }
                
                document.getElementById('img1').src = img_src
                console.log(img_src);
              }document.getElementById('my_list').innerHTML += str;
            }, error(e) {
              console.log(e);
            }
          });

          $.ajax({
              url: 'https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/'+puid_my+'/ids?start=0&count=20&api_key='+api_key
            , dataType: 'json'//응답 데이터 타입
            , async: false
            , success: function (mi) {//정상처리시 리턴 data에 담김
              for (let j = 0; j < mi.length; j++) {
                $.ajax({
                    url: 'https://asia.api.riotgames.com/lol/match/v5/matches/'+mi[j]+'?api_key='+api_key
                  , dataType: 'json'//응답 데이터 타입
                  , async: false
                  , success: function (data) {
                    let v = data['info']['participants']
                    let str = '';
                    for (let i in v) {

                      if (summoner_name == v[i]['summonerName']) {
                        let sN = v[i]['summonerName']
                        let kill = v[i]['kills']
                        let death = v[i]['deaths']
                        let assi = v[i]['assists']
                        let kda = (v[i]['challenges']['kda'])
                        kda = Math.round(kda)
                        let teamLine = v[i]['teamPosition']
                        let cham_Nm = v[i]['championName']
                        let win = v[i]['win']
                        let rc = (sN + kill + death + assi + kda + teamLine + ' ' + cham_Nm + win)
                        str += '<tr';
                        if (win == true) {
                          str += ' style="background-color: rgb(54, 162, 235);"';
                        } else {
                          str += ' style="background-color: rgb(255, 99, 132);"';
                        }
                        str += '>';

                        str += '<td>' + sN + '</td>';
                        str += '<td>' + kill + '</td>';
                        str += '<td>' + death + '</td>';
                        str += '<td>' + assi + '</td>';
                        str += '<td>' + kda + '</td>';
                        str += '<td>' + teamLine + '</td>';
                        str += '<td>' + cham_Nm + '</td>';
                        str += '</tr>';

                        console.log(j, rc)

                        if (win == true) {
                          count1++
                        }
                        if (teamLine == "TOP") {
                          count1_top++
                        }
                        if (teamLine == "JUNGLE") {
                          count1_jungle++
                        }
                        if (teamLine == "MIDDLE") {
                          count1_midle++
                        }
                        if (teamLine == "BOTTOM") {
                          count1_bottom++
                        }
                        if (teamLine == "UTILITY") {
                          count1_utility++
                        }

                      }

                    }
                    document.getElementById('my_list_info').innerHTML += str;

                  }
                });
              }
            }
          }); console.log(count1);

          // 차트
          const data = {
            labels: [
              'Win',
              'Lose',

            ],
            datasets: [{
              label: '최근 20판 전적',
              data: [count1, 20 - count1],
              backgroundColor: [
                'rgb(54, 162, 235)',
                'rgb(255, 99, 132)'

              ],
              hoverOffset: 4
            }]
          };
          const config = {
            type: 'pie',
            data: data,

          };
          const ctx = document.getElementById('myChart');
          let myChart = new Chart(ctx, config);

          //chartbar
          const data2 = {
            labels: ['Top', 'Jubgle', 'Midle', 'Bottom', 'Utility'],
            datasets: [{
              label: 'My Position',
              data: [count1_top, count1_jungle, count1_midle, count1_bottom, count1_utility],
              backgroundColor: [
                'rgba(0,191,255, 0.8)',
                'rgba(0,191,255, 0.8)',
                'rgba(0,191,255, 0.8)',
                'rgba(0,191,255, 0.8)',
                'rgba(0,191,255, 0.8)',

              ],
              borderColor: [
                'rgba(0,191,255)',
                'rgba(0,191,255)',
                'rgba(0,191,255)',
                'rgba(0,191,255)',
                'rgba(0,191,255)',
              ],
              borderWidth: 1
            }]
          };
          const config2 = {
            type: 'bar',
            data: data2,
            options: {
              scales: {
                y: {
                  beginAtZero: true
                }
              }
            },
          };
          const ctx2 = document.getElementById('myChart_bar');
          let myChart_bar = new Chart(ctx2, config2);
        }
      });

    }

    /* team_info */
     
    
    /* 듀오찾기 */


    $(document).ready(function () {
      $('#btn_list').click(function () {
         

    	  
    	  const btn_t = document.getElementById('user_list2');

          // btn1 숨기기 (display: none)
          if (btn_t.style.display !== 'none') {
        	  btn_t.style.display = 'none';
          }
          // btn` 보이기 (display: block)
          else {
        	  btn_t.style.display = '';
          }
         

       // let team_name = $('#team_name').val();


      });
    });
    let puid_code = '';
    let api_key = 'RGAPI-434e8c55-a713-416b-9c4e-e7ed4f8b8f38';
    let my_tier2='';
    let img_src2='';
    
    let count2 = 0;
    let count2_top = 0;
    let count2_jungle = 0;
    let count2_midle = 0;
    let count2_bottom = 0;
    let count2_utility = 0;


    function fn_click(obj) {

      const btn_2 = document.getElementById('chartList2');
      const btn3 = document.getElementById('team_info');
      
/*       let top_name = document.querySelector('#team_name');
      let bottom_name = document.querySelector('.lo_userNm').textContent;
      top_name.value = bottom_name; */
      
      let top_name2 = document.querySelector('#team_name');
      top_name2.value =$(obj).children().first().text();
      console.log($(obj));
      let top_name = $(obj).children().first().text();
      
      console.log(top_name);
      
      $.ajax({
          url: 'https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/'+top_name+'?api_key='+api_key
        , dataType: 'json'//응답 데이터 타입
        , success: function (data_id) {//정상처리시 리턴 data에 담김
         
          id_code = data_id['id'];
          puid_code = data_id['puuid'];
          // return id_code;

          $.ajax({
              url: 'https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/'+id_code+'?api_key='+api_key
            , dataType: 'json'//응답 데이터 타입
            , success: function (res2) {//정상처리시 리턴 data에 담김
              console.log(res2);
              //let str = '';
              for (let i = 0; i < res2.length; i++) {

                let type = res2[i]['queueType'];
                if (type == 'RANKED_SOLO_5x5') {
                  //str += '<tr onclick="fn_click(this)">';
                 // str += '<tr onclick="fn_click()">';
                  
                  let rank_info = (res2[i]['tier'] + ' ' + res2[i]['rank'] + ' ' + res2[i]['wins'] + ' ' + res2[i]['losses']);
                  console.log(rank_info);
                  my_tier2 = (res2[i]['tier']);

                  if (my_tier2 == "CHALLENGER") {
                  img_src2 = '${pageContext.request.contextPath }/resources/ranked-emblem/emblem-challenger.png'
                }
                if (my_tier2 == "GRANDMASTER") {
                  img_src2 = '${pageContext.request.contextPath }/resources/ranked-emblem/emblem-grandmaster.png'
                }
                if (my_tier2 == "MASTER") {
                  img_src2 = '"${pageContext.request.contextPath }/resources/ranked-emblem/emblem-master.png'
                }
                if (my_tier2 == "DIAMOND") {
                  img_src2 = '${pageContext.request.contextPath }/resources/ranked-emblem/emblem-diamond.png'
                }
                if (my_tier2 == "EMERALD") {
              	  img_src2 = "${pageContext.request.contextPath }/resources/ranked-emblem/emblem-emerald.webp"
                }
                if (my_tier2 == "PLATINUM") {
                  img_src2 = '${pageContext.request.contextPath }/resources/ranked-emblem/emblem-platinum.png'
                }
                if (my_tier2 == "GOLD") {
                  img_src2 = '${pageContext.request.contextPath }/resources/ranked-emblem/emblem-gold.png'
                }
                if (my_tier2 == "SILVER") {
                  img_src2 = '${pageContext.request.contextPath }/resources/ranked-emblem/emblem-silver.png'
                }
                if (my_tier2 == "BRONZE") {
                  img_src2 = '${pageContext.request.contextPath }/resources/ranked-emblem/emblem-bronze.png'
                }
                if (my_tier2 == "IRON") {
                  img_src2 = '${pageContext.request.contextPath }/resources/ranked-emblem/emblem-iron.png'
                }

                }
               // document.getElementById('user_list2').innerHTML = str;
                document.getElementById('img2').src = img_src2
              }

            }, error(e) {
              console.log(e);
            }
          });
          $.ajax({
              url: 'https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/'+puid_code+'/ids?start=0&count=20&api_key='+api_key
            , dataType: 'json'//응답 데이터 타입
            , async: false
            , success: function (mi) {//정상처리시 리턴 data에 담김
              for (let j = 0; j < mi.length; j++) {
                $.ajax({
                    url: 'https://asia.api.riotgames.com/lol/match/v5/matches/'+mi[j]+'?api_key='+api_key
                  , dataType: 'json'//응답 데이터 타입
                  , async: false
                  , success: function (data) {
                    let v = data['info']['participants']
                    let str = '';


                    for (let i in v) {

                      if (top_name == v[i]['summonerName']) {
                        let sN = v[i]['summonerName']
                        let kill = v[i]['kills']
                        let death = v[i]['deaths']
                        let assi = v[i]['assists']
                        let kda = (v[i]['challenges']['kda'])
                        kda = Math.round(kda)
                        let teamLine = v[i]['teamPosition']
                        let cham_Nm = v[i]['championName']
                        let win = v[i]['win']
                        let rc = (sN + kill + death + assi + kda + teamLine + ' ' + cham_Nm)
                        str += '<tr';
                        if (win == true) {

                          str += ' style="background-color: rgb(54, 162, 235);"';
                        } else {
                          str += ' style="background-color: rgb(255, 99, 132);"';
                        }
                        str += '>';
                        str += '<td>' + sN + '</td>';
                        str += '<td>' + kill + '</td>';
                        str += '<td>' + death + '</td>';
                        str += '<td>' + assi + '</td>';
                        str += '<td>' + kda + '</td>';
                        str += '<td>' + teamLine + '</td>';
                        str += '<td>' + cham_Nm + '</td>';
                        str += '</tr>';
                        console.log(j, rc)
                        if (win == true) {
                          count2++
                        }
                        if (teamLine == "TOP") {
                          count2_top++
                        }
                        if (teamLine == "JUNGLE") {
                          count2_jungle++
                        }
                        if (teamLine == "MIDDLE") {
                          count2_midle++
                        }
                        if (teamLine == "BOTTOM") {
                          count2_bottom++
                        }
                        if (teamLine == "UTILITY") {
                          count2_utility++
                        }
                      }

                    }
                    
                    
                    document.getElementById('user_list_info').innerHTML += str;
                    document.getElementById('img2').src = img_src2;

                  }
                });
              }
              // 차트
              const data = {
                labels: [
                  'Win',
                  'Lose',

                ],
                datasets: [{
                  label: '최근 20판 전적',
                  data: [count2, 20 - count2],
                  backgroundColor: [
                    'rgb(54, 162, 235)',
                    'rgb(255, 99, 132)'

                  ],
                  hoverOffset: 4
                }]
              };
              const config = {
                type: 'pie',
                data: data,

              };
              const ctx = document.getElementById('user_Chart');
              let user_Chart = new Chart(ctx, config);

              //chartbar
              const data2 = {
                labels: ['Top', 'Jubgle', 'Midle', 'Bottom', 'Utility'],
                datasets: [{
                  label: 'My Position',
                  data: [count2_top, count2_jungle, count2_midle, count2_bottom, count2_utility],
                  backgroundColor: [
                    'rgba(0,191,255, 0.8)',
                    'rgba(0,191,255, 0.8)',
                    'rgba(0,191,255, 0.8)',
                    'rgba(0,191,255, 0.8)',
                    'rgba(0,191,255, 0.8)',

                  ],
                  borderColor: [
                    'rgba(0,191,255)',
                    'rgba(0,191,255)',
                    'rgba(0,191,255)',
                    'rgba(0,191,255)',
                    'rgba(0,191,255)',
                  ],
                  borderWidth: 1
                }]
              };
              const config2 = {
                type: 'bar',
                data: data2,
                options: {
                  scales: {
                    y: {
                      beginAtZero: true
                    }
                  }
                },
              };
              const ctx2 = document.getElementById('user_Chart_bar');
              let myChart_bar = new Chart(ctx2, config2);
            }
          });
          console.log(count2);
        }, error(e) {
          console.log(e);
        }
        
        
      });
      // btn1 숨기기 (display: none)
      if (btn3.style.display !== 'none') {
        btn3.style.display = 'none';
      }
      // btn` 보이기 (display: block)
      else {
        btn3.style.display = 'block';
      }
      if (btn_2.style.display !== 'none') {
        btn_2.style.display = 'none';
      }
      // btn` 보이기 (display: block)
      else {
        btn_2.style.display = 'block';
      }



    }

  </script>
</body>

</html>