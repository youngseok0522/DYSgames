const swiper = new Swiper('.swiper', {
  loop: true,
  // 페이징
  pagination: {
    el: '.swiper-pagination',
  },

  // 이전 & 다음
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },
  
  // 슬라이드 자동 재생
  autoplay: {
 	delay: 3500,
 	//상호작용 해도 슬라이드 자동재생 유지
 	disableOnInteraction: false,
  },
});

// 마우스 오버시 슬라이드 멈춤
let $slides = document.querySelectorAll('.swiper-slide');
for (let i of $slides){
	i.addEventListener('mouseover', function(){
		swiper.autoplay.stop();
	});
	i.addEventListener('mouseout', function(){
		swiper.autoplay.start();
	})
}