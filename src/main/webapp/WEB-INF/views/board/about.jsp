<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../common/top.jsp" %>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cfc2659938c18d4229de7104b185fc76"></script>

<body>
<div class="container px-10 px-lg-5" style="text-align: center; margin-top: 100px; margin-bottom: 200px;">
	<div class="mb-3"> DYS GAMES 위치 안내 </div>
	<div id="map" style="width: 500px; height: 400px; margin: auto !important;"></div>
	<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.50383215398747 , 126.7449587804776), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
		
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter() 
		}); 
		// 지도에 마커를 표시합니다
		marker.setMap(map);
	</script>
	<div class="mt-3"><a href="https://map.kakao.com/link/to/상동호수공원, 37.50383215398747, 126.7449587804776" target='_blank'>찾아오시는 길</a></div>
</div>
</body>

<%@ include file="../common/footer.jsp" %>